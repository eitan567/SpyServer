import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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
			SimpleDateFormat dateFormatHE = new SimpleDateFormat("EEEE d MMMM yyyy ,HH:mm", new Locale("he"));
			//SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");

//			try {
//				date = dateFormatHE.parse(it.toString());
//			} catch (ParseException e) {
//				log.warn("Input date was not correct. Can not localize it.");
//				return it;
//			}
			return dateFormatHE.format(it);
			//return it?.format("EEEE d MMMM yyyy ,HH:mm")
		}		
	}


	def destroy = {
	}
}
