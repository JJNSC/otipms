package com.otipms.dto;

import java.util.List;

import lombok.Data;

@Data
public class ProjectTeams {
	private Project project;
	private List<Team> teamList;
}
