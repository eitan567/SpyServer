package com.xaviar

import org.apache.shiro.SecurityUtils
import org.apache.shiro.authc.UsernamePasswordToken

import com.xaviar.domain.Role
import com.xaviar.domain.User

class SignupController {
    def shiroSecurityService
 
    def index() {
        User user = new User()
        [user: user]
    }
 
    def register() {

        // Check to see if the username already exists
        def user = User.findByUsername(params.username)
        if (user) {
            flash.message = "User already exists with the username '${params.username}'"
            redirect(controler:"auth", action: "login", params: params)
        }

        // User doesn't exist with username. Let's create one
        else {

            // Make sure the passwords match
            if (params.password != params.password2) {
                flash.message = "Passwords do not match"
                redirect(controler:"auth",action: "login", params: params)
            }

            // Passwords match. Let's attempt to save the user
            else {
                // Create user
                user = new User(
                        username: params.username,
						password: shiroSecurityService.encodePassword(params.password)
                )

                if (user.save()) {

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
}