package com.ksh.mapper;

import java.util.ArrayList;

import com.ksh.model.MedicalVO;

public interface MedicalMapper {
	
	// 셀렉
	public ArrayList<MedicalVO> medical(MedicalVO medical);
}
