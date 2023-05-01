package com.ksh.mapper;

import java.util.ArrayList;

import com.ksh.model.MedicalVO;
import com.ksh.model.ScheduleVO;

public interface MedicalMapper {
	
	// 셀렉
	public ArrayList<MedicalVO> medical(MedicalVO medical);
	public ArrayList<MedicalVO> medical2(MedicalVO medical);
	
	// 일정 추가
	public void addSchedule(ScheduleVO schedule);
	
	public MedicalVO detail(ScheduleVO schedule);
}
