package com.xaviar.domain;

import org.apache.commons.codec.binary.Base64

import com.spy.tools.SpyUtils

public class Contact {

	String name;
	String number;
	String type;
	String image;
	String countryCode;
	String recordState;
	String recordOrigin;

	static belongsTo = [targetPhone:TargetPhone]
	static mapping = {
		version false;
		image sqlType:'text(4294967295)';
		cache true;
	}

	static constraints = {
		name(nullable: true, blank: true)
		number(nullable: true, blank: true)
		type(nullable: true, blank: true)
		image(nullable: true, blank: true)
		countryCode(nullable: true, blank: true)
		recordState(nullable: true, blank: true)
		recordOrigin(nullable: true, blank: true)
	}

	public String getFormatedPhoneNumer(){
		return SpyUtils.formatPhoneNumber(this.number);
	}

	public byte[] getDecodedImage(){
		byte[] decodedImage = Base64.decodeBase64(this.image.getBytes());
		return decodedImage;
	}

	public setNumber(String number){
		this.number = SpyUtils.formatPhoneNumber(number);
	}
}
