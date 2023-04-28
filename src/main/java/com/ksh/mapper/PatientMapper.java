package com.ksh.mapper;

import com.ksh.model.PatientVO;
import com.ksh.model.ScheduleVO;

public interface PatientMapper {
	
	public void patientreg(PatientVO patient);
	public PatientVO secondVisit_patient(PatientVO patient);
	public void reserve(ScheduleVO schedule);
}
