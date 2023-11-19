function createSchedule() {
	var scheduleName = $("#scheduleNameInput").val();
	var scheduleComment = $("#scheduleCommentInput").val();
	var scheduleStartDate = $("#scheduleStartDateInput").val();
	var scheduleEndDate = $("#scheduleEndDateInput").val();
	var scheduleColor = $("#scheduleColorSelect").val();
	
	location.href = "createSchedule?"
		+ "scheduleName=" + encodeURIComponent(scheduleName)
		+ "&scheduleComment=" + encodeURIComponent(scheduleComment)
		+ "&scheduleStartDate=" + encodeURIComponent(scheduleStartDate)
		+ "&scheduleEndDate=" + encodeURIComponent(scheduleEndDate)
		+ "&scheduleColor=" + encodeURIComponent(scheduleColor);
	
}

//일정 수정
function updateSchedule() {
	var scheduleNo = $("#scheduleNoInput").val();
	var scheduleName = $("#scheduleNameInput").val();
	var scheduleComment = $("#scheduleCommentInput").val();
	var scheduleStartDate = $("#scheduleStartDateInput").val();
	var scheduleEndDate = $("#scheduleEndDateInput").val();
	var scheduleColor = $("#scheduleColorSelect").val();
	
	//$("#add-category").hide();
	
	location.href = "updateSchedule?"
		+ "scheduleNo=" + encodeURIComponent(scheduleNo)
		+ "&scheduleName=" + encodeURIComponent(scheduleName)
		+ "&scheduleComment=" + encodeURIComponent(scheduleComment)
		+ "&scheduleStartDate=" + encodeURIComponent(scheduleStartDate)
		+ "&scheduleEndDate=" + encodeURIComponent(scheduleEndDate)
		+ "&scheduleColor=" + encodeURIComponent(scheduleColor);
}

function deleteSchedule(a) {
	var scheduleNo = $(a).parent().find("input").val();
	
	location.href = "deleteSchedule?"
		+ "scheduleNo=" + encodeURIComponent(scheduleNo);
}

//체크박스 클릭 시
function checkSchedule(isChecked, scheduleNo) {
	var scheduleChecked = isChecked;
	
	$.ajax({
		url: "/otipms/changeScheduleChecked",
		method: "post",
		data: {
			scheduleChecked:scheduleChecked,
			scheduleNo:scheduleNo
		},
		success: function(data) {
		
		},
		error: function(error) {
		}
	});
}

//상세 모달
function openDetailModal(scheduleNo) {
	$.ajax({
		url: "/otipms/getSchedule",
		method: "post",
		data: {
			scheduleNo:scheduleNo
		},
		success: function(data) {
			$("#modalTitle").html("일정 상세")
			
			$("#scheduleNoInput").val(data.scheduleNo);
			$("#scheduleNameInput").val(data.scheduleName);
			$("#scheduleCommentInput").val(data.scheduleComment);
			$("#scheduleStartDateInput").val(dateFormat(new Date(data.scheduleStartDate), 4));
			$("#scheduleEndDateInput").val(dateFormat(new Date(data.scheduleEndDate), 4));
			$("#scheduleColorSelect option[value='" + data.scheduleColor + "']").prop("selected", true);
			
			$("#addBtn").addClass("d-none");
			$("#updateBtn").removeClass("d-none");
		},
		error: function(error) {
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
    case 3: return date.getFullYear() + '/' + month + '/' + day;
    case 4: return date.getFullYear() + '-' + month + '-' + day + "T" + hour + ":" + minute;
    default: return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute;
    }

    return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute;
}