package com.xaviar.domain;

//@XmlRootElement
//@Entity
public class User {

	String firstName;
	String lastName;
	String username;
	String password;
	
	static hasMany  = [targetPhones:TargetPhone]
	static hasOne = Role
		
}
