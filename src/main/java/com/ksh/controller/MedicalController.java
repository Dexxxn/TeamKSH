package com.ksh.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksh.service.MedicalService;
import com.ksh.model.MedicalVO;
import com.ksh.model.ScheduleVO;

@Controller
public class MedicalController {
	
	// 비즈니스 모델을 컨트롤러에 연결하기
	@Autowired
	MedicalService ms;
/*	
	@RequestMapping(value = "/popup", method = RequestMethod.GET)
	public String medical(Model model, MedicalVO medical) {
		System.out.println("aaaaa");
		System.out.println("medical="+medical);
		ms.medical(medical);
		model.addAttribute("medical", ms.medical(medical));
		
		return "popUp";
	}*/
 
	@RequestMapping(value = "/popup/{s_dept}", method = RequestMethod.GET)
	// ResponseEntity: 비동기식은 결과가 js로 가기때문에 통신상태를 확인하기 위해 통신상태를 함께 보냄
	public ResponseEntity<ArrayList<MedicalVO>> getList(@PathVariable("s_dept") String s_dept){
		MedicalVO mvo = new MedicalVO();	// mapper.xml(if문 가공)에서 String s_dept(단순 변수) 처리 못함 반드시 VO에담아서 전달해야함
		mvo.setS_dept(s_dept);	//setter: VO에 데이터 저장하기 위함
		System.out.println(mvo);
		return new ResponseEntity<>(ms.medical2(mvo),HttpStatus.OK); 
		// return ms.medical2(mvo) // 이렇게해도 되지만 서버 통신상태를 확인하기 위해서는 위 코드를 쓸것
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String InsertSchedule(ScheduleVO schedule) {
		System.out.println("aaaaa");
		System.out.println("medical="+schedule);
		ms.addSchedule(schedule);
		// 그냥 aside.jsp로 가면 서버주소에 insert하는 값이 남게됨 
		// .jsp가 아닌 .jsp로 리턴되는 서버로 이동해야함
		return "redirect:/aside";
	}
}