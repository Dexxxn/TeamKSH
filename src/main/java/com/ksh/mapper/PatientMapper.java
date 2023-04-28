package com.ksh.mapper;

import com.ksh.model.PatientVO;

public interface PatientMapper {
	
	public void patientreg(PatientVO patient);
	public PatientVO secondVisit_patient(PatientVO patient);
	/*public PatientVO reserve(PatientVO patient);*/
}
