package com.ksh.model;

public class MedicalVO {
	
	private String s_id;
	private String s_password;
	private String s_name;
	private String s_phone; 
	private String s_dept;
	private String s_job;
	private String s_type;
	private String s_date;
	private String s_startTime;
	private String s_endTime;
	private String s_place;
	private String s_memo;
	
	
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public String getS_password() {
		return s_password;
	}
	public void setS_password(String s_password) {
		this.s_password = s_password;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_phone() {
		return s_phone;
	}
	public void setS_phone(String s_phone) {
		this.s_phone = s_phone;
	}
	public String getS_dept() {
		return s_dept;
	}
	public void setS_dept(String s_dept) {
		this.s_dept = s_dept;
	}
	public String getS_job() {
		return s_job;
	}
	public void setS_job(String s_job) {
		this.s_job = s_job;
	}
	public String getS_type() {
		return s_type;
	}
	public void setS_type(String s_type) {
		this.s_type = s_type;
	}
	public String getS_date() {
		return s_date;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}
	public String getS_startTime() {
		return s_startTime;
	}
	public void setS_startTime(String s_startTime) {
		this.s_startTime = s_startTime;
	}
	public String getS_endTime() {
		return s_endTime;
	}
	public void setS_endTime(String s_endTime) {
		this.s_endTime = s_endTime;
	}
	public String getS_place() {
		return s_place;
	}
	public void setS_place(String s_place) {
		this.s_place = s_place;
	}
	public String getS_memo() {
		return s_memo;
	}
	public void setS_memo(String s_memo) {
		this.s_memo = s_memo;
	}
	
	@Override
	public String toString() {
		return "MedicalVO [s_id=" + s_id + ", s_password=" + s_password + ", s_name=" + s_name + ", s_phone=" + s_phone
				+ ", s_dept=" + s_dept + ", s_job=" + s_job + ", s_type=" + s_type + ", s_date=" + s_date
				+ ", s_startTime=" + s_startTime + ", s_endTime=" + s_endTime + ", s_place=" + s_place + ", s_memo="
				+ s_memo + "]";
	}
	
	

}
