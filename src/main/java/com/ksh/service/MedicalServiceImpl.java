package com.ksh.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ksh.mapper.MedicalMapper;
import com.ksh.model.MedicalVO;
import com.ksh.model.ScheduleVO;

@Service
public class MedicalServiceImpl implements MedicalService {

	@Autowired
	MedicalMapper mm;	// board 테이블 mapper
	
	@Override
	public ArrayList<MedicalVO> medical2(MedicalVO medical) {
		System.out.println("MemberService = "+medical);
		return mm.medical2(medical);
	}
	
	public MedicalVO logIn(MedicalVO medical) {
		return mm.logIn(medical);
	}

}
