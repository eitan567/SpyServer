package com.xaviar.domain;

public class Sms {

	String readState;
	Date time;
	String address;
	String folderName;
	String msg;
	
	static belongsTo = [targetPhone:TargetPhone]
	static mapping = { version false
		id generator: 'assigned'
		msg sqlType:'text(50000) collate utf8mb4_general_ci';
	}
	
	static constraints = {
		readState nullable :true;
		time nullable :true;
		address nullable :true;
		folderName nullable :true;
		msg nullable :true;
	}
}
