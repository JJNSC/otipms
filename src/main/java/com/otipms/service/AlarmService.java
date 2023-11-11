package com.otipms.service;

import java.util.List;
import java.util.Map;

import com.otipms.dto.Alarm;

public interface AlarmService {
	public List<Alarm> selectAlarmByEmpId(int empId);
	public List<Alarm> selectAlarmCountByEmpIdI(String empId);
	public List<Alarm> selectAlarmCountByEmpId(int empId);
	
	public List<Alarm> selectAlarmChatCountByEmpId(int empId);
	
	public void updateAlarmChecked(Alarm alarm);
	
	public Alarm getAlarm(int alarmNo);
	
	public Alarm setAlarm(Map<String,Object> param);
	
	public void deleteAlarm(int messageNo, int empId);
	
	public void deleteAlarmAll(int empId);
	public void deleteChatAlarmAll(int empId);
}
