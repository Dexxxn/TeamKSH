package com.ksh.mapper;

import com.ksh.model.PatientVO;
import com.ksh.model.ScheduleVO;

public interface PatientMapper {
	
	public void patientreg(PatientVO patient);
	public PatientVO secondVisit_patient(PatientVO patient);
	public void reserve(ScheduleVO schedule);
	public ScheduleVO reservationCheck(ScheduleVO schedule);
	
	//환자 등록 유무 체크
	public int already_patient_chk(String patientIdNum);

}
