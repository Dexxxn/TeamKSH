package com.ksh.service;

import com.ksh.model.PatientVO;
import com.ksh.model.ScheduleVO;

public interface PatientService {
	
	public void patientreg(PatientVO patient);
	
	public PatientVO secondVisit_patient(PatientVO patient);
	
	public void reserve(ScheduleVO schedule);
	
	public ScheduleVO reservationCheck(ScheduleVO schedule);
	
	//환자등록 유무 체크
	public int already_patient_chk(PatientVO patient);
}
	