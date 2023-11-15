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
	var v_alarmChatIcon = document.querySelector("#alarmChatIcon");
	if(v_alarmChatIcon){
		v_alarmChatIcon.style.display = 'none';
	}
	var previousAlarmCount = 0;
	var previousChatAlarmCount = 0;
	
	var alarmData = {
			alarmList: [],
			messageList: [],
	        alarmCount: 0,
	        messageCount: 0,
	    };
	var searchInput = document.getElementById("search");
	
	
	webSocket.onopen = () => {
		console.log("소켓 오픈");
		webSocket.send(empId);
		updateAlarmCount();
		updateAlarmChatCount();
		updateTotalAlarmCount();
		$.get("/otipms/alarms?empId=" + empId, function (alarmList) {
	        updateAlarmList(alarmList);
		});
		
		//웹소켓 세션에 접속한 사람의 채팅 알람 리스트 변경
		$.get("/otipms/alarmChat?empId=" + empId, function (chatAlarmList) {
			updateChatAlarmList(chatAlarmList);
		});
		
		$.get("/otipms/mail/receivedMails?empId=" + empId, function(messageList){
			updateMessageList(messageList);
			
			updatePaging(messageList);
		});
		wsSend();
	}
	
	webSocket.onmessage = (e) => {
		var receivedData = JSON.parse(e.data);
		alarmData.alarmList = receivedData.alarms;
	    alarmData.messageList = receivedData.messages;
	    alarmData.alarmCount = receivedData.alcount;
	    alarmData.messageCount = receivedData.mscount;
	    alarmData.chatAlarmList = receivedData.chatalarms;
	    alarmData.chatAlarmCount = receivedData.calcount;
	    var alarmList = alarmData.alarmList;
	    var messageList = alarmData.messageList;
	    var alarmCount = alarmData.alarmCount
	    var messageCount = alarmData.messagecount;
	    var chatAlarmList = alarmData.chatAlarmList;
	    var chatAlarmCount = alarmData.chatAlarmCount;
	    var currentPage = 1;
	    var itemsPerPage = 10;
	    
		//알람 수 변경(헤더의 알람 수)
		updateAlarmCount();
		updateAlarmChatCount();
		//총 알람 갯수 변경(쪽지 알람의 총 갯수 표기)
		updateTotalAlarmCount();
		//웹소켓 세션에 접속한 사람의 쪽지 알람 리스트 변경
		$.get("/otipms/alarms?empId=" + empId, function (alarmList) {
			updateAlarmList(alarmList);
		});
		
		//웹소켓 세션에 접속한 사람의 채팅 알람 리스트 변경
		$.get("/otipms/alarmChat?empId=" + empId, function (chatAlarmList) {
			updateChatAlarmList(chatAlarmList);
		});
		
		//쪽지함 쪽지 실시간 변경
		$.get("/otipms/mail/receivedMails?empId=" + empId, function(messageList){
			updateMessageList(messageList);
			updatePaging(messageList);
		});
		//알람 갯수 > 이전 알람 갯수 일 경우
	    if (alarmCount > previousAlarmCount) {
	    	//알람 토스트 띄우기
	    	showAlarmIcon(v_alarmIcon);
	    	previousAlarmCount = alarmCount;// 이전 알림 개수 업데이트
	    }
	    if (chatAlarmCount > previousChatAlarmCount){
	    	showAlarmChatIcon(v_alarmChatIcon);
	    	previousChatAlarmCount = chatAlarmCount;
	    }
	}
	
	var wsSend=()=>{
		setInterval(function() {
			webSocket.send(empId);
		}, 1500);
	}
	
	//안읽은 알람 수
	var updateAlarmCount = function () {
	    // 알림 개수를 업데이트
	    $.get("/otipms/alarmCnt?empId=" + empId, function (data) {
	      var alarmCount = data;
	      $("#alarmCnt").text(alarmCount);
	      $("#alarmCnt2").text(alarmCount);
	    });
	  };
	
	var updateAlarmChatCount = function () {
		// 채팅 알림 개수 업데이트
		$.get("/otipms/alarmChatCnt?empId="+empId, function(data){
			var alarmCount = data;
			 $("#alarmChatCnt").text(alarmCount);
		      $("#alarmChatCnt2").text(alarmCount);
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
	    			alarmItem.className = "pl-2 bg-read";
	    		} else {
	    			alarmItem.className = "pl-2";
	    		}
	    		var alarmDateFormatted = formatAlarmDate(alarm.alarmDate);
	    		
	    		var alarmContent = `
	    			<a href="javascript:void(window.open('${pageContext.request.contextPath}/mail/detailMail?messageNo=${alarm.alarmMessageNo}','_blank','width=920, height=680, left=800, top=30'))" onclick="updateCheckedAlarm(${alarm.alarmNo})">
	    			<span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-copy fa fa-bell-o" aria-hidden="true"></i></span>
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
	//쪽지 알람의 내용
	function updateChatAlarmList(chatAlarmList){
	    var alarmListContainer = document.getElementById("chatAlarmList");
	    
	    if(alarmListContainer){
	    	alarmListContainer.innerHTML = ""; 
	    	
	    	// 알림 목록 업데이트
	    	chatAlarmList.forEach((alarm) => {
	    		var alarmItem = document.createElement("li");
	    		if (alarm.maxAlarmChk === 1) {
	    			alarmItem.className = "pl-2 bg-read";
	    		} else {
	    			alarmItem.className = "pl-2";
	    		}
	    		var alarmDateFormatted = formatAlarmDate(alarm.maxAlarmDate);
	    		
	    		var alarmContent = `
	    			<a href="javascript:void(window.open('http://192.168.0.169:8080/otipms/chat/chat','_blank','width=813, height=858, left=1000, top=30'))" onclick="updateCheckedChatAlarm()">
	    			<span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-copy fa fa-bell-o" aria-hidden="true"></i></span>
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
	  $.get("/otipms/alarmTotalCnt?empId=" + empId, function (data) {
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
	    			<span class="rank">${message.empRank}</span>
	    			<span class="name">${message.empName}</span>
	    			</div>
	    			</div>
	    			<a href="detailMail?messageNo=${message.messageNo}" onclick="updateMessageChecked(${message.ccNo})">
	    			<div class="col-mail col-mail-2">
	    			<div class="subject">${message.messageTitle}</div>
	    			<div class="clip">
	    			<span class="${message.mediaFile != null && message.mediaFile.length > 0 ? 'icon-copy ion-paperclip mr-5' : ''}"></span>
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
	//날짜 1초마다 업데이트 
	function updateTimeAndDate() {
	    const now = new Date();
	    const timeElement = document.getElementById('time');
	    const dateElement = document.getElementById('date');
	    const dayElement = document.getElementById('day');

	    const hours = now.getHours().toString().padStart(2, '0');
	    const minutes = now.getMinutes().toString().padStart(2, '0');
	    const seconds = now.getSeconds().toString().padStart(2, '0');

	    const year = now.getFullYear();
	    const month = (now.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 +1 해줍니다.
	    const day = now.getDate().toString().padStart(2, '0');
	    
	    const daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
	    
	    const dayOfWeek = daysOfWeek[now.getDay()];

	    timeElement.textContent = `${hours}:${minutes}:${seconds}`;
	    dateElement.textContent = `${year}/${month}/${day} (${dayOfWeek})`;
	}
	
	// 초기 호출 및 1초마다 업데이트
	updateTimeAndDate();
	setInterval(updateTimeAndDate, 1000);
	
	function fetchWeatherData() {
	    const apiKey = 'd882c2af9b206cdc8ebf11d52eaad5df'; // 본인의 API 키로 대체해야 합니다.
	    const apiUrl = `https://api.openweathermap.org/data/2.5/weather?q=Seoul,KR&appid=${apiKey}&units=metric`;

	    fetch(apiUrl)
	        .then((response) => response.json())
	        .then((data) => {
	            const weatherDescription = data.weather[0].description;
	            const temperature = data.main.temp;

	            // 날씨 아이콘 선택
	            let weatherIcon;
	            if (weatherDescription.includes('맑음')) {
	                weatherIcon = '☀️';
	            } else if (weatherDescription.includes('흐림')) {
	                weatherIcon = '☁️';
	            } else if (weatherDescription.includes('비')) {
	                weatherIcon = '🌧️';
	            } else if (weatherDescription.includes('눈')) {
	                weatherIcon = '❄️';
	            } else {
	                weatherIcon = '🌦️';
	            }

	            const weatherElement = document.getElementById('weather');
	            //weatherElement.textContent = `서울 ${weatherIcon} ${temperature}°C`;
	            weatherElement.innerHTML = `<i class="icon-copy ion-location"></i> 서울 ${weatherIcon} ${temperature}°C`;
	        })
	        .catch((error) => {
	            console.error('날씨 정보를 가져오는 중 오류 발생:', error);
	        });
	}

	fetchWeatherData();
	setInterval(fetchWeatherData, 600000); 
	
	function updatePaging(messageList) {
		var filteredEmailsCountContainer = document.getElementById("cntSpan")
		if (filteredEmailsCountContainer) {
			var filteredEmailsCount = filteredEmailsCountContainer.value;
		}
	    var itemsPerPage = 10; // 페이지당 보여질 쪽지 수
	    var totalPages = Math.ceil(filteredEmailsCount / itemsPerPage);
	    
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
	    	pageButton.id = "page-"+i;
	        pageButton.innerText = i;
	        pageButton.dataset.page = i; // 페이지 번호를 data 속성으로 저장
	        showEmailsForPage(1,10,messageList);
	        pageButton.addEventListener("click", function (event) {
	            // 페이지 버튼을 클릭했을 때 해당 페이지의 쪽지를 보여줌
	            var pageNumber = event.target.dataset.page;
	            showEmailsForPage(pageNumber, itemsPerPage, messageList);
	        });
	        pageli.appendChild(pageButton);
	        ulElement.appendChild(pageli);
	    }
	    navElement.appendChild(ulElement);
	    pagingContainer.appendChild(navElement);
	}
	
	function showEmailsForPage(pageNumber, itemsPerPage, messageList) {
		var selectedButton = document.querySelectorAll('[id^="page-"]');
		selectedButton.forEach(function(selectButton){ 
			selectButton.classList.remove("selected");
		});
		
		var currentPage = pageNumber;
		
		var currentButton = document.getElementById("page-"+currentPage);
		if(currentButton){
			currentButton.classList.add("selected");
		} /*else {
			var firstButton = document.getElementById("page-1");
			firstButton.classList.add("selected");
		}*/
		
		// 시작 및 종료 인덱스 계산
		var startIndex = (pageNumber - 1) * itemsPerPage;
		var endIndex = startIndex + itemsPerPage;
		var messagesToDisplay  = messageList.slice(startIndex, endIndex);
		
		updateMessageList(messagesToDisplay);
	}
	
	// 다음 버튼 클릭 이벤트 핸들러
	function onNextButtonClick() {
	    currentPage++; // 다음 페이지 번호로 이동
	    // 메시지 목록 업데이트 및 표시
	    var messagesToDisplay = getMessagesForPage(messageList, currentPage, itemsPerPage);
	    updateMessageList(messagesToDisplay);
	}

	// 이전 버튼 클릭 이벤트 핸들러
	function onPrevButtonClick() {
	    if (currentPage > 1) {
	        currentPage--; // 이전 페이지 번호로 이동
	        // 메시지 목록 업데이트 및 표시
	        var messagesToDisplay = getMessagesForPage(messageList, currentPage, itemsPerPage);
	        updateMessageList(messagesToDisplay);
	    }
	}

	// 페이지 버튼 초기화
	function initializePagination() {
	    // 이전 버튼을 만들고 클릭 이벤트 핸들러 연결
	    var prevButton = document.createElement("button");
	    prevButton.innerText = "이전";
	    prevButton.addEventListener("click", onPrevButtonClick);
	    
	    // 다음 버튼을 만들고 클릭 이벤트 핸들러 연결
	    var nextButton = document.createElement("button");
	    nextButton.innerText = "다음";
	    nextButton.addEventListener("click", onNextButtonClick);
	    
	    // 페이지 버튼 컨테이너에 버튼 추가
	    var pagingContainer = document.getElementById("pagingContainer");
	    pagingContainer.innerHTML = "";
	    pagingContainer.appendChild(prevButton);
	    pagingContainer.appendChild(nextButton);
	}
}

//실시간 쪽지 알림을 위한 체킹
function updateCheckedAlarm(alarmNo) {
	$.ajax({
		type: "POST", 
		url: "/otipms/updateCheckedAlarm", 
		data: { alarmNo: alarmNo },
		success: function (data) {
			webSocket.send(empId);
		},
		error: function () {
			alert("서버 오류: 업데이트를 완료할 수 없습니다.");
		}
	});
}

function updateCheckedChatAlarm(){
	$.ajax({
		type: "POST", 
		url: "/otipms/updateCheckedChatAlarm", 
		success: function () {
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

//알람 보여주는 함수
function showAlarmChatIcon(v_alarmChatIcon) {
	if(v_alarmChatIcon){
		v_alarmChatIcon.style.display = 'inline';
		v_alarmChatIcon.style.transition = "opacity 2s";
		v_alarmChatIcon.style.opacity = 1;
		
		setTimeout(() => {
			v_alarmChatIcon.style.opacity = 0;
			
			setTimeout(() => {
				v_alarmChatIcon.style.display = 'none';
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


//드롭다운 항목 클릭 시 호출되는 함수
function filter(selectedItem) {
    // 버튼 엘리먼트 선택
    var dropdownButton = document.querySelector(".btn-custom");
    // 선택된 항목의 텍스트를 버튼 내용으로 설정
    dropdownButton.innerHTML = selectedItem.innerHTML;
}

function checkall(){
	// HTML에서 "email-select-all" 체크박스 요소를 찾기
	var selectAllCheckbox = document.getElementById("email-select-all");
	// 모든 이메일 체크박스를 찾기
	var emailCheckboxes = document.querySelectorAll(".email-checkbox input[type='checkbox']");
	// "email-select-all" 체크박스가 변경될 때 실행할 함수를 정의
	selectAllCheckbox.addEventListener("change", function () {
		var isChecked = this.checked; // "email-select-all" 체크박스의 상태를 가져오기.
		// 모든 이메일 체크박스를 선택 또는 해제.
		emailCheckboxes.forEach(function (checkbox) {
			checkbox.checked = isChecked;
		});
	});
}

function deletemail(){
	// 모든 이메일 체크박스를 찾기.
    var emailCheckboxes = document.querySelectorAll(".email-checkbox input[type='checkbox']");
    // 선택된 체크박스를 저장할 배열을 만들기.
    var selectedMessageIndices = [];
    // 체크된 체크박스를 확인하고 인덱스를 저장.
    
    emailCheckboxes.forEach(function (checkbox, index) {
        if (checkbox.checked) {
            selectedMessageIndices.push(index);
        }
    });
    
    selectedMessageIndices.forEach(function (index) {
    	var emailCheckbox = emailCheckboxes[index];
        var messageNo = emailCheckbox.value;
        sendToTrash(messageNo, index);
    });
    websocket.send(empId);
}

function realdeletemail() {
	// 모든 이메일 체크박스를 찾기.
    var emailCheckboxes = document.querySelectorAll(".email-checkbox input[type='checkbox']");
    // 선택된 체크박스를 저장할 배열을 만들기.
    var selectedMessageIndices = [];
    // 체크된 체크박스를 확인하고 인덱스를 저장.
    
    emailCheckboxes.forEach(function (checkbox, index) {
        if (checkbox.checked) {
            selectedMessageIndices.push(index);
        }
    });
    
    selectedMessageIndices.forEach(function (index) {
    	var emailCheckbox = emailCheckboxes[index];
        var messageNo = emailCheckbox.value;
        sendToRealTrash(messageNo, index);
    });
    websocket.send(empId);
}

function sendToTrash(messageNo, index) {
    // 서버로 메일을 휴지통으로 보내는 요청을 보냅니다.
    $.ajax({
        type: "POST",
        url: "/otipms/mail/updateMessageTrash", // 서버로 메일을 휴지통으로 보내는 URL
        data: { messageNo: messageNo },
        success: function (data) {
            if (data === "success") {
                // 서버에서 성공적으로 메일을 휴지통으로 보냈을 경우
                var emailMessage = document.querySelector(".message.message-" + (index + 1));
                if (emailMessage) {
                    emailMessage.remove();
                    websocket.send(empId);
                }
            } else {
                alert("서버 오류: 메일을 휴지통으로 보내지 못했습니다.");
            }
        },
        error: function () {
            alert("서버 오류: 메일을 휴지통으로 보내지 못했습니다.");
        }
    });
}


function sendToRealTrash(messageNo, index) {
    // 서버로 메일을 휴지통으로 보내는 요청을 보냅니다.
    $.ajax({
        type: "POST",
        url: "/otipms/mail/updateMessageRealTrash", // 서버로 메일을 휴지통으로 보내는 URL
        data: { messageNo: messageNo },
        success: function (data) {
            if (data === "success") {
                // 서버에서 성공적으로 메일을 휴지통으로 보냈을 경우
                var emailMessage = document.querySelector(".message.message-" + (index + 1));
                if (emailMessage) {
                    emailMessage.remove();
                    websocket.send(empId);
                }
            } else {
                alert("서버 오류: 메일을 휴지통으로 보내지 못했습니다.");
            }
        },
        error: function () {
            alert("서버 오류: 메일을 휴지통으로 보내지 못했습니다.");
        }
    });
}


function checkimportant(messageNo ,index, event) {
	event.stopPropagation();
	
	$.ajax({
        type: "POST",
        url: "/otipms/mail/updateMessageImportant", // 서버 업데이트를 처리할 URL
        data: { messageNo: messageNo },
        success: function(data) {
            
            var $icon = $(".message-" + index + " .icon-copy.star");
            
            if ($icon.hasClass("ion-ios-star-outline")) {
                $icon.removeClass("ion-ios-star-outline").addClass("ion-ios-star");
                websocket.send(empId);
            } else if ($icon.hasClass("ion-ios-star")) {
                $icon.removeClass("ion-ios-star").addClass("ion-ios-star-outline");
                websocket.send(empId);
            }
        },
        error: function() {
            // 오류 처리
        }
    });
}

function readAll(){
	$.ajax({
        type: "POST",  // 또는 다른 HTTP 메서드
        url: "/otipms/mail/readAll", // 서버 URL로 대체
        success: function () {
        	webSocket.send(empId);
        },
        error: function () {
            alert("서버 오류: 업데이트를 완료할 수 없습니다.");
        }
    });
}

function updateMessageChecked(ccNo) {
	$.ajax({
        type: "POST",  // 또는 다른 HTTP 메서드
        url: "/otipms/mail/updateCheckedDate", // 서버 URL로 대체
        data: { ccNo: ccNo }, // 업데이트에 필요한 데이터를 전달
        success: function (data) {
        	webSocket.send(empId);
        },
        error: function () {
            alert("서버 오류: 업데이트를 완료할 수 없습니다.");
        }
    });
}

function deleteAlarm(empId, event){
	event.preventDefault();
	$.ajax({
        type: "POST",  // 또는 다른 HTTP 메서드
        url: "/otipms/mail/deleteAlarm", // 서버 URL로 대체
        data: { empId: empId }, // 업데이트에 필요한 데이터를 전달
        success: function (data) {
        	console.log("쪽지 알람을 전부 삭제했다.");
        },
        error: function () {
            alert("서버 오류: 알람 삭제를 완료할 수 없습니다.");
        }
    });
}

function deleteChatAlarm(empId, event){
	event.preventDefault();
	$.ajax({
        type: "POST",  // 또는 다른 HTTP 메서드
        url: "/otipms/mail/deleteChatAlarm", // 서버 URL로 대체
        data: { empId: empId }, // 업데이트에 필요한 데이터를 전달
        success: function (data) {
        	console.log("채팅 알람을 전부 삭제했다.");
        },
        error: function () {
            alert("서버 오류: 알람 삭제를 완료할 수 없습니다.");
        }
    });
}