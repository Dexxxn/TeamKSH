package com.ksh.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ksh.model.ScheduleVO;
import com.ksh.service.MedicalService;
import com.ksh.service.ScheduleService;

@Controller
@RequestMapping("/production")
public class ScheduleController {	

	private static final Logger log = LoggerFactory.getLogger(ScheduleController.class);
	
	private final ScheduleService service;
	
	public ScheduleController(ScheduleService service) {
		this.service = service;
	}

	
	// 비즈니스 모델을 컨트롤러에 연결하기
	@Autowired
	ScheduleService ss;	
	
	@RequestMapping(value="/monthPlan", method = RequestMethod.GET)
		@ResponseBody
		public List<Map<String, Object>> monthPlan() {
			List<ScheduleVO> list = ss.list();
			
			JSONObject jsonObj = new JSONObject();
			JSONArray jsonArr = new JSONArray();
			HashMap<String, Object> hash = new HashMap<String, Object>();		
			
			for(int i=0; i < list.size(); i++) {			
				/*hash.put("title", list.get(i).get("detailed_categorized_name")); //제목
				hash.put("start", list.get(i).get("expected_production_start_date")); //시작일자
				hash.put("end", list.get(i).get("expected_production_end_date")); //종료일자
*/				
	            hash.put("title", list.get(i).getS_doctor());
	            hash.put("start", list.get(i).getS_date()+'T'+list.get(i).getS_startTime());	//getS_date()+'T'+getS_startTime()
	            hash.put("end", list.get(i).getS_date()+'T'+list.get(i).getS_endTime());
	            
				jsonObj = new JSONObject(hash); //중괄호 {key:value , key:value, key:value}
				jsonArr.add(jsonObj); // 대괄호 안에 넣어주기[{key:value , key:value, key:value},{key:value , key:value, key:value}]
			}
			
			log.info("jsonArrCheck: {}", jsonArr);
			
			return jsonArr;
		}



}
