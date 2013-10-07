package com.xaviar

import org.apache.shiro.SecurityUtils
import org.apache.shiro.authc.AuthenticationException
import org.apache.shiro.authc.UsernamePasswordToken
import org.apache.shiro.web.util.WebUtils

import com.xaviar.domain.Role
import com.xaviar.domain.User

class AuthController {
	def shiroSecurityManager
	def shiroSecurityService

	def index = { redirect(action: "login", params: params) }

	def login = {
		User user = new User()
		return [ user: user,username: params.username, rememberMe: (params.rememberMe != null), targetUri: params.targetUri ]
	}
	
	def signIn = {
		def authToken = new UsernamePasswordToken(params.username, params.password as String)

		// Support for "remember me"
		if (params.rememberMe) {
			authToken.rememberMe = true
		}

		// If a controller redirected to this page, redirect back
		// to it. Otherwise redirect to the root URI.
		def targetUri = params.targetUri ?: "/"

		// Handle requests saved by Shiro filters.
		def savedRequest = WebUtils.getSavedRequest(request)
		if (savedRequest) {
			targetUri = savedRequest.requestURI - request.contextPath
			if (savedRequest.queryString) targetUri = targetUri + '?' + savedRequest.queryString
		}

		try{
			// Perform the actual login. An AuthenticationException
			// will be thrown if the username is unrecognised or the
			// password is incorrect.
			SecurityUtils.subject.login(authToken)

			log.info "Redirecting to '${targetUri}'."
			redirect(uri: targetUri)
		}
		catch (AuthenticationException ex){
			// Authentication failed, so display the appropriate message
			// on the login page.
			log.info "Authentication failure for user '${params.username}'."
			flash.message = message(code: "login.failed")

			// Keep the username and "remember me" setting so that the
			// user doesn't have to enter them again.
			def m = [ username: params.username ]
			if (params.rememberMe) {
				m["rememberMe"] = true
			}

			// Remember the target URI too.
			if (params.targetUri) {
				m["targetUri"] = params.targetUri
			}

			// Now redirect back to the login page.
			redirect(action: "login", params: m)
		}
	}

	def signOut = {
		// Log the user out of the application.
		SecurityUtils.subject?.logout()

		// For now, redirect back to the home page.
		redirect(action: "login", params: params)
	}

	def register() {

		// If a controller redirected to this page, redirect back
		// to it. Otherwise redirect to the root URI.
		def targetUri = params.registerTargetUri ?: "/"
		
		// Handle requests saved by Shiro filters.
		def savedRequest = WebUtils.getSavedRequest(request)
		if (savedRequest) {
			targetUri = savedRequest.requestURI - request.contextPath
			if (savedRequest.queryString) targetUri = targetUri + '?' + savedRequest.queryString
		}
		
		// Check to see if the username already exists
		def user = User.findByUsername(params.username)
		if (user) {
			flash.message = "User already exists with the username '${params.username}'"
			params.loginMode="register"
			redirect(action: "login", params: params)
		}

		// User doesn't exist with username. Let's create one
		else {

			// Make sure the passwords match
			if (params.password != params.password2) {
				flash.message = "Passwords do not match"
				params.loginMode="register"
				redirect(action: "login", params: params)
			}

			// Passwords match. Let's attempt to save the user
			else {
				// Create user
				user = new User(
					username: params.username,
					firstName: params.firstName,
					lastName: params.lastName,
					birthDate: params.birthDate!=null ? new Date(params.birthDate):null,
					occupation: params.occupation,
					email: params.email,
					number: params.number,
					type: params.type,
					country: params.country,
					more: params.more,
					siteURL: params.siteURL,
					address: params.address,
					city: params.city,
					password: shiroSecurityService.encodePassword(params.password)
				)

				if (user.save(flush: true, failOnError: true)) {

					// Add USER role to new user
					user.addToRoles(Role.findByName('ROLE_USER'))

					// Login user
					def authToken = new UsernamePasswordToken(user.username, params.password)
					SecurityUtils.subject.login(authToken)

					//redirect(controller: 'home', action: 'secured')
					redirect(uri: targetUri)
				}
				else {

				}
			}
		}
	}
	
	def lockscreen = {
		def username  = SecurityUtils.subject?.principal
		def user = User.findByUsername(username);
		[user:user]
	}

	def unauthorized = { render "You do not have permission to access this page." }
}
