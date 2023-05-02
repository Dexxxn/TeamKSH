package com.ksh.model;

public class ScheduleVO {
	
	private int s_no;
	private String s_type;
	private String s_date;
	private String s_startTime;
	private String s_endTime;
	private String s_memo;
	private String s_doctor;
	private String s_patient;
	
	private PatientVO patientVO;
	
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
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
	public String getS_memo() {
		return s_memo;
	}
	public void setS_memo(String s_memo) {
		this.s_memo = s_memo;
	}
	public String getS_doctor() {
		return s_doctor;
	}
	public void setS_doctor(String s_doctor) {
		this.s_doctor = s_doctor;
	}
	public String getS_patient() {
		return s_patient;
	}
	public void setS_patient(String s_patient) {
		this.s_patient = s_patient;
	}
	public PatientVO getPatientVO() {
		return patientVO;
	}
	public void setPatientVO(PatientVO patientVO) {
		this.patientVO = patientVO;
	}
	@Override
	public String toString() {
		return "ScheduleVO [s_no=" + s_no + ", s_type=" + s_type + ", s_date=" + s_date + ", s_startTime=" + s_startTime
				+ ", s_endTime=" + s_endTime + ", s_memo=" + s_memo + ", s_doctor=" + s_doctor + ", s_patient="
				+ s_patient + ", patientVO=" + patientVO + "]";
	}
	
	
}
