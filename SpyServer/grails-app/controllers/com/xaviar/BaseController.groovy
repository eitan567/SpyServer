package com.xaviar

class BaseController {

	def beforeInterceptor = [action: this.&auth, except: 'list']

	// defined with private scope, so it's not considered an action
	private auth() {
		session.user = 129
		if (!session.user) {
			redirect(action: 'list')
			return false
		}
	}

	def index() { }
}
