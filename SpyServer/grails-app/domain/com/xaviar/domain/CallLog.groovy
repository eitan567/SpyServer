package com.xaviar.domain

import com.spy.tools.SpyUtils


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

	public String getFormatedPhoneNumer(){
		return SpyUtils.formatPhoneNumber(this.phoneNumber);
	}

	public String getFormatedPeriod(){
		int seconds = Integer.parseInt(this.duration);
		return SpyUtils.formatPeriod(seconds);
	}
	
	public String getFormatedDate(){
		return this.timeSeconds.format("EEEE d MMMM yyyy ,HH:mm");
	}

}
