
package com.xaviar
import grails.test.mixin.*

import org.junit.*

import com.org.krams.domain.Sms

@TestFor(SmsController)
@Mock(Sms)
class SmsControllerTests {

	def populateValidParams(params) {
		assert params != null
		// TODO: Populate valid properties like...
		//params["name"] = 'someValidName'
	}

	void testIndex() {
		controller.index()
		assert "/sms/list" == response.redirectedUrl
	}

	void testList() {

		def model = controller.list()

		assert model.smsInstanceList.size() == 0
		assert model.smsInstanceTotal == 0
	}

	void testCreate() {
		def model = controller.create()

		assert model.smsInstance != null
	}

	void testSave() {
		controller.save()

		assert model.smsInstance != null
		assert view == '/sms/create'

		response.reset()

		populateValidParams(params)
		controller.save()

		assert response.redirectedUrl == '/sms/show/1'
		assert controller.flash.message != null
		assert Sms.count() == 1
	}

	void testShow() {
		controller.show()

		assert flash.message != null
		assert response.redirectedUrl == '/sms/list'

		populateValidParams(params)
		def sms = new Sms(params)

		assert sms.save() != null

		params.id = sms.id

		def model = controller.show()

		assert model.smsInstance == sms
	}

	void testEdit() {
		controller.edit()

		assert flash.message != null
		assert response.redirectedUrl == '/sms/list'

		populateValidParams(params)
		def sms = new Sms(params)

		assert sms.save() != null

		params.id = sms.id

		def model = controller.edit()

		assert model.smsInstance == sms
	}

	void testUpdate() {
		controller.update()

		assert flash.message != null
		assert response.redirectedUrl == '/sms/list'

		response.reset()

		populateValidParams(params)
		def sms = new Sms(params)

		assert sms.save() != null

		// test invalid parameters in update
		params.id = sms.id
		//TODO: add invalid values to params object

		controller.update()

		assert view == "/sms/edit"
		assert model.smsInstance != null

		sms.clearErrors()

		populateValidParams(params)
		controller.update()

		assert response.redirectedUrl == "/sms/show/$sms.id"
		assert flash.message != null

		//test outdated version number
		response.reset()
		sms.clearErrors()

		populateValidParams(params)
		params.id = sms.id
		params.version = -1
		controller.update()

		assert view == "/sms/edit"
		assert model.smsInstance != null
		assert model.smsInstance.errors.getFieldError('version')
		assert flash.message != null
	}

	void testDelete() {
		controller.delete()
		assert flash.message != null
		assert response.redirectedUrl == '/sms/list'

		response.reset()

		populateValidParams(params)
		def sms = new Sms(params)

		assert sms.save() != null
		assert Sms.count() == 1

		params.id = sms.id

		controller.delete()

		assert Sms.count() == 0
		assert Sms.get(sms.id) == null
		assert response.redirectedUrl == '/sms/list'
	}
}
