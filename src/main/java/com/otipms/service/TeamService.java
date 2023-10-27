package com.otipms.service;

import java.util.List;

import com.otipms.dto.Team;
import com.otipms.dto.TeamList;

public interface TeamService {
	public List<Team> getTeamByProjectName(String projectName);
	public TeamList getTeamListByProjectNo(int projectNo);
	public List<Team> getAllTeam();
}
