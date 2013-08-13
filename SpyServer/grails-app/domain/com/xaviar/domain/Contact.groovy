package com.xaviar.domain;

import com.spy.tools.SpyUtils
import org.apache.commons.codec.binary.Base64;

public class Contact {

	String name;
	String number;
	String type;
	String image;
	//NumberType type;
	
	static belongsTo = [targetPhone:TargetPhone]
	static mapping = { 
		version false
		image sqlType:'text(4294967295)';
	}
	
	static constraints = {
		name nullable :true;
		number nullable :true;
		type nullable :true;
		image nullable :true;
	}
	
	public String getFormatedPhoneNumer(){
		return SpyUtils.formatPhoneNumber(this.number);
	}	
	
	public byte[] getDecodedImage(){
		byte[] decodedImage = Base64.decodeBase64(this.image.getBytes());
		return decodedImage;
	}
}
