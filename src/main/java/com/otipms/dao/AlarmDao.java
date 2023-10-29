package com.otipms.dao;

import org.apache.ibatis.annotations.Mapper;

import com.otipms.dto.Alarm;

@Mapper
public interface AlarmDao {
	public Alarm selectAlarmByEmpId(int empId);
	public int selectAlarmCountByEmpId(int empId);
}
