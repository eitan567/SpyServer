package com.xaviar

import grails.converters.JSON

import org.codehaus.groovy.grails.web.json.JSONObject
import org.junit.Before;
import org.springframework.dao.DataIntegrityViolationException

import redis.clients.jedis.Jedis

import com.org.krams.domain.Contact
import com.org.krams.domain.UMetaData

class ContactController extends BaseController{

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def redisService
	def contactService
	def userService
	
	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {		
		Set<String> subscribers = userService.getUserInfo("token123");
		UMetaData  uMetaData = new UMetaData(subscribers.toArray()[0],"token123");

		def contacts = contactService.readAll(uMetaData);

		if(contacts!=null){			
			params.max = Math.min(max ?: 10, 100)
			int startOffset = params.get("offset")!=null ? Integer.parseInt(params.get("offset")) : 0 ;
			int toElement=10;
			if(max!=null){
				toElement = (startOffset + max) > contacts.size() ? contacts.size() : startOffset + max;
			}
			[contactInstanceList: contacts.subList(startOffset,toElement), contactInstanceTotal: contacts.size()]
		}else{
			[contactInstanceList: null, contactInstanceTotal: 0]
		}
	}

	def create() {
		[contactInstance: new Contact(params)]
	}

	def save() {
		def contactInstance = new Contact(params)
		if (!contactInstance.save(flush: true)) {
			render(view: "create", model: [contactInstance: contactInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'contact.label', default: 'Contact'),
			contactInstance.id
		])
		redirect(action: "show", id: contactInstance.id)
	}

	def show(String id) {

		Set<String> subscribers = userService.getUserInfo("129");
		UMetaData  uMetaData = new UMetaData(subscribers.toArray()[0],"129");

		def contactInstance = contactService.read(id);

		//		def contacts = redisService.withRedis { Jedis redis ->
		//			redis.get("CONTACTS")
		//		}
		//		def contactInstance =null;;
		//		def jsonContacts= JSON.parse(contacts)
		//		for (JSONObject jsonObject : jsonContacts) {
		//			if(contactName.equalsIgnoreCase(jsonObject.get('name'))){
		//				contactInstance = (Contact)jsonObject;
		//				break;
		//			}
		//		}
		//		//def contactInstance =jsonContacts.find {JSONObject jsonObject -> new Contact(name: contactName,number:phoneNumber,type:phoneType)}
		//		//Contact contact = new Contact(contactInstance.getProperties());
		//		if (!contactInstance) {
		//			flash.message = message(code: 'default.not.found.message', args: [
		//				message(code: 'contact.label', default: 'Contact'),
		//				id
		//			])
		//			redirect(action: "list")
		//			return
		//		}

		[contactInstance: contactInstance]
	}

	def edit(Long id) {
		def contactInstance = Contact.get(id)
		if (!contactInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'contact.label', default: 'Contact'),
				id
			])
			redirect(action: "list")
			return
		}

		[contactInstance: contactInstance]
	}

	def update(Long id, Long version) {
		def contactInstance = Contact.get(id)
		if (!contactInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'contact.label', default: 'Contact'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (contactInstance.version > version) {
				contactInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'contact.label', default: 'Contact')] as Object[],
						"Another user has updated this Contact while you were editing")
				render(view: "edit", model: [contactInstance: contactInstance])
				return
			}
		}

		contactInstance.properties = params

		if (!contactInstance.save(flush: true)) {
			render(view: "edit", model: [contactInstance: contactInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'contact.label', default: 'Contact'),
			contactInstance.id
		])
		redirect(action: "show", id: contactInstance.id)
	}

	def delete(Long id) {
		def contactInstance = Contact.get(id)
		if (!contactInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'contact.label', default: 'Contact'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			contactInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'contact.label', default: 'Contact'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'contact.label', default: 'Contact'),
				id
			])
			redirect(action: "show", id: id)
		}
	}
}
