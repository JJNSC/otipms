package com.otipms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.otipms.dto.Team;

@Mapper
public interface TeamDao {
	public void addTeam(Team team);
	public String getTeamNameByTeamNo(int teamNo);
	public List<Team> selectTeamByProjectName(String projectName);
	public List<Team> selectAllTeam();
}
