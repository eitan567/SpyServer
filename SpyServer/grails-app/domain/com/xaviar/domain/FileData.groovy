package com.xaviar.domain

import org.apache.commons.codec.binary.Base64;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import com.sun.xml.internal.org.jvnet.staxex.Base64Encoder;

class FileData {
	
	String data;
	String type;
	String name;
	
	static mapping = {
		version false
		id name:'name', type:'string', generator: 'assigned'
		data sqlType:'text(4294967295)';
	}

	static constraints = {
		data nullable :false;
		type nullable :false;
		name nullable :false;
	}
	
	public byte[] getDecodedPic(){
		byte[] decoded = Base64.decodeBase64(this.data.getBytes());
		return decoded; 
	}
}
