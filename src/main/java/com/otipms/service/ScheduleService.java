package com.otipms.service;

import java.util.List;

import com.otipms.dto.Schedule;

/**
 * 
 * @author 이은지
 *
 */
public interface ScheduleService {
	/**
	 * 일정 추가
	 * @param schedule
	 */
	public void addSchedule(Schedule schedule);

	/**
	 * 일정 리스트 조회
	 * @param empId
	 * @return
	 */
	public List<Schedule> getScheduleList(int empId);

	/**
	 * 체크 수정
	 * @param schedule
	 */
	public void updateChecked(Schedule schedule);

	/**
	 * 일정 조회
	 * @param scheduleNo
	 * @return
	 */
	public Schedule getSchedule(String scheduleNo);

	/**
	 * 일정 수정
	 * @param schedule
	 */
	public void updateSchedule(Schedule schedule);

	/**
	 * 일정 삭제
	 * @param scheduleNo
	 */
	public void deleteSchedule(String scheduleNo);
}
