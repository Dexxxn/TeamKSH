package com.ksh.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ksh.model.ScheduleVO;

public interface ScheduleMapper {

	// 메인 캘린더에 뿌려주기
	public ArrayList<ScheduleVO> list();

	// 일정 업데이트
	public void update(ScheduleVO schedule);

	// 일정 추가
	public void addSchedule(ScheduleVO schedule);

	// 상세일정
	public ScheduleVO detail(ScheduleVO schedule);

	// 수정
	public void modify(ScheduleVO schedule);

	// 삭제
	public void remove(ScheduleVO schedule);

	public List<ScheduleVO> getDoctorSchedule(@Param("s_dept") String s_dept, @Param("s_name") String s_name,
			@Param("s_type") String s_type);
}
