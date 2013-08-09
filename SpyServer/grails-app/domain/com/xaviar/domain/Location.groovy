package com.xaviar.domain;

import java.util.Date;

public class Location {

	Double latitude;
	Double longitude;
	Date time;
	
	static belongsTo = [targetPhone:TargetPhone]
	static mapping = { version false }
	
	static constraints = {
		latitude nullable :true;
		longitude nullable :true;
		time nullable :true;
	}
}
