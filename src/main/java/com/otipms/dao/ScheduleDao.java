package com.otipms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.otipms.dto.Schedule;

@Mapper
public interface ScheduleDao {
	/**
	 * 일정 추가
	 * @param schedule
	 */
	public void insertSchedule(Schedule schedule);

	/**
	 * 일정 리스트 조회
	 * @param empId
	 * @return
	 */
	public List<Schedule> selectScheduleList(int empId);

	/**
	 * 체크 수정
	 * @param schedule
	 */
	public void updateScheduleChecked(Schedule schedule);

	/**
	 * 일정 조회
	 * @param scheduleNo
	 * @return
	 */
	public Schedule selectSchedule(int scheduleNo);

	/**
	 * 일정 수정
	 * @param schedule
	 */
	public void updateSchedule(Schedule schedule);

	/**
	 * 일정 삭제
	 * @param scheduleNo
	 */
	public void deleteSchedule(int scheduleNo);
}
