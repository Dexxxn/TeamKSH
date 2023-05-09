package com.ksh.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ksh.mapper.ScheduleMapper;
import com.ksh.model.ScheduleVO;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired /* (required = false) */
	ScheduleMapper sm;

	@Override
	public ArrayList<ScheduleVO> list() {
		return sm.list();
	}

	public void addSchedule(ScheduleVO schedule) {
		System.out.println("ScheduleService = " + schedule);
		sm.addSchedule(schedule);
	}

	public ScheduleVO detail(ScheduleVO schedule) {
		return sm.detail(schedule);
	}

	public void update(ScheduleVO schedule) {
		sm.update(schedule);
		// 이벤트 업데이트 처리 코드
	}

	public void modify(ScheduleVO schedule) {
		sm.modify(schedule);

	}

	public void remove(ScheduleVO schedule) {
		sm.remove(schedule);
		System.out.println("remove = " + schedule);
	}

	public List<ScheduleVO> getDoctorSchedule(String s_dept, String s_name, String s_type) {
		// ScheduleMapper의 적절한 메서드를 호출하여 의사 일정을 조회
		return sm.getDoctorSchedule(s_dept, s_name, s_type);
	}

}
