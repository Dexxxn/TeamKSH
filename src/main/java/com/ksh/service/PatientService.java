package com.ksh.service;

import com.ksh.model.PatientVO;

public interface PatientService {
	
	public void patientreg(PatientVO patient);
	
	public PatientVO secondVisit_patient(PatientVO patient);
	
	/*public PatientVO reserve(PatientVO patient ScheduleVO schedule);*/
}
	