/*window.onload = function() {
			today = new Date();
			console.log("today.toISOString() >>>" + today.toISOString());
			today = today.toISOString().slice(0, 10);
			console.log("today >>>> " + today);
			bir = document.getElementById("startDate");
			bir.value = today;
		}*/


//=============개인 업무 관리==================

//프로젝트 상세버튼
function openProjectDetail() {
	var projectNo = $("#projectNoInput").val();
	
	$.ajax({
		url: "/otipms/getProjectDetail",
		method: "post",
		data: {
			projectNo:projectNo
		},
		success: function(data) {
			$("#taskNoLabel").html("프로젝트 번호 (히든 처리할 예정)")
			$("#projectNoInput").val(data.projectNo);
			$("#taskNameLabel").html("프로젝트 이름")
			$("#taskNameInput").val(data.projectName);
			$("#taskCommentLabel").html("프로젝트 개요")
			$("#taskCommentInput").val(data.projectContent);
			//담당자
			$("#taskEmpInput").val(data.empName);
			//기간
			//$("#projectDateInput").val(dateFormat(new Date(data.projectStartDate), 3) + " - " + dateFormat(new Date(data.projectEndDate), 3));
			//시작일
			$("#taskStartDateInput").val(dateFormat(new Date(data.projectStartDate), 1));
			//종료일
			$("#taskEndDateInput").val(dateFormat(new Date(data.projectEndDate), 1));
			//고객명
			$("#taskClientInput").val(data.projectCompanyName);
			//작업상태
			$("#taskStatusSelect option[value='진행중']").prop("selected", true);
		},
		error: function(error) {
			console.log(error);
		}
	});
	
	//작업개요 readonly 추가
	$("#taskCommentInput").attr("readonly", true);
	//기간 d-none 추가
	//$("#taskDateInput").addClass("d-none");
	//$("#projectDateInput").removeClass("d-none");
	//시작일 readonly 추가
	$("#taskStartDateInput").attr("readonly", true);
	//종료일 readonly 추가
	$("#taskEndDateInput").attr("readonly", true);
	//고객명 d-none 제거
	$("#taskDetailForm-client").removeClass("d-none");
	//색상 d-none 추가
	$("#taskDetailForm-color").addClass("d-none");
	//작업상태 readonly 추가
	$("#taskStatusSelect").attr("readonly", true);
	$("#taskStatusSelect option").attr("disabled", true);
	//수정버튼 d-none 추가
	$("#updateMoalBtn").addClass("d-none");
}

//태스크 상세
function openTaskDetail(detailBtn) {
	var taskNo = $(detailBtn).prev().val();
	
	$.ajax({
		url: "/otipms/getTaskDetail",
		method: "post",
		data: {
			taskNo:taskNo
		},
		success: function(data) {
			$("#taskNoLabel").html("업무 번호 (히든 처리할 예정)")
			$("#taskNoInput").val(data.taskNo);
			$("#taskNameLabel").html("업무 이름")
			$("#taskNameInput").val(data.taskName);
			$("#taskCommentLabel").html("업무 개요")
			$("#taskCommentInput").val(data.taskComment);
			//담당자
			$("#taskEmpInput").val(data.empName);
			//기간
			//$("#taskDateInput").val(dateFormat(new Date(data.taskStartDate), 3) + " - " + dateFormat(new Date(data.taskEndDate), 3));
			//시작일
			$("#taskStartDateInput").val(dateFormat(new Date(data.taskStartDate), 1));
			//종료일
			$("#taskEndDateInput").val(dateFormat(new Date(data.taskEndDate), 1));
			//작업상태
			$("#taskStatusSelect option[value='" + data.taskStatus + "']").prop("selected", true);
			/*if(data.taskStatus == '작업전') {
				$("#taskStatusSelect option[value='taskBefore']").prop("selected", true);
			} else if(data.taskStatus == '작업중') {
				$("#taskStatusSelect option[value='taskIng']").prop("selected", true);
			} else if(data.taskStatus == '작업완료') {
				$("#taskStatusSelect option[value='taskDone']").prop("selected", true);
			}*/
			//작업색상
			$("#taskColorSelect option[value='" + data.taskColor + "']").prop("selected", true);
		},
		error: function(error) {
			console.log(error);
		}
	});
	
	//작업개요 readonly 제거
	$("#taskCommentInput").attr("readonly", false);
	//기간 d-none 제거
	//$("#taskDateInput").removeClass("d-none");
	//$("#projectDateInput").addClass("d-none");
	//시작일 readonly 제거
	$("#taskStartDateInput").attr("readonly", false);
	//종료일 readonly 제거
	$("#taskEndDateInput").attr("readonly", false);
	//고객명 d-none 추가
	$("#taskDetailForm-client").addClass("d-none");
	//색상 d-none 제거
	$("#taskDetailForm-color").removeClass("d-none");
	//작업상태 readonly 제거
	$("#taskStatusSelect").attr("readonly", false);
	$("#taskStatusSelect option").attr("disabled", false);
	//수정버튼 d-none 제거
	$("#updateMoalBtn").removeClass("d-none");
}

//태스크 수정
function updateTaskDetail() {
	var taskNo = $("#taskNoInput").val();
	var taskComment = $("#taskCommentInput").val();
	var taskStartDate = $("#taskStartDateInput").val();
	var taskEndDate = $("#taskEndDateInput").val();
	var taskStatus = $("#taskStatusSelect").val();
	var taskColor = $("#taskColorSelect").val();
	
	$.ajax({
		url: "/otipms/updateTask",
		method: "post",
		data: {
			taskNo:taskNo,
			taskComment:taskComment,
			startDate:taskStartDate,
			endDate:taskEndDate,
			status:taskStatus,
			taskColor:taskColor
		},
		success: function(data) {
			let html = '';
			
			html += '<tr>';
			html += '<td><div class="taskEvent-red mb-1" style="position: relative;">' + data.project.projectName + '</div></td>';
			html += '<td style="color: #2b5797;">진행중</td>';
			html += '<td><button class="btn btn-sm btn-detail" data-toggle="modal" data-target="#taskDetail" onclick="openProjectDetail()">상세</button></td>';
			html += '</tr>';
			
			if(data.taskList != null && data.taskList.length != 0) {
				$.each(data.taskList, function(index, task) {
					html += '<tr>';
					html += '<td><div class="taskEvent-' + task.taskColor + ' mb-1" style="position: relative;">' + task.taskName + '</div></td>';
					if(task.taskStatus == '진행전') {
						html += '<td style="color: #b5b5b5; font-weight: 600;">' + task.taskStatus + '</td>';
					} else if(task.taskStatus == '진행중') {
						html += '<td style="color: #2b5797; font-weight: 600;">' + task.taskStatus + '</td>';
					} else if(task.taskStatus == '진행완료') {
						html += '<td style="color: #00aba9; font-weight: 600;">' + task.taskStatus + '</td>';
					}
					html += '<td>';
					html += '<input id="taskNoFromModel" type="hidden" value="' + task.taskNo + '">';
					html += '<button class="btn btn-sm btn-detail" data-toggle="modal" data-target="#taskDetail" onclick="openTaskDetail(this)">상세</button>';
					html += '</td>';
					html += '</tr>';
				});
			}
			
			$("#taskListTableBody").html(html);
		},
		error: function(error) {
			console.log(error);
		}
	});
}

//=============프로젝트 업무 관리==================

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
						taskehtml += '<div class="progress-bar wow  progress-" style="width: ' + taskEmployee.progressRate + '%; background-color:#dd2c00;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
						taskehtml += '</div>';
					} else if(20 <= taskEmployee.progressRate && taskEmployee.progressRate < 80) {
						taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-meh-o" aria-hidden="true"></i><span class="float-right">' + taskEmployee.progressRate + '%</span></h5>';
						taskehtml += '<div class="progress" style="height: 9px">';
						taskehtml += '<div class="progress-bar wow  progress-" style="width: ' + taskEmployee.progressRate + '%; background-color:#2b5797;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
						taskehtml += '</div>';
					} else if(80 <= taskEmployee.progressRate) {
						taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-smile-o" aria-hidden="true"></i><span class="float-right">' + taskEmployee.progressRate + '%</span></h5>';
						taskehtml += '<div class="progress" style="height: 9px">';
						taskehtml += '<div class="progress-bar wow  progress-" style="width: ' + taskEmployee.progressRate + '%; background-color:#00aba9;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
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
					if($("#loginEmployeeRole").val() == "ROLE_ADMIN" || $("#loginEmployeeRole").val() == "ROLE_PM") {
						taskehtml += '<button type="button" class="btn mt-3 mb-1 btn-primary"';
						taskehtml += 'style="position: absolute;';
						taskehtml += 'top: 0.3em;';
						taskehtml += 'right: 0.5em;';
						taskehtml += 'background: transparent;';
						taskehtml += 'color: #3E6494;';
						taskehtml += 'border: none;';
						taskehtml += 'font-weight: bolder;"';
						taskehtml += 'value="' + taskEmployee.empId + ',' + taskEmployee.empName + '"';
						taskehtml += 'onclick="addTask(this)"><i class="icon-copy ion-plus mr-1"></i><span style="padding-left: 2px;">추가</span></button>';
					}
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
							taskehtml += '<div class="progress-bar wow  progress-" style="width: ' + taskEmployee.progressRate + '%; background-color:#dd2c00;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
							taskehtml += '</div>';
						} else if(20 <= taskEmployee.progressRate && taskEmployee.progressRate < 80) {
							taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-meh-o" aria-hidden="true"></i><span class="float-right">' + taskEmployee.progressRate + '%</span></h5>';
							taskehtml += '<div class="progress" style="height: 9px">';
							taskehtml += '<div class="progress-bar wow  progress-" style="width: ' + taskEmployee.progressRate + '%; background-color:#2b5797;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
							taskehtml += '</div>';
						} else if(80 <= taskEmployee.progressRate) {
							taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-smile-o" aria-hidden="true"></i><span class="float-right">' + taskEmployee.progressRate + '%</span></h5>';
							taskehtml += '<div class="progress" style="height: 9px">';
							taskehtml += '<div class="progress-bar wow  progress-" style="width: ' + taskEmployee.progressRate + '%; background-color:#00aba9;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
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
						if($("#loginEmployeeRole").val() == "ROLE_ADMIN" || $("#loginEmployeeRole").val() == "ROLE_PM") {
							taskehtml += '<button type="button" class="btn mt-3 mb-1 btn-primary"';
							taskehtml += 'style="position: absolute;';
							taskehtml += 'top: 0.3em;';
							taskehtml += 'right: 0.5em;';
							taskehtml += 'background: transparent;';
							taskehtml += 'color: #3E6494;';
							taskehtml += 'border: none;';
							taskehtml += 'font-weight: bolder;"';
							taskehtml += 'value="' + taskEmployee.empId + ',' + taskEmployee.empName + '"';
							taskehtml += 'onclick="addTask(this)"><i class="icon-copy ion-plus mr-1"></i><span style="padding-left: 2px;">추가</span></button>';
						}
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
								taskhtml += '<td class="text-center" style="color: #b5b5b5; font-weight: 600;">' + task.taskStatus + '</td>';
							} else if(task.taskStatus == "진행중") {
								taskhtml += '<td class="text-center" style="color: #2b5797; font-weight: 600;">' + task.taskStatus + '</td>';
							} else if(task.taskStatus == "진행완료") {
								taskhtml += '<td class="text-center" style="color: #00aba9; font-weight: 600;">' + task.taskStatus + '</td>';
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
					taskehtml += '<div class="progress-bar wow  progress-" style="width: ' + data.progressRate + '%; background-color:#dd2c00;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
					taskehtml += '</div>';
				} else if(20 <= data.progressRate && data.progressRate < 80) {
					taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-meh-o" aria-hidden="true"></i><span class="float-right">' + data.progressRate + '%</span></h5>';
					taskehtml += '<div class="progress" style="height: 9px">';
					taskehtml += '<div class="progress-bar wow  progress-" style="width: ' + data.progressRate + '%; background-color:#2b5797;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
					taskehtml += '</div>';
				} else if(80 <= data.progressRate) {
					taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-smile-o" aria-hidden="true"></i><span class="float-right">' + data.progressRate + '%</span></h5>';
					taskehtml += '<div class="progress" style="height: 9px">';
					taskehtml += '<div class="progress-bar wow  progress-" style="width: ' + data.progressRate + '%; background-color:#00aba9;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
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
						taskhtml += '<td class="text-center" style="color: #b5b5b5; font-weight: 600;">' + task.taskStatus + '</td>';
					} else if(task.taskStatus == "진행중") {
						taskhtml += '<td class="text-center" style="color: #2b5797; font-weight: 600;">' + task.taskStatus + '</td>';
					} else if(task.taskStatus == "진행완료") {
						taskhtml += '<td class="text-center" style="color: #00aba9; font-weight: 600;">' + task.taskStatus + '</td>';
					}
					taskhtml += '<td class="text-center">';
					if(($("#loginEmployeeRole").val() == "ROLE_PE" || $("#loginEmployeeRole").val() == "ROLE_CLIENT") && empId != $("#loginEmployeeId").val()) {
						taskhtml += '<button type="button" id="deleteTaskBtn" name="' + task.taskNo + '" class="btn fa fa-trash-o color-danger d-none" data-toggle="modal" data-target="#modalGrid" onclick="deleteTaskBtn(this)"></button>';
					} else {
						taskhtml += '<button type="button" id="deleteTaskBtn" name="' + task.taskNo + '" class="btn fa fa-trash-o color-danger" data-toggle="modal" data-target="#modalGrid" onclick="deleteTaskBtn(this)"></button>';
					}
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
			
			if(($("#loginEmployeeRole").val() == "ROLE_PE" || $("#loginEmployeeRole").val() == "ROLE_CLIENT") && data.empId == $("#loginEmployeeId").val()) {
				$("#updateTaskBtn").addClass("d-none");

				$("#taskNoInput").attr("readonly", true);
				$("#taskName").attr("readonly", true);
				$("#taskComment").attr("readonly", false);
				$("#empIdInput").attr("readonly", true);
				$("#employeeName").attr("readonly", true);
				$("#startDate").attr("readonly", false);
				$("#endDate").attr("readonly", false);
				$("#status").attr("readonly", false);
				$("#searchHumanBtn").attr("disabled", true);
				$("#status option").attr("disabled", false);
			}
			if(($("#loginEmployeeRole").val() == "ROLE_PE" || $("#loginEmployeeRole").val() == "ROLE_CLIENT") && data.empId != $("#loginEmployeeId").val()) {
				$("#updateTaskBtn").addClass("d-none");
				
				$("#taskNoInput").attr("readonly", true);
				$("#taskName").attr("readonly", true);
				$("#taskComment").attr("readonly", true);
				$("#empIdInput").attr("readonly", true);
				$("#employeeName").attr("readonly", true);
				$("#startDate").attr("readonly", true);
				$("#endDate").attr("readonly", true);
				$("#status").attr("readonly", true);
				$("#searchHumanBtn").attr("disabled", true);
				$("#status option").attr("disabled", true);
			} else {
				$("#registerTaskBtn").addClass("d-none");
				$("#updateTaskBtn").removeClass("d-none");
			}
			

		},
		error: function(error) {
			//console.log(error);
		}
	});
}

//태스크 수정(ADMIN, PM)
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
							taskhtml += '<td class="text-center" style="color: #b5b5b5; font-weight: 600;">' + task.taskStatus + '</td>';
						} else if(task.taskStatus == "진행중") {
							taskhtml += '<td class="text-center" style="color: #2b5797; font-weight: 600;">' + task.taskStatus + '</td>';
						} else if(task.taskStatus == "진행완료") {
							taskhtml += '<td class="text-center" style="color: #00aba9; font-weight: 600;">' + task.taskStatus + '</td>';
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
					taskehtml += '<div class="progress-bar wow  progress-" style="width: ' + data.progressRate + '%; background-color:#dd2c00;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
					taskehtml += '</div>';
				} else if(20 <= data.progressRate && data.progressRate < 80) {
					taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-meh-o" aria-hidden="true"></i><span class="float-right">' + data.progressRate + '%</span></h5>';
					taskehtml += '<div class="progress" style="height: 9px">';
					taskehtml += '<div class="progress-bar wow  progress-" style="width: ' + data.progressRate + '%; background-color:#2b5797;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
					taskehtml += '</div>';
				} else if(80 <= data.progressRate) {
					taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-smile-o" aria-hidden="true"></i><span class="float-right">' + data.progressRate + '%</span></h5>';
					taskehtml += '<div class="progress" style="height: 9px">';
					taskehtml += '<div class="progress-bar wow  progress-" style="width: ' + data.progressRate + '%; background-color:#00aba9;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
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
						taskhtml += '<td class="text-center" style="color: #b5b5b5; font-weight: 600;">' + task.taskStatus + '</td>';
					} else if(task.taskStatus == "진행중") {
						taskhtml += '<td class="text-center" style="color: #2b5797; font-weight: 600;">' + task.taskStatus + '</td>';
					} else if(task.taskStatus == "진행완료") {
						taskhtml += '<td class="text-center" style="color: #00aba9; font-weight: 600;">' + task.taskStatus + '</td>';
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
				taskehtml += '<div class="progress-bar wow  progress-" style="width: ' + data.progressRate + '%; background-color:#dd2c00;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
				taskehtml += '</div>';
			} else if(20 <= data.progressRate && data.progressRate < 80) {
				taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-meh-o" aria-hidden="true"></i><span class="float-right">' + data.progressRate + '%</span></h5>';
				taskehtml += '<div class="progress" style="height: 9px">';
				taskehtml += '<div class="progress-bar wow  progress-" style="width: ' + data.progressRate + '%; background-color:#2b5797;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
				taskehtml += '</div>';
			} else if(80 <= data.progressRate) {
				taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-smile-o" aria-hidden="true"></i><span class="float-right">' + data.progressRate + '%</span></h5>';
				taskehtml += '<div class="progress" style="height: 9px">';
				taskehtml += '<div class="progress-bar wow  progress-" style="width: ' + data.progressRate + '%; background-color:#00aba9;" role="progressbar"><span class="sr-only">60% Complete</span></div>';
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
function addTask(addBtn) {
	console.log("추가 클릭")
	var empId = $(addBtn).val().split(",")[0];
	var empName = $(addBtn).val().split(",")[1];
	
	$("#registerTaskBtn").removeClass("d-none");
	$("#updateTaskBtn").addClass("d-none");
	
	resetForm();
	$("#empIdInput").val(empId);
	$("#employeeName").val(empName);
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
    case 3: return date.getFullYear() + '/' + month + '/' + day;
    default: return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute;
    }

    return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute;
}