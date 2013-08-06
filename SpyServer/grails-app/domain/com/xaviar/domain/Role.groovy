package com.xaviar.domain;

//@XmlRootElement
//@Entity
public class Role {

	Integer role;
	
	static hasMany = [permissions:Permission]	
}
