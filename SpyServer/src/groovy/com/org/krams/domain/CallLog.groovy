package com.org.krams.domain

class CallLog {

	private String id;
	private String phoneNumber;
	private String type;
	private String duration;
	private String timeSeconds;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getTimeSeconds() {
		return timeSeconds;
	}
	public void setTimeSeconds(String timeSeconds) {
		this.timeSeconds = timeSeconds;
	}
}
