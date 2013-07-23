package com.org.krams.domain

class UMetaData {

	private String simSubscriberId;
	private String userId;

	public UMetaData(String simSubscriberId, String userId) {
		super();
		this.simSubscriberId = simSubscriberId;
		this.userId = userId;
	}

	public String getSimSubscriberId() {
		return simSubscriberId;
	}
	public void setSimSubscriberId(String simSubscriberId) {
		this.simSubscriberId = simSubscriberId;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}
