window.onload = function(){
	var webSocket = new WebSocket("ws://localhost:8080/otipms/ws-alarm");
	var empId = document.getElementById("memIdSpan").value;
	var v_alarmIcon = document.querySelector("#alarmIcon");
	v_alarmIcon.style.display = 'none';
	var previousAlarmCount = 0;
	
	webSocket.onopen = () => {
		console.log("소켓 오픈");
		
		webSocket.send(empId);
		updateAlarmCount();
		updateTotalAlarmCount();
		$.get("http://localhost:8080/otipms/alarms?empId=" + empId, function (alarmData) {
	        updateAlarmList(alarmData);
		});
		
		wsSend();
	}
	
	webSocket.onmessage = (e) => {
		var alarmData = JSON.parse(e.data);
		const alarmCount = alarmData.count;
	    const alarms = alarmData.alarms;
	    
	    if (alarmCount !== previousAlarmCount) {
	        previousAlarmCount = alarmCount; // 이전 알림 개수 업데이트
	        updateAlarmCount();
	        updateTotalAlarmCount();
	        $.get("http://localhost:8080/otipms/alarms?empId=" + empId, function (alarmData) {
	            updateAlarmList(alarmData);
	        });
	        showAlarmIcon(v_alarmIcon);
	    }
	    
	}
	
	var wsSend=()=>{
		setInterval(function() {
			webSocket.send(empId);
		}, 3000);
	}
	
	
	
	//안읽은 알람 수
	var updateAlarmCount = function () {
	    // 알림 개수를 업데이트
	    $.get("http://localhost:8080/otipms/alarmCnt?empId=" + empId, function (data) {
	      var alarmCount = data;
	      $("#alarmCnt").text(alarmCount);
	    });
	  };
	
	//쪽지 알람의 내용
	var updateAlarmList = (alarmData) => {
	    var alarmList = document.getElementById("alarmList");
	    
	    
	    alarmList.innerHTML = ""; 

	    // 알림 목록 업데이트
	    alarmData.forEach((alarm) => {
	      var alarmItem = document.createElement("li");
	      if (alarm.alarmChk === 1) {
	        alarmItem.className = "pl-2 bg-secondary";
	      } else {
	        alarmItem.className = "pl-2";
	      }
	      console.log(alarm.alarmDate);
	      var alarmDateFormatted = formatAlarmDate(alarm.alarmDate);
	      console.log(alarmDateFormatted);
	      
	      var alarmContent = `
	        <a href="javascript:void(window.open('mail/detailMail?messageNo=${alarm.messageNo}','_blank','width=920, height=680, left=800, top=30'))" onclick="updateCheckedAlarm(${alarm.alarmNo})">
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
	
	
	
}


function updateCheckedAlarm(alarmNo) {
	$.ajax({
        type: "POST", 
        url: "http://localhost:8080/otipms/updateCheckedAlarm", 
        data: { alarmNo: alarmNo },
        success: function (data) {
           
        },
        error: function () {
            alert("서버 오류: 업데이트를 완료할 수 없습니다.");
        }
    });
}

//알람 보여주는 함수
function showAlarmIcon(v_alarmIcon) {
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

function formatAlarmDate(alarmDate) {
    const options = { year: '2-digit', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', second: '2-digit', hour12: true };
    var formattedDate = new Date(alarmDate).toLocaleString('en-US', options);
    return formattedDate;
}

function parseTO_DATE(toDateStr) {
    const parts = toDateStr.match(/(\d+)/g);
    if (parts.length !== 6) {
        return null; // 유효하지 않은 형식의 문자열
    }

    const year = parseInt(parts[0]);
    const month = parseInt(parts[1]) - 1; // 월은 0부터 시작하므로 1을 뺍니다
    const day = parseInt(parts[2]);
    const hours = parseInt(parts[3]);
    const minutes = parseInt(parts[4]);
    const seconds = parseInt(parts[5]);

    return new Date(year, month, day, hours, minutes, seconds);
}