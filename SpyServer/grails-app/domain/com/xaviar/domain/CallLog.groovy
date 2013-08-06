package com.xaviar.domain


class CallLog {

	String id
	String phoneNumber;
	//ActionType actionType;
	String type;
	String duration;
	Date timeSeconds;

	static belongsTo = [targetPhone:TargetPhone]
	static mapping = {
		version false
		id generator: 'assigned',type:'string',name:'id'
	}

	static constraints = {
		phoneNumber nullable :true;
		type nullable :true;
		duration nullable :true;
		timeSeconds nullable :true;
	}
}
