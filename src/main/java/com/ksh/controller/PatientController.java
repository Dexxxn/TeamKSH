package com.ksh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String patientPost(PatientVO patient) {
		System.out.println(patient);
		ps.patientreg(patient);
		return "aside";
		
	}
	
	//https://dlgkstjq623.tistory.com/335
	
	// https://nahosung.tistory.com/74
	// 내원했던 고객이면 alert해주기("재진 환자입니다") //https://sseozzzy.tistory.com/139
	 /*@RequestMapping(value = "/patientF", method = RequestMethod.POST)
		public String patientPost(PatientVO patient, 
								@RequestParam(value="p_name", required=true) String p_name,
								@RequestParam(value="p_no", required=true) String p_no, 
								HttpServletRequest request,
								HttpServletResponse response) throws Exception{
		 			
		 	String url ="";
		 	PatientVO pt = (PatientVO)request.getSession().getAttribute("patient");
	 
	 		
			//try{
				if(pt != null) {
					request.setAttribute("msg", "기 내원 환자입니다.");
					return "alert";
				}//else {
					request.setAttribute("msg","초진 등록 진행");
				//}
			//}catch(Exception e) {
				
			//}
			return "";
			
	 }*/

	
	// 아이디 중복 체크
		 @ResponseBody
		 @RequestMapping(value="/idChk", method = RequestMethod.POST)
		 public int idChk(PatientVO patient) throws Exception {
		 	int result = ps.already_patient_chk(patient);
		 	return result;
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
		model.addAttribute("OC_reservation", ps.reservationCheck(schedule));
		ps.reservationCheck(schedule);
		return "aside";
	}
	
	
	
}
