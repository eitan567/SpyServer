package com.xaviar.domain

import com.spy.tools.SpyUtils


class CallLog {

	String id
	String phoneNumber;
	String type;
	int duration;
	Date timeSeconds;
	String countryCode;
	String formatedDuration;
	String recordState;
	String recordOrigin;
	
	static belongsTo = [targetPhone:TargetPhone]
	static mapping = {
		version false;
		id generator: 'assigned',type:'string',name:'id';
		cache true;
	}

	static constraints = {
		phoneNumber nullable :true;
		type nullable :true;
		duration nullable :true;
		timeSeconds nullable :true;
		countryCode nullable :true; 
		formatedDuration nullable :true;
		recordState nullable :true;
		recordOrigin nullable :true;
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

	public setPhoneNumber(String number){
		this.phoneNumber = SpyUtils.formatPhoneNumber(number);
	}	
	
	public void setDuration(int duration){		
		this.duration = duration;
		this.formatedDuration = SpyUtils.formatPeriod(duration);
	}
	
	public int getDuration(){
		return this.duration;
	}
	
}
