package com.otipms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.otipms.dao.TeamDao;
import com.otipms.dto.Team;

@Service
public class TeamServiceImpl implements TeamService {
	
	@Autowired
	private TeamDao teamDao;

	@Override
	public List<Team> getTeamByProjectName(String projectName) {
		return teamDao.selectTeamByProjectName(projectName);
	}

	@Override
	public List<Team> getAllTeam() {
		return teamDao.selectAllTeam();
	}


}
