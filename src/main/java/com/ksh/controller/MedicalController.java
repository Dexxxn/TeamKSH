package com.ksh.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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
 
	@RequestMapping(value = "/popup/{s_dept}", method = RequestMethod.GET)
	// ResponseEntity: 비동기식은 결과가 js로 가기때문에 통신상태를 확인하기 위해 통신상태를 함께 보냄
	public ResponseEntity<ArrayList<MedicalVO>> getList(@PathVariable("s_dept") String s_dept){
		MedicalVO mvo = new MedicalVO();	// mapper.xml(if문 가공)에서 String s_dept(단순 변수) 처리 못함 반드시 VO에담아서 전달해야함
		mvo.setS_dept(s_dept);	//setter: VO에 데이터 저장하기 위함
		System.out.println(mvo);
		return new ResponseEntity<>(ms.medical2(mvo),HttpStatus.OK); 
		// return ms.medical2(mvo) // 이렇게해도 되지만 서버 통신상태를 확인하기 위해서는 위 코드를 쓸것
	}
	
	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String logIn(MedicalVO medical, HttpSession session, Model model) {
		//ms.logIn(medical);
		System.out.println(medical);// 어떤 값을 받았는지 콘솔에서 확인
		System.out.println(ms.logIn(medical));// 로그인할때 입력한 정보가 null값인지 콘솔에서 확인
		if(ms.logIn(medical) == null) {
			model.addAttribute("msg", "정확한 아이디 또는 비밀번호를 입력하세요.");
			model.addAttribute("url", "/");
			return "alert";
		}
		else {
			session.setAttribute("login", ms.logIn(medical));			
			String s_name = ((MedicalVO) session.getAttribute("login")).getS_name();
			model.addAttribute("msg", s_name + "님으로 로그인 되었습니다.");
			model.addAttribute("url", "index");
			return "alert";	// return "redirect:'/'" 도 가능 -> redirect: '반드시 서버주소'
		}
	};
	
	// index.jsp
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(HttpSession session, Model model) {
		if(session.getAttribute("login") == null) {
			// 세션에 값이 없는 경우 다른 경로로 이동하거나 에러 처리를 할 수 있습니다.
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			model.addAttribute("url", "/");
			return "alert";
		}
		else {
			return "index";
		}
	}
	
}