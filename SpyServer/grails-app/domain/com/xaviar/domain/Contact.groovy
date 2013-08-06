package com.xaviar.domain;

public class Contact {

	String name;
	String number;
	String type;
	//NumberType type;
	
	static belongsTo = [targetPhone:TargetPhone]
	static mapping = { version false }
	
	static constraints = {
		name nullable :true;
		number nullable :true;
		type nullable :true;
	}
	
}
