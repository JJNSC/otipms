package com.otipms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.otipms.dao.TeamDao;
import com.otipms.dto.Team;
import com.otipms.dto.TeamList;

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

	@Override
	public TeamList getTeamListByProjectNo(int projectNo) {
		TeamList teamList = new TeamList();
		List<Team> teams = teamDao.selectTeamListByProjectNo(projectNo);
		teamList.setTeamList(teams);
		return teamList;
	}

	@Override
	public void addTeam(Team team) {
		teamDao.addTeam(team);
		
	}


}
