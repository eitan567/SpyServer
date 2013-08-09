package com.xaviar.domain;

import com.spy.tools.SpyUtils;
 

public class Sms {

	String readState;
	Date time;
	String address;
	String folderName;
	String msg;

	static belongsTo = [targetPhone:TargetPhone]
	static mapping = {
		version false
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
	
	public String getFormatedPhoneNumer(){
		return SpyUtils.formatPhoneNumber(this.address);
	}
	
	public String getFormatedDate(){
		return this.time.format("EEEE d MMMM yyyy ,HH:mm");
	}
}
