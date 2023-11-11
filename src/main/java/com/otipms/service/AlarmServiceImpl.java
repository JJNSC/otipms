package com.otipms.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@Override
	public List<Alarm> selectAlarmByEmpId(int empId) {
		return alarmDao.selectAlarmByEmpId(empId);
	}

	@Override
	public List<Alarm> selectAlarmCountByEmpIdI(String empId) {
		Integer empIdInt = Integer.parseInt(empId);
		return alarmDao.selectAlarmCountByEmpIdI(empIdInt);
	}
	
	@Override
	public List<Alarm> selectAlarmCountByEmpId(int empId) {
		return alarmDao.selectAlarmCountByEmpId(empId);
	}
	@Override
	public void updateAlarmChecked(Alarm alarm) {
		alarmDao.checkedAlarm(alarm);
	}

	@Override
	public Alarm getAlarm(int alarmNo) {
		return alarmDao.selectAlarm(alarmNo);
	}
	
	@Override
	public Alarm setAlarm(Map<String,Object> param) {
		return alarmDao.selectAlarmByMessageNo(param);
	}

	@Override
	public void deleteAlarm(int messageNo, int empId) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("messageNo", messageNo);
		paramMap.put("empId", empId);
		
		alarmDao.deleteAlarm(paramMap);		
	}

	@Override
	public void deleteAlarmAll(int empId) {
		alarmDao.deleteAlarmAll(empId);
	}

	@Override
	public List<Alarm> selectAlarmChatCountByEmpId(int empId) {
		return alarmDao.selectAlarmChatCountByEmpId(empId);
	}
	
	@Override
	public void deleteChatAlarmAll(int empId) {
		alarmDao.deleteChatAlarmAll(empId);
	}
	
}
