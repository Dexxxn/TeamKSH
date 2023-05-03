package com.ksh.service;

import java.util.ArrayList;

import com.ksh.model.ScheduleVO;

public interface ScheduleService {
	
	// 메인 캘린더에 뿌려주기
	public ArrayList<ScheduleVO> list();
	
	// 일정 추가
	public void addSchedule(ScheduleVO schedule);
	// 상세일정
	public ScheduleVO detail(ScheduleVO schedule);
	// 수정
	public void modify(ScheduleVO schedule);
	// 삭제
	public void remove(ScheduleVO schedule);
}
