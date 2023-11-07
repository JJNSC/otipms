package com.otipms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.otipms.dao.ScheduleDao;
import com.otipms.dto.Schedule;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ScheduleServiceImpl implements ScheduleService {
	@Autowired
	private ScheduleDao scheduleDao;
	
	//일정 추가
	@Override
	public void addSchedule(Schedule schedule) {
		scheduleDao.insertSchedule(schedule);
	}

	//일정 리스트 조회
	@Override
	public List<Schedule> getScheduleList(int empId) {
		return scheduleDao.selectScheduleList(empId);
	}

	//체크 수정
	@Override
	public void updateChecked(Schedule schedule) {
		scheduleDao.updateScheduleChecked(schedule);
	}

	//일정 조회
	@Override
	public Schedule getSchedule(String scheduleNo) {
		return scheduleDao.selectSchedule(Integer.parseInt(scheduleNo));
	}

	//일정 수정
	@Override
	public void updateSchedule(Schedule schedule) {
		scheduleDao.updateSchedule(schedule);
	}

	//일정 삭제
	@Override
	public void deleteSchedule(String scheduleNo) {
		scheduleDao.deleteSchedule(Integer.parseInt(scheduleNo));
	}
}
