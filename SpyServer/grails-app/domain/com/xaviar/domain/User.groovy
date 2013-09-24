package com.xaviar.domain;

import com.spy.tools.SpyUtils;

public class User {

	String firstName;
	String lastName;
	String email;
	String address;
	String city;
	String country;
	String username;
	String password;
	String image;
	Date birthDate;
	String occupation;
	String siteURL;
	String number;
	String type;
	String more;
	
	static hasMany  = [targetPhones:TargetPhone,roles: Role, permissions: String]
	
	static mapping = {
		version false;
		cache true;
		image sqlType:'text(4294967295)';
	}
		
	static constraints = {
		username(nullable: false, blank: false, unique: true)
		firstName(nullable: false, blank: false)
		lastName(nullable: false, blank: false)
		email(nullable: true, blank: true)
		address(nullable: true, blank: true)
		city(nullable: true, blank: true)
		country(nullable: true, blank: true)
		birthDate(nullable: true, blank: true)
		occupation(nullable: true, blank: true)
		siteURL(nullable: true, blank: true)
		number(nullable: true, blank: true)
		type(nullable: true, blank: true)
		more(nullable: true, blank: true)
		image(nullable: true, blank: true)
	}
	
	public String getFormatedMobile(){
		return SpyUtils.formatPhoneNumber(this.mobile);
	}
}
