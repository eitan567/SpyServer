package com.xaviar

import grails.converters.JSON

import org.codehaus.groovy.grails.web.json.JSONObject
import org.springframework.dao.DataIntegrityViolationException

import com.xaviar.domain.Contact;
import com.xaviar.domain.Sms;

import redis.clients.jedis.Jedis

class SmsController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def redisService
	def smsService
	def contactService
	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {

		def contacts = redisService.withRedis { Jedis redis ->
			redis.get("CONTACTS")
		}

		def smses = redisService.withRedis { Jedis redis ->
			redis.get("SMS")
		}

		if(smses!=null && contacts!=null){
			def jsonContacts = JSON.parse(contacts)
			def contactsList = jsonContacts.collect {JSONObject jsonObject ->
				new Contact(name: jsonObject.get("name"),number:jsonObject.get("number"),type:jsonObject.getAt("type"))
			}
			def jsonSmses = JSON.parse(smses)
			def smsesList = jsonSmses.collect {JSONObject jsonObject ->
				new Sms(address: jsonObject.get("address"),folderName:jsonObject.get("folderName"),smsId:jsonObject.getAt("id"),msg: jsonObject.get("msg"),readState:jsonObject.get("readState"),time:new Date(Long.parseLong(jsonObject.getAt("time"))))
			}
			Collections.reverse(smsesList);
			[contactInstanceList: contactsList.toList(), contactInstanceTotal: contactsList.size(),smsInstanceList: smsesList.toList(), smsInstanceTotal: smsesList.size()]
		}else{
			[contactInstanceList: null, contactInstanceTotal: 0,smsInstanceList: null, smsInstanceTotal: 0]
		}
	}

	def create() {
		[smsInstance: new Sms(params)]
	}

	def save() {
		def smsInstance = new Sms(params)
		if (!smsInstance.save(flush: true)) {
			render(view: "create", model: [smsInstance: smsInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'sms.label', default: 'Sms'),
			smsInstance.id
		])
		redirect(action: "show", id: smsInstance.id)
	}

	def show(Long id) {
		def smsInstance = Sms.get(id)
		if (!smsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'sms.label', default: 'Sms'),
				id
			])
			redirect(action: "list")
			return
		}

		[smsInstance: smsInstance]
	}

	def edit(Long id) {
		def smsInstance = Sms.get(id)
		if (!smsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'sms.label', default: 'Sms'),
				id
			])
			redirect(action: "list")
			return
		}

		[smsInstance: smsInstance]
	}

	def update(Long id, Long version) {
		def smsInstance = Sms.get(id)
		if (!smsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'sms.label', default: 'Sms'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (smsInstance.version > version) {
				smsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'sms.label', default: 'Sms')] as Object[],
						"Another user has updated this Sms while you were editing")
				render(view: "edit", model: [smsInstance: smsInstance])
				return
			}
		}

		smsInstance.properties = params

		if (!smsInstance.save(flush: true)) {
			render(view: "edit", model: [smsInstance: smsInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'sms.label', default: 'Sms'),
			smsInstance.id
		])
		redirect(action: "show", id: smsInstance.id)
	}

	def delete(Long id) {
		def smsInstance = Sms.get(id)
		if (!smsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'sms.label', default: 'Sms'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			smsInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'sms.label', default: 'Sms'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'sms.label', default: 'Sms'),
				id
			])
			redirect(action: "show", id: id)
		}
	}
}
