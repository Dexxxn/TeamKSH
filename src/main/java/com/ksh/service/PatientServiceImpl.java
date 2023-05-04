package com.ksh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ksh.mapper.PatientMapper;
import com.ksh.model.PatientVO;
import com.ksh.model.ScheduleVO;

@Service
public class PatientServiceImpl implements PatientService {
	
	@Autowired
	PatientMapper pm;
	
	public void patientreg(PatientVO patient) {
		pm.patientreg(patient);
	}
	
	
	public PatientVO secondVisit_patient(PatientVO patient) {
		 return pm.secondVisit_patient(patient);
	}
	
	
	public void reserve(ScheduleVO schedule){
		pm.reserve(schedule);
	}
	
	public ScheduleVO reservationCheck(ScheduleVO schedule){
		return pm.reservationCheck(schedule);
	}
	
	//환자 등록 유무 체크
	public int already_patient_chk(PatientVO patient) {
		int result = pm.already_patient_chk(patient);
		return result;
	}
	
}
