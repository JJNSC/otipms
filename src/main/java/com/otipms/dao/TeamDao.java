package com.otipms.dao;

import org.apache.ibatis.annotations.Mapper;

import com.otipms.dto.Team;

@Mapper
public interface TeamDao {
	public void addTeam(Team team);
	public Team selectTeamByProjectNo(int projectNo);
}
