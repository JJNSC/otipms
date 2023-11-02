window.onload = function(){
	var webSocket = new WebSocket("ws://localhost:8080/otipms/ws-alarm");
	var empId = document.getElementById("memIdSpan").value;
	var v_alarmIcon = document.querySelector("#alarmIcon");
	if(v_alarmIcon){
		v_alarmIcon.style.display = 'none';
	}
	var previousAlarmCount = 0;
	
	webSocket.onopen = () => {
		console.log("소켓 오픈");
		
		webSocket.send(empId);
		updateAlarmCount();
		updateTotalAlarmCount();
		$.get("http://localhost:8080/otipms/alarms?empId=" + empId, function (alarmData) {
	        updateAlarmList(alarmData);
		});
	}
	
	webSocket.onmessage = (e) => {
		console.log("새로운 메시지 도착:", e.data);
		var alarmData = JSON.parse(e.data);
		const alarmCount = alarmData.alcount;
		const alarms = alarmData.alarms;
		const messageCount = alarmData.mscount;
		const messages = alarmData.messages;
		previousAlarmCount = alarmCount; // 이전 알림 개수 업데이트
		
		//알람 수 변경(헤더의 알람 수)
		updateAlarmCount();
		//총 알람 갯수 변경(쪽지 알람의 총 갯수 표기)
		updateTotalAlarmCount();
		//웹소켓 세션에 접속한 사람의 쪽지 알람 리스트 변경
		$.get("http://localhost:8080/otipms/alarms?empId=" + empId, function (alarmData) {
			updateAlarmList(alarmData);
		});
		
	    
		//알람 갯수 > 이전 알람 갯수 일 경우
	    if (alarmCount > previousAlarmCount) {
	    	//알람 토스트 띄우기
	    	showAlarmIcon(v_alarmIcon);
	    }
	    
	    //쪽지함 쪽지 실시간 변경
	    $.get("http://localhost:8080/otipms/mail/receivedMails?empId="+empId, function(alarmData){
	    	updateMessageList(alarmData);
	    });
	}
	
	
	//안읽은 알람 수
	var updateAlarmCount = function () {
	    // 알림 개수를 업데이트
	    $.get("http://localhost:8080/otipms/alarmCnt?empId=" + empId, function (data) {
	      var alarmCount = data;
	      $("#alarmCnt").text(alarmCount);
	      $("#alarmCnt2").text(alarmCount);
	    });
	  };
	
	//쪽지 알람의 내용
	var updateAlarmList = (alarmData) => {
	    var alarmList = document.getElementById("alarmList");
	    
	    if(alarmList){
	    	alarmList.innerHTML = ""; 
	    	
	    	// 알림 목록 업데이트
	    	alarmData.forEach((alarm) => {
	    		var alarmItem = document.createElement("li");
	    		if (alarm.alarmChk === 1) {
	    			alarmItem.className = "pl-2 bg-secondary";
	    		} else {
	    			alarmItem.className = "pl-2";
	    		}
	    		var alarmDateFormatted = formatAlarmDate(alarm.alarmDate);
	    		
	    		var alarmContent = `
	    			<a href="javascript:void(window.open('mail/detailMail?messageNo=${alarm.alarmMessageNo}','_blank','width=920, height=680, left=800, top=30'))" onclick="updateCheckedAlarm(${alarm.alarmNo})">
	    			<span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
	    			<div class="notification-content">
	    			<h6 class="notification-heading">${alarm.alarmContentCode}</h6>
	    			<p class="notification-text">${alarm.alarmContent}</p>
	    			<span class="notification-heading">${alarmDateFormatted}</span>
	    			</div>
	    			</a>
	    			`;
	    		
	    		alarmItem.innerHTML = alarmContent;
	    		alarmList.appendChild(alarmItem);
	    	});
	    }
	  }
		
	//총 알람 갯수
	var updateTotalAlarmCount = function () {
	  $.get("http://localhost:8080/otipms/alarmTotalCnt?empId=" + empId, function (data) {
	    var totalAlarmCount = data;
	    var totalAlarmCountSpan = document.getElementById("totalAlarmCount");
	    if (totalAlarmCountSpan) {
	      totalAlarmCountSpan.innerText = totalAlarmCount;
	    }
	  });
	}
	
	var updateMessageList = (alarmData) => {
		var emailListContainer = document.getElementById("email-list-container");
	    if(emailListContainer){
	    	emailListContainer.innerHTML = ""; // 기존 메일 목록을 초기화합니다.
	    	
	    	alarmData.forEach((message, index) => {
	    		var messageDiv = document.createElement("div");
	    		messageDiv.className = "message message-" + (index + 1);
	    		
	    		console.log("시간 바꾸기 전 : " + message.messageReservedDate);
	    		var messageDateFormatted = parseMessageDate(message.messageReservedDate);
	    		console.log("시간 : " + messageDateFormatted);
	    		
	    		// 메일 내용을 생성합니다.
	    		var messageContent = `
	    			<div class="col-mail col-mail-1 received">
	    			<div class="email-checkbox">
	    			<input type="checkbox" id="chk${index+1}" value="${message.messageNo}">
	    			<label class="toggle" for="chk${index+1}"></label>
	    			</div>
	    			<span class="icon-copy ${message.messageImportant == 1 ? 'ion-ios-star star' : 'star ion-ios-star-outline'}" onclick="checkimportant(${message.messageNo}, ${index+1}, event)"></span>
	    			<span class="icon-copy ${message.messageChecked == 1 ? 'ion-android-mail' : 'ion-android-drafts'} mail"></span>
	    			</div>
	    			<div class="col-mail col-mail-profile">
	    			<div class="profile">
	    			<img src="/otipms/resources/images/users/2.jpg" height="40" width="40">
	    			<span class="rank">${message.empRank}</span>
	    			<span class="name">${message.empName}</span>
	    			</div>
	    			</div>
	    			<a href="detailMail?messageNo=${message.messageNo}" onclick="updateMessageChecked(${message.ccNo})">
	    			<div class="col-mail col-mail-2">
	    			<div class="subject">${message.messageTitle}</div>
	    			<div class="clip">
	    			<span class="icon-copy ion-paperclip mr-5"></span>
	    			</div>
	    			<div class="date">
	    			${messageDateFormatted}
	    			</div>
	    			</div>
	    			</a>
	    			`;
	    		
	    		messageDiv.innerHTML = messageContent;
	    		emailListContainer.appendChild(messageDiv);
	    	});
	    }
	}
	
}

//실시간 쪽지 알림을 위한 체킹
function updateCheckedAlarm(alarmNo) {
	$.ajax({
		type: "POST", 
		url: "http://localhost:8080/otipms/updateCheckedAlarm", 
		data: { alarmNo: alarmNo },
		success: function (data) {
			webSocket.send(empId);
		},
		error: function () {
			alert("서버 오류: 업데이트를 완료할 수 없습니다.");
		}
	});
}

//알람 보여주는 함수
function showAlarmIcon(v_alarmIcon) {
	if(v_alarmIcon){
		v_alarmIcon.style.display = 'inline';
		v_alarmIcon.style.transition = "opacity 2s";
		v_alarmIcon.style.opacity = 1;
		
		setTimeout(() => {
			v_alarmIcon.style.opacity = 0;
			
			setTimeout(() => {
				v_alarmIcon.style.display = 'none';
			}, 2000);
		}, 5000);
	}
}

//파싱한 날짜 원하는 값만 뽑아서 보기
function formatAlarmDate(alarmDate) {
	const options = { year: '2-digit', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', second: '2-digit', hour12: true };
	var formattedDate = new Date(alarmDate).toLocaleString('en-US', options);
	return formattedDate;
}

//Date값 형태의 날짜 파싱
function parseTO_DATE(toDateStr) {
	const parts = toDateStr.match(/(\d+)/g);
	if (parts.length !== 6) {
		return null;
	}
	
	const year = parseInt(parts[0]);
	const month = parseInt(parts[1]) - 1;
	const day = parseInt(parts[2]);
	const hours = parseInt(parts[3]);
	const minutes = parseInt(parts[4]);
	const seconds = parseInt(parts[5]);
	
	return new Date(year, month, day, hours, minutes, seconds);
}

function parseMessageDate(messageDate){
	var messageDateObj = new Date(messageDate);
	var currentDate = new Date();
	
	var isSameDate =
		currentDate.getFullYear() === messageDateObj.getFullYear() &&
		currentDate.getMonth() === messageDateObj.getMonth() &&
		currentDate.getDate() === messageDateObj.getDate();
	
	var dateFormatted;
	if(isSameDate){
		dateFormatted = messageDateObj.toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit' });
	} else {
		dateFormatted = messageDateObj.toLocaleDateString('en-US', { year: '2-digit', month: '2-digit', day: '2-digit' });
	}
	return dateFormatted;
}