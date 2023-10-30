package com.otipms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.otipms.dao.AlarmDao;
import com.otipms.dto.Alarm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AlarmServiceImpl implements AlarmService {
	
	@Autowired
	public AlarmDao alarmDao;
	
	public List<Alarm> selectAlarmByEmpId(int empId) {
		return alarmDao.selectAlarmByEmpId(empId);
	}

	@Override
	public List<Alarm> selectAlarmCountByEmpId(int empId) {
		return alarmDao.selectAlarmCountByEmpId(empId);
	}

	@Override
	public void updateAlarmChecked(Alarm alarm) {
		alarmDao.checkedAlarm(alarm);
	}
	
}
