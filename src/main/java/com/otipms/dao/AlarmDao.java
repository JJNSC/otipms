package com.otipms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.otipms.dto.Alarm;

@Mapper
public interface AlarmDao {
	public List<Alarm> selectAlarmByEmpId(int empId);
	public List<Alarm> selectAlarmCountByEmpId(int empId);
	
	public void insertAlarm(Alarm alarm);
	public void checkedAlarm(Alarm alarm);
}
