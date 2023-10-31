package com.otipms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.otipms.dao.EmployeeDao;
import com.otipms.dao.TeamDao;
import com.otipms.dto.Employee;
import com.otipms.dto.Team;
import com.otipms.dto.TeamList;

@Service
public class TeamServiceImpl implements TeamService {
	
	@Autowired
	private TeamDao teamDao;
	@Autowired
	private EmployeeDao employeeDao;

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
		for(Team team : teams) {
			Employee emp =employeeDao.selectByEmployeeId(team.getEmpId());
			if(emp==null||emp.equals(null)) {
				
			}else {
				team.setEmpName(emp.getEmpName());
				team.setEmpRank(emp.getEmpRank());
			}
		}
		teamList.setTeamList(teams);
		return teamList;
	}
	
	@Override
	public Team getTeamByTeamNo(int teamNo) {
		return teamDao.selectTeamByTeamNo(teamNo);
	}

	@Override
	public void addTeam(Team team) {
		teamDao.addTeam(team);
		
	}

	@Override
	public void updateTeamLeader(Team team) {
		teamDao.updateTeamLeader(team);
		
	}

	@Override
	public void updateTeam(Team team) {
		teamDao.updateTeam(team);
		
	}
	
}
