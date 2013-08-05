package com.org.krams.domain

class UMetaData {

	private String simSubscriberId;
	private String userName;
	private String password;
	private String token;

	public UMetaData(){
	}

	public UMetaData(String password, String simSubscriberId) {
		this.simSubscriberId = simSubscriberId;
		this.password = password;
	}

	public String getSimSubscriberId() {
		return simSubscriberId;
	}
	public void setSimSubscriberId(String simSubscriberId) {
		this.simSubscriberId = simSubscriberId;
	}

	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
}
