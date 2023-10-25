package com.otipms.service;

import java.util.List;

import com.otipms.dto.Team;

public interface TeamService {
	public List<Team> getTeamByProjectName(String projectName);
	public List<Team> getAllTeam();
}
