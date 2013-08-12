package com.xaviar.domain;

import com.spy.tools.SpyUtils

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
	
	public String getFormatedPhoneNumer(){
		return SpyUtils.formatPhoneNumber(this.number);
	}	
}
