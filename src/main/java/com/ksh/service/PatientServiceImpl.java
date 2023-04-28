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
	
}
