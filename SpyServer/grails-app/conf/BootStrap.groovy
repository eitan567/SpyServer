import grails.converters.JSON

import com.xaviar.domain.Role
import com.xaviar.domain.User


class BootStrap {
	def shiroSecurityService


	def init = { servletContext ->

		// Create the admin role
		def adminRole = Role.findByName('ROLE_ADMIN') ?:
				new Role(name: 'ROLE_ADMIN').save(flush: true, failOnError: true)

		// Create the user role
		def userRole = Role.findByName('ROLE_USER') ?:
				new Role(name: 'ROLE_USER').save(flush: true, failOnError: true)

		// Create an admin user
		def adminUser = User.findByUsername('admin') ?:
				new User(username: "admin",
				firstName: "eitan",
				lastName: "baron",
				email: "eitan2007@gmail.com",
				address: "harav kuk 29",
				city: "ashdod",
				country:"IL",
				password: shiroSecurityService.encodePassword('password'))
				.save(flush: true, failOnError: true)

		// Add roles to the admin user
		assert adminUser.addToRoles(adminRole)
		.addToRoles(userRole)
		.save(flush: true, failOnError: true)

		// Create an standard user
		def standardUser = User.findByUsername('joe') ?:
				new User(username: "joe",
				firstName: "joe",
				lastName: "baron",
				email: "eitan2007@gmail.com",
				address: "harav kuk 29",
				city: "ashdod",
				country:"IL",
				password: shiroSecurityService.encodePassword('password'))
				.save(flush: true, failOnError: true)

		// Add role to the standard user
		assert standardUser.addToRoles(userRole)
		.save(flush: true, failOnError: true)

		JSON.registerObjectMarshaller(Date) {
			return it?.format("EEEE d MMMM yyyy ,HH:mm")
		}

		//		JSON.registerObjectMarshaller(CallLog) {
		//
		//			String type= it.type;
		//			return type;
		//		}
	}


	def destroy = {
	}
}
