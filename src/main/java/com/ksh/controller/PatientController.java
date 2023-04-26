package com.ksh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksh.model.PatientVO;
import com.ksh.service.PatientService;

@Controller
public class PatientController {
	
	// 비즈니스 모델을 컨트롤러에 연결하기
	@Autowired
	PatientService ps;
	
	@RequestMapping(value = "/patientInfo", method = RequestMethod.POST)
	public String patientCheck(Model model, PatientVO patient) {
		model.addAttribute("patientInfo", ps.secondVisit_patient(patient));
		ps.secondVisit_patient(patient);
		return "aside";
	}
	
}
