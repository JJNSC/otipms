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
	
	/*location.href = "detailView/buyDirect?"
		+ "pnos=" + encodeURIComponent(pnos.join(','))
		+ "&pnames=" + encodeURIComponent(pnames.join(','))
		+ "&options=" + encodeURIComponent(options.join(','))
		+ "&stocks=" + encodeURIComponent(stocks.join(','))
		+ "&prices=" + encodeURIComponent(prices.join(','))
		+ "&totalPrice=" + encodeURIComponent(totalPrice)
		+ "&shippingPrice=" + encodeURIComponent(shippingPrice)
		+ "&orderPrice=" + encodeURIComponent(orderPrice);*/
	
	/*$.ajax({
		url: "/otipms/getProjectDetail",
		method: "post",
		data: {
			projectNo:projectNo
		},
		success: function(data) {
		
		},
		error: function(error) {
			console.log(error);
		}
	});*/
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
	console.log("삭제 클릭 " + scheduleNo);
	
	location.href = "deleteSchedule?"
		+ "scheduleNo=" + encodeURIComponent(scheduleNo);
}

//체크박스 클릭 시
function checkSchedule(isChecked, scheduleNo) {
	var scheduleChecked = isChecked;
	console.log("체크? " + scheduleChecked);
	
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
			console.log(error);
		}
	});
}

//상세 모달
function openDetailModal(scheduleNo) {
	console.log(scheduleNo);
	$.ajax({
		url: "/otipms/getSchedule",
		method: "post",
		data: {
			scheduleNo:scheduleNo
		},
		success: function(data) {
			$("#scheduleNoInput").val(data.scheduleNo);
			$("#scheduleNameInput").val(data.scheduleName);
			$("#scheduleCommentInput").val(data.scheduleComment);
			$("#scheduleStartDateInput").val(dateFormat(new Date(data.scheduleStartDate), 1));
			$("#scheduleEndDateInput").val(dateFormat(new Date(data.scheduleEndDate), 1));
			$("#scheduleColorSelect option[value='" + data.scheduleColor + "']").prop("selected", true);
			
			$("#addBtn").addClass("d-none");
			$("#updateBtn").removeClass("d-none");
		},
		error: function(error) {
			console.log(error);
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
    default: return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute;
    }

    return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute;
}