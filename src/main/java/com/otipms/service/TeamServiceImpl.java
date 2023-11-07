package com.otipms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.otipms.dao.BoardDao;
import com.otipms.dao.EmployeeDao;
import com.otipms.dao.ProjectDao;
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
	@Autowired
	private BoardDao boardDao;

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
	public TeamList getTeamListByProjectNoForMainPage(int projectNo) {
		TeamList teamList = new TeamList();
		List<Team> teams = teamDao.selectTeamListByProjectNoForMainPage(projectNo);
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
		boardDao.insertTeamBoardType(team.getTeamNo());
	}

	@Override
	public void updateTeamLeader(Team team) {
		teamDao.updateTeamLeader(team);
		
	}

	@Override
	public void updateTeam(Team team) {
		teamDao.updateTeam(team);
		
	}

	@Override
	public void removeTeam(int teamNo) {
		Team thisTeam = teamDao.selectTeamByTeamNo(teamNo);
		Team update = new Team();
		//해당 팀의 팀원들을 작업중인 프로젝트의 미배정팀으로 이동
		update.setProjectNo(thisTeam.getProjectNo());
		update.setTeamNo(teamNo);
		employeeDao.updateToNoTeam(update);
		
		//해당 teamNo 를 가지고 있는 팀 삭제 
		teamDao.removeTeam(teamNo);
		
		
	}
	
}
