package com.ksh.controller;

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
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ksh.model.ScheduleVO;
import com.ksh.service.ScheduleService;

@Controller
public class ScheduleController {

	private static final Logger log = LoggerFactory.getLogger(ScheduleController.class);

	private final ScheduleService service;

	public ScheduleController(ScheduleService service) {
		this.service = service;
	}

	// 비즈니스 모델을 컨트롤러에 연결하기
	@Autowired
	ScheduleService ss;

	@RequestMapping(value = "/monthPlan", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> monthPlan() {
		List<ScheduleVO> list = ss.list();

		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		HashMap<String, Object> hash = new HashMap<String, Object>();

		for (int i = 0; i < list.size(); i++) {
			/*
			 * hash.put("title", list.get(i).get("detailed_categorized_name")); //제목
			 * hash.put("start", list.get(i).get("expected_production_start_date")); //시작일자
			 * hash.put("end", list.get(i).get("expected_production_end_date")); //종료일자
			 */
			hash.put("title", list.get(i).getS_doctor() + '님' +'('+ list.get(i).getS_patient()+')');
			hash.put("start", list.get(i).getS_date() + 'T' + list.get(i).getS_startTime()); // getS_date()+'T'+getS_startTime()
			hash.put("end", list.get(i).getS_date() + 'T' + list.get(i).getS_endTime());
			hash.put("allDay", list.get(i).getAllDay());
			hash.put("s_type", list.get(i).getS_type());
			hash.put("s_no", list.get(i).getS_no());

			jsonObj = new JSONObject(hash); // 중괄호 {key:value , key:value, key:value}
			jsonArr.add(jsonObj); // 대괄호 안에 넣어주기[{key:value , key:value, key:value},{key:value , key:value,
									// key:value}]
		}

		log.info("jsonArrCheck: {}", jsonArr);

		return jsonArr;
	}

	// 일정 드래그 앤 드롭 업데이트
	@PatchMapping("/update")
	@ResponseBody
	public String update(@RequestBody ScheduleVO schedule) {
		System.out.println("fullcalendar update");
		System.out.println(schedule);
		ss.update(schedule);
		return "/update";
	}

	// 일정 추가
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String insertSchedule(ScheduleVO schedule) {
		System.out.println("aaaaa");
		System.out.println("medical=" + schedule);
		ss.addSchedule(schedule);
		// 그냥 aside.jsp로 가면 서버주소에 insert하는 값이 남게됨
		// .jsp가 아닌 .jsp로 리턴되는 서버로 이동해야함
		return "redirect:/aside";
	}

	// 상세 일정 보기
	@RequestMapping(value = "/popup2", method = RequestMethod.GET)
	public String detailSchedule(Model model, ScheduleVO schedule) {
		// ss.detail(schedule);
		model.addAttribute("detail", ss.detail(schedule));
		return "popUp2";
	}

	// 수정
	@RequestMapping(value = "/popup2/modify", method = RequestMethod.GET)
	public String modifySchedule(ScheduleVO schedule, RedirectAttributes rttr) {
		ss.modify(schedule);
		rttr.addAttribute("s_no", schedule.getS_no());
		// model.addAttribute("detail", ss.detail(schedule));
		return "redirect:/popup2";
	}

	// 삭제
	@RequestMapping(value = "/popup2/remove", method = RequestMethod.GET)
	public String removeSchedule(ScheduleVO schedule) {
		ss.remove(schedule);
		return "redirect:/aside";
	}

}
