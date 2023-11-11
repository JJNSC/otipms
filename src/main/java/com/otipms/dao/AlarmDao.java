package com.otipms.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.otipms.dto.Alarm;

@Mapper
public interface AlarmDao {
	public List<Alarm> selectAlarmByEmpId(int empId);
	public List<Alarm> selectAlarmCountByEmpId(int empId);
	public List<Alarm> selectAlarmCountByEmpIdI(Integer empId);
	
	public List<Alarm> selectAlarmChatCountByEmpId(int empId);
	
	public void insertAlarm(Alarm alarm);
	public void insertAlarmChat(Alarm alarm);
	public void checkedAlarm(Alarm alarm);
	
	//알람 -> 읽음쪽지
	public Alarm selectAlarm(int alarmNo);
	//메세지번호 -> 알람
	public Alarm selectAlarmByMessageNo(Map<String, Object> param);
	
	//알람 삭제
	public void deleteAlarm(Map<String, Object> param);
	
	public void deleteAlarmAll(int empId);
	public void deleteChatAlarmAll(int empId);
}
