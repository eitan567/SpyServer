package com.xaviar.domain;

public class User {

	String fullname;
	String email;
	String address;
	String city;
	String country;
	String username;
	String password;
	
	static hasMany  = [targetPhones:TargetPhone,roles: Role, permissions: String]
	
	static mapping = {
		version false;
		cache true;
	}
		
	static constraints = {
		username(nullable: false, blank: false, unique: true)
		fullname(nullable: false, blank: false)
		email(nullable: false, blank: false)
		address(nullable: false, blank: false)
		city(nullable: false, blank: false)
		country(nullable: false, blank: false)
	}
}
