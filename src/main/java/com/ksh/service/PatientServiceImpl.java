package com.ksh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ksh.mapper.PatientMapper;
import com.ksh.model.PatientVO;

@Service
public class PatientServiceImpl implements PatientService {
	
	@Autowired
	PatientMapper pm;
	
	@Override
	public PatientVO secondVisit_patient(PatientVO patient) {
		 return pm.secondVisit_patient(patient);
		 
	}
	
}
