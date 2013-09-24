package com.xaviar.domain;

import java.util.Date;

public class Location {

	Double latitude;
	Double longitude;
	String address;
	Date time;
	Double accuracyMeters;
	String provider;
	
	static belongsTo = [targetPhone:TargetPhone]
	static mapping = { version false;cache true; }
	
	static constraints = {
		latitude nullable :true;
		longitude nullable :true;
		time nullable :true;
		address nullable: true;
		accuracyMeters nullable :true;
		provider nullable: true;
	}
}
