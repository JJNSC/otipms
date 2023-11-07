package com.otipms.dto;

import lombok.Data;

@Data
public class TaskCount {
	private int totalTaskCnt;
	private int finishedTaskCnt;
	private int proceedingTaskCnt;
	private int undoneTaskCnt;
	private double finishedTaskRate;
	private double proceedingTaskRate;
	private double undoneTaskRate;
}
