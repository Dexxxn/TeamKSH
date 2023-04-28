package com.ksh.service;

import java.util.ArrayList;

import com.ksh.model.MedicalVO;
import com.ksh.model.ScheduleVO;

public interface MedicalService {
	
	// 셀렉
	//public ArrayList<MedicalVO> medical(MedicalVO medical);
	// 과목-의사 select(비동기식)
	public ArrayList<MedicalVO> medical2(MedicalVO medical);
	
	// 일정 추가
	public void addSchedule(ScheduleVO schedule);
}
