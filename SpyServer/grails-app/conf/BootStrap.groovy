import grails.converters.JSON;


class BootStrap {

    def init = { servletContext ->
		
		JSON.registerObjectMarshaller(Date) {
			return it?.format("EEEE d MMMM yyyy ,HH:mm")
		}
    }
	
	
    def destroy = {
    }		
}
