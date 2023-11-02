window.onload = function(){
	var webSocket = new WebSocket("ws://localhost:8080/otipms/ws-alarm");
	var empId = document.getElementById("memIdSpan").value;
	var cntSpan = document.getElementById("cntSpan")
	if (cntSpan) {
		var cnt = cntSpan.value;
	}
	var v_alarmIcon = document.querySelector("#alarmIcon");
	if(v_alarmIcon){
		v_alarmIcon.style.display = 'none';
	}
	var previousAlarmCount = 0;
	
	var alarmData = {
	        alarmCount: 0,
	        alarmList: [],
	        messageCount: 0,
	        messageList: []
	    };
	
	webSocket.onopen = () => {
		console.log("소켓 오픈");
		
		webSocket.send(empId);
		updateAlarmCount();
		updateTotalAlarmCount();
		$.get("http://localhost:8080/otipms/alarms?empId=" + empId, function (alarmList) {
	        updateAlarmList(alarmList);
		});
	}
	
	webSocket.onmessage = (e) => {
		var receivedData = JSON.parse(e.data);
		alarmData.alarmList = receivedData.alarmList;
	    alarmData.messageList = receivedData.messageList;
	    alarmData.alcount = receivedData.alcount;
	    var messageCount = receivedData.mscount;
	    previousAlarmCount = alarmData.alcount; // 이전 알림 개수 업데이트
		
		//알람 수 변경(헤더의 알람 수)
		updateAlarmCount();
		//총 알람 갯수 변경(쪽지 알람의 총 갯수 표기)
		updateTotalAlarmCount();
		//웹소켓 세션에 접속한 사람의 쪽지 알람 리스트 변경
		$.get("http://localhost:8080/otipms/alarms?empId=" + empId, function (alarmList) {
			updateAlarmList(alarmList);
		});
		
		//알람 갯수 > 이전 알람 갯수 일 경우
	    if (alarmData.alcount > previousAlarmCount) {
	    	//알람 토스트 띄우기
	    	showAlarmIcon(v_alarmIcon);
	    }
	    
	    //쪽지함 쪽지 실시간 변경
	    $.get("http://localhost:8080/otipms/mail/receivedMails?empId="+empId, function(messageList){
	    	updateMessageList(messageList);
	    	updatePaging(messageList);
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
	function updateAlarmList(alarmList){
	    var alarmListContainer = document.getElementById("alarmList");
	    
	    if(alarmListContainer){
	    	alarmListContainer.innerHTML = ""; 
	    	
	    	// 알림 목록 업데이트
	    	alarmList.forEach((alarm) => {
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
	    		alarmListContainer.appendChild(alarmItem);
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
	
	function updateMessageList(messageList) {
		var messageListContainer  = document.getElementById("email-list-container");
	    
		if(messageListContainer){
	    	messageListContainer.innerHTML = ""; // 기존 메일 목록을 초기화합니다.
	    	
	    	
	    	messageList.forEach((message, index) => {
	    		var messageDiv = document.createElement("div");
	    		messageDiv.className = "message message-" + (index + 1);
	    		
	    		var messageDateFormatted = parseMessageDate(message.messageReservedDate);
	    		
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
	    		messageListContainer.appendChild(messageDiv);
	    	});
	    }
	}
	
	function updatePaging(messageList) {
		var filteredEmailsCountContainer = document.getElementById("cntSpan")
		if (filteredEmailsCountContainer) {
			var filteredEmailsCount = filteredEmailsCountContainer.value;
		}
	    var itemsPerPage = 10; // 페이지당 보여질 쪽지 수
	    var totalPages = Math.ceil(filteredEmailsCount / itemsPerPage);
	    console.log("메일 수 : " + filteredEmailsCount)
	    console.log("쪽 수 : " + totalPages)
	    
	    var pagingContainer = document.getElementById("pagingContainer");
	    pagingContainer.innerHTML = ""; // 기존 페이지 버튼 초기화
	    var navElement = document.createElement("nav");
	    var ulElement = document.createElement("ul");
	    ulElement.className = "pagination";
	    for (var i = 1; i <= totalPages; i++) {
	    	var pageli = document.createElement("li");
	    	pageli.className = "page-item";
	        var pageButton = document.createElement("a");
	    	pageButton.className = "page-link";
	        pageButton.innerText = i;
	        pageButton.dataset.page = i; // 페이지 번호를 data 속성으로 저장
	        showEmailsForPage(1,10,messageList);
	        console.log(messageList);
	        pageButton.addEventListener("click", function (event) {
	            // 페이지 버튼을 클릭했을 때 해당 페이지의 쪽지를 보여줌
	            var pageNumber = event.target.dataset.page;
	            console.log(pageNumber);
	            console.log(itemsPerPage);
	            showEmailsForPage(pageNumber, itemsPerPage, messageList);
	        });
	        pageli.appendChild(pageButton);
	        ulElement.appendChild(pageli);
	    }
	    navElement.appendChild(ulElement);
	    pagingContainer.appendChild(navElement);
	}
		
	function showEmailsForPage(pageNumber, itemsPerPage, messageList) {
		// 시작 및 종료 인덱스 계산
		var startIndex = (pageNumber - 1) * itemsPerPage;
		var endIndex = startIndex + itemsPerPage;
		console.log(messageList);
		var messagesToDisplay  = messageList.slice(startIndex, endIndex);
		
		console.log(startIndex);
		console.log(endIndex);
		console.log(messagesToDisplay);
		
		updateMessageList(messagesToDisplay);
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

