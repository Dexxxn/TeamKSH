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
}
