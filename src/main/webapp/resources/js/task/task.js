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
					taskehtml += '<tr class="reviewTitle table-hover" data-toggle="collapse" data-review-id="' + taskEmployee.empId + '" id="employeeId' + taskEmployee.empId + '" href="#task' + taskEmployee.empId + '" role="button" aria-expanded="true" aria-controls="collapseExample">';
					taskehtml += '<td>' + taskEmployee.empId + '</td>';
					taskehtml += '<td>' + taskEmployee.projectName + '</td>';
					taskehtml += '<td>' + taskEmployee.teamName + '</td>';
					taskehtml += '<td>' + taskEmployee.empName + '</td>';
					taskehtml += '<td>' + taskEmployee.empRank + '</td>';
					taskehtml += '<td>';
					taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-smile-o" aria-hidden="true"></i><span class="float-right">88%</span></h5>';
					taskehtml += '<div class="progress" style="height: 9px">';
					taskehtml += '<div class="progress-bar bg-info wow  progress-" style="width: 88%;" role="progressbar"><span class="sr-only">60% Complete</span>';
					taskehtml += '</div>';
					taskehtml += '</div>';
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
					taskehtml += '<tr class="table-hover">';
					taskehtml += '<td style="padding-left: 20px;">1</td>';
					taskehtml += '<td>김종진 개인업무1</td>';
					taskehtml += '<td>2023.10.14</td>';
					taskehtml += '<td class="text-center"> - </td>';
					taskehtml += '<td class="text-center text-success">진행중</td>';
					taskehtml += '<td class="text-center">';
					taskehtml += '<button type="button" class="btn fa fa-trash-o color-danger" data-toggle="modal" data-target="#modalGrid"></button>';
					taskehtml += '</td>';
					taskehtml += '</tr>';
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
						taskehtml += '<tr class="reviewTitle table-hover" data-toggle="collapse" data-review-id="' + taskEmployee.empId + '" id="employeeId' + taskEmployee.empId + '" href="#task' + taskEmployee.empId + '" role="button" aria-expanded="true" aria-controls="collapseExample">';
						taskehtml += '<td>' + taskEmployee.empId + '</td>';
						taskehtml += '<td>' + taskEmployee.projectName + '</td>';
						taskehtml += '<td>' + taskEmployee.teamName + '</td>';
						taskehtml += '<td>' + taskEmployee.empName + '</td>';
						taskehtml += '<td>' + taskEmployee.empRank + '</td>';
						taskehtml += '<td>';
						taskehtml += '<h5 class="mt-3"> <i class="icon-copy fa fa-smile-o" aria-hidden="true"></i><span class="float-right">88%</span></h5>';
						taskehtml += '<div class="progress" style="height: 9px">';
						taskehtml += '<div class="progress-bar bg-info wow  progress-" style="width: 88%;" role="progressbar"><span class="sr-only">60% Complete</span>';
						taskehtml += '</div>';
						taskehtml += '</div>';
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
						taskehtml += '<tr class="table-hover">';
						taskehtml += '<td style="padding-left: 20px;">1</td>';
						taskehtml += '<td>김종진 개인업무1</td>';
						taskehtml += '<td>2023.10.14</td>';
						taskehtml += '<td class="text-center"> - </td>';
						taskehtml += '<td class="text-center text-success">진행중</td>';
						taskehtml += '<td class="text-center">';
						taskehtml += '<button type="button" class="btn fa fa-trash-o color-danger" data-toggle="modal" data-target="#modalGrid"></button>';
						taskehtml += '</td>';
						taskehtml += '</tr>';
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

//업무 추가
function addTask() {
	console.log("추가 클릭")
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
			
			if(data != null && data.length != 0) {
				var taskEmployeeTr = $("#employeeId" + empId);
				if(taskEmployeeTr.attr("aria-expanded") == "true") {
					console.log("왜 안될까 ㅠ");
					taskhtml = '';
					
					$.each(data, function(index, task) {
						taskhtml += '<tr class="table-hover">';
						taskhtml += '<td style="padding-left: 20px;">' + index + '</td>';
						taskhtml += '<td>' + task.taskName + '</td>';
						taskhtml += '<td>' + dateFormat(new Date(task.taskStartDate), 1) + '</td>';
						if(task.taskEndDate != null) {
							taskhtml += '<td class="text-center">' + dateFormat(new Date(task.taskEndDate), 1) + '</td>';
						} else {
							taskhtml += '<td class="text-center"> - </td>';
						}
						taskhtml += '<td class="text-center text-success">' + task.taskStatus + '</td>';
						taskhtml += '<td class="text-center">';
						taskhtml += '<button type="button" class="btn fa fa-trash-o color-danger" data-toggle="modal" data-target="#modalGrid"></button>';
						taskhtml += '</td>';
						taskhtml += '</tr>';
					});
					
					console.log("taskhtml: " + taskhtml);
					console.log("내가 찾은 body가 아니었던 건가..?" + taskEmployeeTr.find(".detailTaskBody").html())
					
					taskEmployeeTr.next().find(".detailTaskBody").html(taskhtml);
				}
			}
		},
		error: function(error) {
			//console.log(error);
		}
	});
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