package com.otipms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.otipms.dto.ProjectTeams;
import com.otipms.dto.Team;

@Mapper
public interface TeamDao {
	public int addTeam(Team team);
	public String getTeamNameByTeamNo(int teamNo);
	public List<Team> selectTeamByProjectName(String projectName);
	public List<Team> selectTeamListByProjectNo(int projectNo);
	public Team selectTeamByTeamNo(int teamNo);
	public List<Team> selectAllTeam();
	public void updateTeamLeader(Team team);
	public int updateTeamEmpId(Team team);
	public void updateTeam(Team team);
	public void removeTeam(int teamNo);
	public int getTeamNoByProjectNoAndTeamName(Team team);
	public List<ProjectTeams> getTeamsPerProjects();
}
