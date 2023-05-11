package com.ksh.service;

import com.ksh.model.PatientVO;
import com.ksh.model.ScheduleVO;

public interface PatientService {
	
	// 초진 환자 정보 insert하기 
	public void patientreg(PatientVO patient);
	
	// 재진 환자 정보 select해오기
	public PatientVO secondVisit_patient(PatientVO patient);
	
	// 예약등록
	public void reserve(ScheduleVO schedule);
	
	// 예약 조회
	public ScheduleVO reservationCheck(ScheduleVO schedule);
	
	//환자등록 중복유무 체크
	public int already_patient_chk(String patientIdNum);
	

}
	