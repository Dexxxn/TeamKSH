package com.ksh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String patientPost(PatientVO patient, Model model) {
		System.out.println(patient);
		ps.patientreg(patient);
		model.addAttribute("msg", "초진환자 정보 등록완료");
		model.addAttribute("url", "index");
		return "alert";
	}
	
	
	
	 // 환자등록 중복유무 체크
	 @ResponseBody // ajax 값을 바로 jsp로 보내기 위해 사용
	 @PostMapping("/idChk")
	 public int idChk(String patientIdNum) throws Exception {
	 	int result = ps.already_patient_chk(patientIdNum);
	 	return result;
	 }
	 
	 
	 
	// 재진 환자 정보 select해오기
	@RequestMapping(value = "/patientS", method = RequestMethod.POST)
	public String patientCheck(Model model, PatientVO patient) {
		System.out.println("aaaaa");
		System.out.println("patient="+patient);
		model.addAttribute("patientInfo", ps.secondVisit_patient(patient));
		ps.secondVisit_patient(patient);
		
		return "index";
	}
	
	
	// 예약등록
	@RequestMapping(value = "/reserve", method = RequestMethod.POST)
	public String InsertReservation(ScheduleVO schedule, Model model) {
		System.out.println("bbb");
		System.out.println("patient="+schedule);
		ps.reserve(schedule);
		model.addAttribute("msg", "외래진료 예약 완료");
		model.addAttribute("url", "index");
		return "alert"; // redirect안쓰면 브라우저 새로고침 시 데이터 계속 들어감
	}
	
	
	// 예약 조회
	@RequestMapping(value = "/reservationCheck", method = RequestMethod.POST)
	public String selectReservation(Model model, ScheduleVO schedule) {
		System.out.println("bbb");
		System.out.println("patient="+schedule);

		ScheduleVO reservation = ps.reservationCheck(schedule);
	    if (reservation == null) {
	        model.addAttribute("msg", "예약 내역 없음");
	        model.addAttribute("url", "index");
	        return"alert";
	    } else {
	        model.addAttribute("OC_reservation", reservation);
	    }
	    return "index";
	}
	
	
	
}
