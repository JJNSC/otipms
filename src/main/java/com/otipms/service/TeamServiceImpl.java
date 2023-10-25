package com.otipms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.otipms.dao.TeamDao;
import com.otipms.dto.Team;

@Service
public class TeamServiceImpl implements TeamService {
	
	@Autowired
	private TeamDao teamDao;

	@Override
	public Team getTeamByProjectNo(int projectNo) {
		return teamDao.selectTeamByProjectNo(projectNo);
	}


}
