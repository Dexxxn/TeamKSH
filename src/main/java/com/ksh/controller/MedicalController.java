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
 
	@RequestMapping(value = "/replies/{s_dept}", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<MedicalVO>> getList(@PathVariable("s_dept") String s_dept){
		MedicalVO mvo = new MedicalVO();
		mvo.setS_dept(s_dept);
		System.out.println(mvo);
		return new ResponseEntity<>(ms.medical2(mvo),HttpStatus.OK); 
	}
}