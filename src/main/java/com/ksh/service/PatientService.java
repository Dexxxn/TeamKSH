package com.ksh.service;

import com.ksh.model.PatientVO;
import com.ksh.model.ScheduleVO;

public interface PatientService {
	
	public void patientreg(PatientVO patient);
	
	public PatientVO secondVisit_patient(PatientVO patient);
	
	public void reserve(ScheduleVO schedule);
	
	public ScheduleVO reservationCheck(ScheduleVO schedule);
}
	