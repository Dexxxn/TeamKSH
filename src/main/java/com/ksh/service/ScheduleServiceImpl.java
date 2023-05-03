package com.ksh.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ksh.mapper.ScheduleMapper;
import com.ksh.model.ScheduleVO;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired/*(required = false)*/
	ScheduleMapper sm;
	
	@Override
	public ArrayList<ScheduleVO> list(){
		return sm.list();
	}
	
	public void addSchedule(ScheduleVO schedule) {
		System.out.println("ScheduleService = "+schedule);
		sm.addSchedule(schedule);
	}
	
	public ScheduleVO detail(ScheduleVO schedule) {
		System.out.println("ScheduleService = "+schedule);
		return sm.detail(schedule);
	}
	
	public void modify(ScheduleVO schedule) {
		sm.modify(schedule);
	}
	
	public void remove(ScheduleVO schedule) {
		sm.remove(schedule);
	}


}
