window.onload = function() {
			today = new Date();
			console.log("today.toISOString() >>>" + today.toISOString());
			today = today.toISOString().slice(0, 10);
			console.log("today >>>> " + today);
			bir = document.getElementById("startDate");
			bir.value = today;
		}

//프로젝트 선택
function selectProject() {
	var project = $("#projectSelect").val();
	
	console.log(typeof project);
	$.ajax({
		url: "/otipms/selectProject",
		method: "post",
		data: {
			projectNo:project
		},
		success: function(data) {
			let teamhtml = "<option>팀 선택</option>";
			
			console.log(data);
			
			if(data.teamList != null && data.teamList.length != 0) {
				$.each(data.teamList, function(index, team) {
					teamhtml += '<option value="' + team.teamNo + '">' + team.teamName + '</option>';
				});
			}
			
			$("#teamSelect").html(teamhtml);

			let taskehtml = '';
			
			if(data.taskEmployeeList.length != 0) {
				$.each(data.taskEmployeeList, function(index, taskEmployee) {
					taskehtml += '<tr class="reviewTitle table-hover" data-toggle="collapse" data-review-id="' + taskEmployee.empId + '" id="employeeId' + taskEmployee.empId + '" href="#task' + taskEmployee.empId + '" role="button" aria-expanded="false" aria-controls="collapseExample" onclick="taskEmployeeTr(this)">';
					taskehtml += '<td>' + taskEmployee.empId + '</td>';
					taskehtml += '<td>' + taskEmployee.projectName + '</td>';
					taskehtml += '<td>' + taskEmployee.teamName + '</td>';
					taskehtml += '<td>' + taskEmployee.empName + '</td>';
					taskehtml += '<td>' + taskEmployee.empRank + '</td>';
					taskehtml += '<td class="progressTd">';
					if(taskEmployee.progressRate < 20) {
						taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-frown-o" aria-hidden="true"></i><span class="float-right">' + taskEmployee.progressRate + '%</span></h5>';
						taskehtml += '<div class="progress" style="height: 9px">';
						taskehtml += '<div class="progress-bar bg-danger wow  progress-" style="width: ' + taskEmployee.progressRate + '%;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
						taskehtml += '</div>';
					} else if(20 <= taskEmployee.progressRate && taskEmployee.progressRate < 80) {
						taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-meh-o" aria-hidden="true"></i><span class="float-right">' + taskEmployee.progressRate + '%</span></h5>';
						taskehtml += '<div class="progress" style="height: 9px">';
						taskehtml += '<div class="progress-bar bg-info wow  progress-" style="width: ' + taskEmployee.progressRate + '%;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
						taskehtml += '</div>';
					} else if(80 <= taskEmployee.progressRate) {
						taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-smile-o" aria-hidden="true"></i><span class="float-right">' + taskEmployee.progressRate + '%</span></h5>';
						taskehtml += '<div class="progress" style="height: 9px">';
						taskehtml += '<div class="progress-bar bg-success wow  progress-" style="width: ' + taskEmployee.progressRate + '%;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
						taskehtml += '</div>';
					}
					/*taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-smile-o" aria-hidden="true"></i><span class="float-right">88%</span></h5>';
					taskehtml += '<div class="progress" style="height: 9px">';
					taskehtml += '<div class="progress-bar bg-info wow  progress-" style="width: 88%;" role="progressbar"><span class="sr-only">60% Complete</span>';
					taskehtml += '</div>';
					taskehtml += '</div>';*/
					taskehtml += '</td>';
					taskehtml += '</tr>';
					taskehtml += '<tr style="background-color:#f3f3f3;" id="16bottom">';
					taskehtml += '<td style="padding-top :0px; padding-bottom :0px;" colspan="6">';
					taskehtml += '<div class="collapse" id="task' + taskEmployee.empId + '" style="">';
					taskehtml += '<div class="card card-body mt-3 noHover">';
					taskehtml += '<div class="card-title">';
					taskehtml += '<h6>업무 목록</h6>';
					taskehtml += '</div>';
					taskehtml += '<table>';
					taskehtml += '<thead>';
					taskehtml += '<tr>';
					taskehtml += '<th scope="col" style="width: 10%;">번호</th>';
					taskehtml += '<th scope="col" style="width: 30%;">업무이름</th>';
					taskehtml += '<th scope="col" style="width: 20%;">업무 시작일</th>';
					taskehtml += '<th scope="col" style="width: 20%; text-align: center;">업무 종료일</th>';
					taskehtml += '<th scope="col" style="width: 20%; text-align: center;">진행 상태</th>';
					taskehtml += '<th class="text-center">삭제</th>';
					taskehtml += '</tr>';
					taskehtml += '</thead>';
					taskehtml += '<tbody class="detailTaskBody">';
						/*taskehtml += '<tr class="table-hover">';
						taskehtml += '<td style="padding-left: 20px;">1</td>';
						taskehtml += '<td>김종진 개인업무1</td>';
						taskehtml += '<td>2023.10.14</td>';
						taskehtml += '<td class="text-center"> - </td>';
						taskehtml += '<td class="text-center text-success">진행중</td>';
						taskehtml += '<td class="text-center">';
						taskehtml += '<button type="button" class="btn fa fa-trash-o color-danger" data-toggle="modal" data-target="#modalGrid"></button>';
						taskehtml += '</td>';
						taskehtml += '</tr>';*/
					taskehtml += '</tbody>';
					taskehtml += '</table>';
					taskehtml += '</div>';
					taskehtml += '</div>';
					taskehtml += '</td>';
					taskehtml += '</tr>';
				});
			}
			
			$("#detailTaskList").html(taskehtml);
		},
		error: function(error) {
			console.log(error);
		}
	});
}

//팀 선택
function selectTeam() {
var project = $("#projectSelect").val();
var team = $("#teamSelect").val()
	
	if(team != "프로젝트 선택") {
		$.ajax({
			url: "/otipms/selectTeam",
			method: "post",
			data: {
				projectNo:project,
				teamNo:team
			},
			success: function(data) {
				//console.log(data);
				
				let taskehtml = '';
				
				if(data.taskEmployeeList.length != 0) {
					$.each(data.taskEmployeeList, function(index, taskEmployee) {
						taskehtml += '<tr class="reviewTitle table-hover" data-toggle="collapse" data-review-id="' + taskEmployee.empId + '" id="employeeId' + taskEmployee.empId + '" href="#task' + taskEmployee.empId + '" role="button" aria-expanded="false" aria-controls="collapseExample" onclick="taskEmployeeTr(this)">';
						taskehtml += '<td>' + taskEmployee.empId + '</td>';
						taskehtml += '<td>' + taskEmployee.projectName + '</td>';
						taskehtml += '<td>' + taskEmployee.teamName + '</td>';
						taskehtml += '<td>' + taskEmployee.empName + '</td>';
						taskehtml += '<td>' + taskEmployee.empRank + '</td>';
						taskehtml += '<td class="progressTd">';
						if(taskEmployee.progressRate < 20) {
							taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-frown-o" aria-hidden="true"></i><span class="float-right">' + taskEmployee.progressRate + '%</span></h5>';
							taskehtml += '<div class="progress" style="height: 9px">';
							taskehtml += '<div class="progress-bar bg-danger wow  progress-" style="width: ' + taskEmployee.progressRate + '%;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
							taskehtml += '</div>';
						} else if(20 <= taskEmployee.progressRate && taskEmployee.progressRate < 80) {
							taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-meh-o" aria-hidden="true"></i><span class="float-right">' + taskEmployee.progressRate + '%</span></h5>';
							taskehtml += '<div class="progress" style="height: 9px">';
							taskehtml += '<div class="progress-bar bg-info wow  progress-" style="width: ' + taskEmployee.progressRate + '%;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
							taskehtml += '</div>';
						} else if(80 <= taskEmployee.progressRate) {
							taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-smile-o" aria-hidden="true"></i><span class="float-right">' + taskEmployee.progressRate + '%</span></h5>';
							taskehtml += '<div class="progress" style="height: 9px">';
							taskehtml += '<div class="progress-bar bg-success wow  progress-" style="width: ' + taskEmployee.progressRate + '%;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
							taskehtml += '</div>';
						}
						/*taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-smile-o" aria-hidden="true"></i><span class="float-right">88%</span></h5>';
						taskehtml += '<div class="progress" style="height: 9px">';
						taskehtml += '<div class="progress-bar bg-info wow  progress-" style="width: 88%;" role="progressbar"><span class="sr-only">60% Complete</span>';
						taskehtml += '</div>';
						taskehtml += '</div>';*/
						taskehtml += '</td>';
						taskehtml += '</tr>';
						taskehtml += '<tr style="background-color:#f3f3f3;" id="16bottom">';
						taskehtml += '<td style="padding-top :0px; padding-bottom :0px;" colspan="6">';
						taskehtml += '<div class="collapse" id="task' + taskEmployee.empId + '" style="">';
						taskehtml += '<div class="card card-body mt-3 noHover">';
						taskehtml += '<div class="card-title">';
						taskehtml += '<h6>업무 목록</h6>';
						taskehtml += '</div>';
						taskehtml += '<table>';
						taskehtml += '<thead>';
						taskehtml += '<tr>';
						taskehtml += '<th scope="col" style="width: 10%;">번호</th>';
						taskehtml += '<th scope="col" style="width: 30%;">업무이름</th>';
						taskehtml += '<th scope="col" style="width: 20%;">업무 시작일</th>';
						taskehtml += '<th scope="col" style="width: 20%; text-align: center;">업무 종료일</th>';
						taskehtml += '<th scope="col" style="width: 20%; text-align: center;">진행 상태</th>';
						taskehtml += '<th class="text-center">삭제</th>';
						taskehtml += '</tr>';
						taskehtml += '</thead>';
						taskehtml += '<tbody class="detailTaskBody">';
						/*taskehtml += '<tr class="table-hover">';
						taskehtml += '<td style="padding-left: 20px;">1</td>';
						taskehtml += '<td>김종진 개인업무1</td>';
						taskehtml += '<td>2023.10.14</td>';
						taskehtml += '<td class="text-center"> - </td>';
						taskehtml += '<td class="text-center text-success">진행중</td>';
						taskehtml += '<td class="text-center">';
						taskehtml += '<button type="button" class="btn fa fa-trash-o color-danger" data-toggle="modal" data-target="#modalGrid"></button>';
						taskehtml += '</td>';
						taskehtml += '</tr>';*/
						taskehtml += '</tbody>';
						taskehtml += '</table>';
						taskehtml += '</div>';
						taskehtml += '</div>';
						taskehtml += '</td>';
						taskehtml += '</tr>';
					});
				}
				
				$("#detailTaskList").html(taskehtml);
			},
			error: function(error) {
				console.log(error);
			}
		});
	}
}

//등록
function registerTask() {
	var taskName = $("#taskName").val();
	var taskComment = $("#taskComment").val();
	var empId = $("#empIdInput").val();
	var employeeName = $("#employeeName").val();
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	var status = $("#status").val();
	
	console.log("taskName: " + taskName);
	console.log("taskComment: " + taskComment);
	console.log("empId: " + empId);
	console.log("employeeName: " + employeeName);
	console.log("startDate: " + startDate);
	console.log("endDate: " + endDate);
	console.log("status: " + status);
	
	console.log($("#employeeId" + empId).attr("aria-expanded"));
	
	//유효성
	var result = checkInvalidation();
	
	if(result == true) {
	
		$.ajax({
			url: "/otipms/registerTask",
			method: "POST",
			data: {
				taskName:taskName,
				taskComment:taskComment,
				empId:empId,
				startDate:startDate,
				endDate:endDate,
				status:status
			},
			success: function(data) {
				console.log(data);
				
				if(data.taskList != null && data.taskList.length != 0) {
					var taskEmployeeTr = $("#employeeId" + empId);
					if(taskEmployeeTr.attr("aria-expanded") == "true") {
						console.log("왜 안될까 ㅠ");
						taskhtml = '';
						
						$.each(data.taskList, function(index, task) {
							taskhtml += '<tr class="table-hover" id="task' + task.taskNo + '" onclick="taskTr(this)">';
							taskhtml += '<td style="padding-left: 20px;">' + (index + 1) + '</td>';
							taskhtml += '<td>' + task.taskName + '</td>';
							taskhtml += '<td>' + dateFormat(new Date(task.taskStartDate), 1) + '</td>';
							if(task.taskEndDate != null) {
								taskhtml += '<td class="text-center">' + dateFormat(new Date(task.taskEndDate), 1) + '</td>';
							} else {
								taskhtml += '<td class="text-center"> - </td>';
							}
							if(task.taskStatus == "진행전") {
								taskhtml += '<td class="text-center text-secondary">' + task.taskStatus + '</td>';
							} else if(task.taskStatus == "진행중") {
								taskhtml += '<td class="text-center text-success">' + task.taskStatus + '</td>';
							} else if(task.taskStatus == "진행완료") {
								taskhtml += '<td class="text-center text-danger">' + task.taskStatus + '</td>';
							}
							taskhtml += '<td class="text-center">';
							taskhtml += '<button type="button" id="deleteTaskBtn" name="' + task.taskNo + '" class="btn fa fa-trash-o color-danger" data-toggle="modal" data-target="#modalGrid" onclick="deleteTaskBtn(this)"></button>';
							taskhtml += '</td>';
							taskhtml += '</tr>';
						});
						
						taskEmployeeTr.next().find(".detailTaskBody").html(taskhtml);
					}
					
					$("#taskNoInput").val('');
					$("#taskName").val('');
					$("#taskComment").val('');
					$("#empIdInput").val('');
					$("#employeeName").val('');
					$("#startDate").val(dateFormat(new Date(), 1));
					$("#endDate").val('');
					$("#defaultStatus").prop("selected", "selected");
				}
				
				console.log(data.progressRate);
				taskehtml = "";
				if(data.progressRate < 20) {
					taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-frown-o" aria-hidden="true"></i><span class="float-right">' + data.progressRate + '%</span></h5>';
					taskehtml += '<div class="progress" style="height: 9px">';
					taskehtml += '<div class="progress-bar bg-danger wow  progress-" style="width: ' + data.progressRate + '%;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
					taskehtml += '</div>';
				} else if(20 <= data.progressRate && data.progressRate < 80) {
					taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-meh-o" aria-hidden="true"></i><span class="float-right">' + data.progressRate + '%</span></h5>';
					taskehtml += '<div class="progress" style="height: 9px">';
					taskehtml += '<div class="progress-bar bg-info wow  progress-" style="width: ' + data.progressRate + '%;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
					taskehtml += '</div>';
				} else if(80 <= data.progressRate) {
					taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-smile-o" aria-hidden="true"></i><span class="float-right">' + data.progressRate + '%</span></h5>';
					taskehtml += '<div class="progress" style="height: 9px">';
					taskehtml += '<div class="progress-bar bg-success wow  progress-" style="width: ' + data.progressRate + '%;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
					taskehtml += '</div>';
				}
				console.log(taskehtml);
				
				var taskEmployeeTr = $("#employeeId" + empId);
				taskEmployeeTr.find(".progressTd").html(taskehtml);
				
			},
			error: function(error) {
				//console.log(error);
			}
		});
	}
}

//태스크 리스트 가져오기
function getTaskList(empId) {
	var empId = empId;
	console.log(empId);
	
	$.ajax({
		url: "/otipms/getTaskList",
		method: "POST",
		data: {
			empId:empId
		},
		success: function(data) {
			console.log(data);
			
			if(data != null && data.length != 0) {
				var taskEmployeeTr = $("#employeeId" + empId);
				taskhtml = '';
				
				$.each(data, function(index, task) {
					taskhtml += '<tr class="table-hover" id="task' + task.taskNo + '" onclick="taskTr(this)">';
					taskhtml += '<td style="padding-left: 20px;">' + (index + 1) + '</td>';
					taskhtml += '<td>' + task.taskName + '</td>';
					taskhtml += '<td>' + dateFormat(new Date(task.taskStartDate), 1) + '</td>';
					if(task.taskEndDate != null) {
						taskhtml += '<td class="text-center">' + dateFormat(new Date(task.taskEndDate), 1) + '</td>';
					} else {
						taskhtml += '<td class="text-center"> - </td>';
					}
					if(task.taskStatus == "진행전") {
						taskhtml += '<td class="text-center text-secondary">' + task.taskStatus + '</td>';
					} else if(task.taskStatus == "진행중") {
						taskhtml += '<td class="text-center text-success">' + task.taskStatus + '</td>';
					} else if(task.taskStatus == "진행완료") {
						taskhtml += '<td class="text-center text-danger">' + task.taskStatus + '</td>';
					}
					taskhtml += '<td class="text-center">';
					taskhtml += '<button type="button" id="deleteTaskBtn" name="' + task.taskNo + '" class="btn fa fa-trash-o color-danger" data-toggle="modal" data-target="#modalGrid" onclick="deleteTaskBtn(this)"></button>';
					taskhtml += '</td>';
					taskhtml += '</tr>';
				});
				
				taskEmployeeTr.next().find(".detailTaskBody").html(taskhtml);
			}
		},
		error: function(error) {
			//console.log(error);
		}
	});
}

//태스크 상세 조회
function getTaskDetail(taskNo) {
	console.log(taskNo);
	var taskNo = taskNo.substring(4, taskNo.length);
	
	$.ajax({
		url: "/otipms/getTask",
		method: "POST",
		data: {
			taskNo:taskNo
		},
		success: function(data) {
			console.log(data);
			$("#taskNoInput").val(data.taskNo)
			$("#taskName").val(data.taskName)
			$("#taskComment").val(data.taskComment)
			$("#empIdInput").val(data.empId)
			$("#employeeName").val(data.empName)
			$("#startDate").val(dateFormat(new Date(data.taskStartDate), 1));
			if(data.taskEndDate != null) {
				$("#endDate").val(dateFormat(new Date(data.taskEndDate), 1));
			}
			if(data.taskStatus == "진행전") {
				$("#defaultStatus").prop("selected", "selected");
			} else if(data.taskStatus == "진행중") {
				$("#ongoingStatus").prop("selected", "selected");
			} else if(data.taskStatus == "진행완료") {
				$("#doneStatus").prop("selected", "selected");
			}
			
			$("#registerTaskBtn").addClass("d-none");
			$("#updateTaskBtn").removeClass("d-none");

		},
		error: function(error) {
			//console.log(error);
		}
	});
}

//태스크 수정
function updateTask() {
	var taskNo = $("#taskNoInput").val();
	var taskName = $("#taskName").val();
	var taskComment = $("#taskComment").val();
	var empId = $("#empIdInput").val();
	var employeeName = $("#employeeName").val();
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	var status = $("#status").val();
	
	console.log("taskName: " + taskName);
	console.log("taskComment: " + taskComment);
	console.log("empId: " + empId);
	console.log("employeeName: " + employeeName);
	console.log("startDate: " + startDate);
	console.log("endDate: " + endDate);
	console.log("status: " + status);
	
	//유효성
	var result = checkInvalidation();
	
	if(result == true) {
	
		$.ajax({
			url: "/otipms/modifyTask",
			method: "POST",
			data: {
				taskNo:taskNo,
				taskName:taskName,
				taskComment:taskComment,
				empId:empId,
				startDate:startDate,
				endDate:endDate,
				status:status
			},
			success: function(data) {
				console.log(data);
				if(data.taskList != null && data.taskList.length != 0) {
					var taskEmployeeTr = $("#employeeId" + empId);
					taskhtml = '';
					
					$.each(data.taskList, function(index, task) {
						taskhtml += '<tr class="table-hover" id="task' + task.taskNo + '" onclick="taskTr(this)">';
						taskhtml += '<td style="padding-left: 20px;">' + (index + 1) + '</td>';
						taskhtml += '<td>' + task.taskName + '</td>';
						taskhtml += '<td>' + dateFormat(new Date(task.taskStartDate), 1) + '</td>';
						if(task.taskEndDate != null) {
							taskhtml += '<td class="text-center">' + dateFormat(new Date(task.taskEndDate), 1) + '</td>';
						} else {
							taskhtml += '<td class="text-center"> - </td>';
						}
						if(task.taskStatus == "진행전") {
							taskhtml += '<td class="text-center text-secondary">' + task.taskStatus + '</td>';
						} else if(task.taskStatus == "진행중") {
							taskhtml += '<td class="text-center text-success">' + task.taskStatus + '</td>';
						} else if(task.taskStatus == "진행완료") {
							taskhtml += '<td class="text-center text-danger">' + task.taskStatus + '</td>';
						}
						taskhtml += '<td class="text-center">';
						taskhtml += '<button type="button" id="deleteTaskBtn" name="' + task.taskNo + '" class="btn fa fa-trash-o color-danger" data-toggle="modal" data-target="#modalGrid" onclick="deleteTaskBtn(this)"></button>';
						taskhtml += '</td>';
						taskhtml += '</tr>';
					});
					
					taskEmployeeTr.next().find(".detailTaskBody").html(taskhtml);
					
					$("#taskNoInput").val('');
					$("#taskName").val('');
					$("#taskComment").val('');
					$("#empIdInput").val('');
					$("#employeeName").val('');
					$("#startDate").val(dateFormat(new Date(), 1));
					$("#endDate").val('');
					$("#defaultStatus").prop("selected", "selected");
				}
				
				console.log(data.progressRate);
				taskehtml = "";
				if(data.progressRate < 20) {
					taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-frown-o" aria-hidden="true"></i><span class="float-right">' + data.progressRate + '%</span></h5>';
					taskehtml += '<div class="progress" style="height: 9px">';
					taskehtml += '<div class="progress-bar bg-danger wow  progress-" style="width: ' + data.progressRate + '%;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
					taskehtml += '</div>';
				} else if(20 <= data.progressRate && data.progressRate < 80) {
					taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-meh-o" aria-hidden="true"></i><span class="float-right">' + data.progressRate + '%</span></h5>';
					taskehtml += '<div class="progress" style="height: 9px">';
					taskehtml += '<div class="progress-bar bg-info wow  progress-" style="width: ' + data.progressRate + '%;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
					taskehtml += '</div>';
				} else if(80 <= data.progressRate) {
					taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-smile-o" aria-hidden="true"></i><span class="float-right">' + data.progressRate + '%</span></h5>';
					taskehtml += '<div class="progress" style="height: 9px">';
					taskehtml += '<div class="progress-bar bg-success wow  progress-" style="width: ' + data.progressRate + '%;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
					taskehtml += '</div>';
				}
				console.log(taskehtml);
				
				var taskEmployeeTr = $("#employeeId" + empId);
				taskEmployeeTr.find(".progressTd").html(taskehtml);
	
			},
			error: function(error) {
				//console.log(error);
			}
		});
	}
}

//태스크 삭제
function deleteTask() {
	console.log("삭제할 taskNo " + $("#deleteCheckBtn").attr("name"));
	var taskNo = $("#deleteCheckBtn").attr("name");
	var empId = $("#empIdInput").val();
	
	$.ajax({
		url: "/otipms/deleteTask",
		method: "POST",
		data: {
			taskNo:taskNo,
			empId:empId
		},
		success: function(data) {
			console.log(data);
			var taskhtml = '';
			if(data.taskList != null && data.taskList.length != 0) {
				var taskEmployeeTr = $("#employeeId" + empId);
				//var taskEmployeeTr = $("#employeeId" + data.taskList[0].empId);
				
				$.each(data.taskList, function(index, task) {
					taskhtml += '<tr class="table-hover" id="task' + task.taskNo + '" onclick="taskTr(this)">';
					taskhtml += '<td style="padding-left: 20px;">' + (index + 1) + '</td>';
					taskhtml += '<td>' + task.taskName + '</td>';
					taskhtml += '<td>' + dateFormat(new Date(task.taskStartDate), 1) + '</td>';
					if(task.taskEndDate != null) {
						taskhtml += '<td class="text-center">' + dateFormat(new Date(task.taskEndDate), 1) + '</td>';
					} else {
						taskhtml += '<td class="text-center"> - </td>';
					}
					if(task.taskStatus == "진행전") {
						taskhtml += '<td class="text-center text-secondary">' + task.taskStatus + '</td>';
					} else if(task.taskStatus == "진행중") {
						taskhtml += '<td class="text-center text-success">' + task.taskStatus + '</td>';
					} else if(task.taskStatus == "진행완료") {
						taskhtml += '<td class="text-center text-danger">' + task.taskStatus + '</td>';
					}
					taskhtml += '<td class="text-center">';
					taskhtml += '<button type="button" id="deleteTaskBtn" name="' + task.taskNo + '" class="btn fa fa-trash-o color-danger" data-toggle="modal" data-target="#modalGrid" onclick="deleteTaskBtn(this)"></button>';
					taskhtml += '</td>';
					taskhtml += '</tr>';
				});
			}

			taskEmployeeTr.next().find(".detailTaskBody").html(taskhtml);
			
			$("#taskNoInput").val('');
			$("#taskName").val('');
			$("#taskComment").val('');
			$("#empIdInput").val('');
			$("#employeeName").val('');
			$("#startDate").val(dateFormat(new Date(), 1));
			$("#endDate").val('');
			$("#defaultStatus").prop("selected", "selected");
			

			console.log(data.progressRate);
			taskehtml = "";
			if(data.progressRate < 20) {
				taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-frown-o" aria-hidden="true"></i><span class="float-right">' + data.progressRate + '%</span></h5>';
				taskehtml += '<div class="progress" style="height: 9px">';
				taskehtml += '<div class="progress-bar bg-danger wow  progress-" style="width: ' + data.progressRate + '%;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
				taskehtml += '</div>';
			} else if(20 <= data.progressRate && data.progressRate < 80) {
				taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-meh-o" aria-hidden="true"></i><span class="float-right">' + data.progressRate + '%</span></h5>';
				taskehtml += '<div class="progress" style="height: 9px">';
				taskehtml += '<div class="progress-bar bg-info wow  progress-" style="width: ' + data.progressRate + '%;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
				taskehtml += '</div>';
			} else if(80 <= data.progressRate) {
				taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-smile-o" aria-hidden="true"></i><span class="float-right">' + data.progressRate + '%</span></h5>';
				taskehtml += '<div class="progress" style="height: 9px">';
				taskehtml += '<div class="progress-bar bg-success wow  progress-" style="width: ' + data.progressRate + '%;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
				taskehtml += '</div>';
			}
			console.log(taskehtml);
			
			var taskEmployeeTr = $("#employeeId" + empId);
			taskEmployeeTr.find(".progressTd").html(taskehtml);

		},
		error: function(error) {
			//console.log(error);
		}
	});
}

//새로 추가
function addTask() {
	console.log("추가 클릭")
	
	$("#registerTaskBtn").removeClass("d-none");
	$("#updateTaskBtn").addClass("d-none");
	
	resetForm();
	$("#startDate").val(dateFormat(new Date(), 1));
}

//초기화
function resetForm() {
	$("#taskNoInput").val('');
	$("#taskName").val('');
	$("#taskComment").val('');
	$("#empIdInput").val('');
	$("#employeeName").val('');
	$("#startDate").val('');
	$("#endDate").val('');
	$("#defaultStatus").prop("selected", "selected");
}

//등록 또는 수정 시 유효성 검사
function checkInvalidation() {
	var result = false;
	
	//업무 이름
	var taskNameInval = false;
	if($("#taskName").val() == "" || $("#taskName").val() == null) {
		$("#taskNameInval").removeClass("d-none");
		taskNameInval = false;
	} else {
		$("#taskNameInval").addClass("d-none");
		taskNameInval = true;
	}
	
	//사원번호
	/*if($("#empIdInput").val() == "" || $("#empIdInput").val() == null) {
		$("#empIdInval").removeClass("d-none");
		result = false;
	} else {
		$("#empIdInval").addClass("d-none");
		result = true;
	}*/
	
	//담당자 이름
	var empNameInval = false;
	if($("#employeeName").val() == "" || $("#employeeName").val() == null) {
		$("#empIdInval").removeClass("d-none");
		empNameInval = false;
	} else {
		$("#empIdInval").addClass("d-none");
		empNameInval = true;
	}

	//시작일
	var startDateInval = false;
	if($("#startDate").val() == "" || $("#startDate").val() == null) {
		$("#startDateInval").removeClass("d-none");
		startDateInval = false;
	} else {
		$("#startDateInval").addClass("d-none");
		startDateInval = true;
	}
	
	if(taskNameInval && empNameInval && startDateInval) {
		result = true;
	}
	
	return result;
}

//날짜 포맷 함수
function dateFormat(date, type) {
    let month = date.getMonth() + 1;
    let day = date.getDate();
    let hour = date.getHours();
    let minute = date.getMinutes();
    let second = date.getSeconds();

    month = month >= 10 ? month : '0' + month;
    day = day >= 10 ? day : '0' + day;
    hour = hour >= 10 ? hour : '0' + hour;
    minute = minute >= 10 ? minute : '0' + minute;
    second = second >= 10 ? second : '0' + second;
    
    switch(type) {
    case 1: return date.getFullYear() + '-' + month + '-' + day;
    case 2: return hour + ':' + minute;
    default: return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute;
    }

    return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute;
}