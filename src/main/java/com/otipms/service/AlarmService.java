package com.otipms.service;

import java.util.List;

import com.otipms.dto.Alarm;

public interface AlarmService {
	public List<Alarm> selectAlarmByEmpId(int empId);
	public List<Alarm> selectAlarmCountByEmpIdI(String empId);
	public List<Alarm> selectAlarmCountByEmpId(int empId);
	public void updateAlarmChecked(Alarm alarm);
	
	public Alarm getAlarm(int alarmNo);
	
	public Alarm setAlarm(int messageNo);
}
