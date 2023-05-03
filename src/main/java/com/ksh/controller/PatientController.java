package com.ksh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksh.model.PatientVO;
import com.ksh.model.ScheduleVO;
import com.ksh.service.PatientService;

@Controller
public class PatientController {
	
	// 비즈니스 모델을 컨트롤러에 연결하기
	@Autowired
	PatientService ps;
	
	
	
	// 초진 환자 정보 insert하기 
	@RequestMapping(value = "/patientF", method = RequestMethod.POST)
	public String patientPost(PatientVO patient) {
		System.out.println(patient);
		ps.patientreg(patient);
		return "aside";
		
	}
	
	
	// 재진 환자 정보 select해오기
	@RequestMapping(value = "/patientS", method = RequestMethod.POST)
	public String patientCheck(Model model, PatientVO patient) {
		System.out.println("aaaaa");
		System.out.println("patient="+patient);
		model.addAttribute("patientInfo", ps.secondVisit_patient(patient));
		ps.secondVisit_patient(patient);
		
		return "aside";
	}
	
	// 예약등록 
	@RequestMapping(value = "/reserve", method = RequestMethod.POST)
	public String InsertReservation(ScheduleVO schedule) {
		System.out.println("bbb");
		System.out.println("patient="+schedule);
		ps.reserve(schedule);
		return "redirect:/aside"; // redirect안쓰면 브라우저 새로고침 시 데이터 계속 들어감
	}
	
	// 예약 조회
	@RequestMapping(value = "/reservationCheck", method = RequestMethod.POST)
	public String selectReservation(Model model, ScheduleVO schedule) {
		System.out.println("bbb");
		System.out.println("patient="+schedule);
		model.addAttribute("OCreservation", ps.reservationCheck(schedule));
		ps.reservationCheck(schedule);
		return "aside";
	}
	
	
	
}
