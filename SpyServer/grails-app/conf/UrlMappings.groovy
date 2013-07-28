class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}	
		
		"/spy/createdata"(controller: "spy",parseRequest:true) {
			action = [POST: "createdata"]
		}
		
		"/spy/getdata"(controller: "spy") {
			action = [POST: "getdata"]
		}


		"/"(controller:"home",action:"/index")
		"500"(view:'/error')
		"404"(view:'/404-page')
	}
}
