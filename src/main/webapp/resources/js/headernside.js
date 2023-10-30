window.onload = function(){
	var webSocket = new WebSocket("ws://localhost:8080/otipms/ws-alarm");
	
	webSocket.onopen = () => {
		console.log("소켓 오픈");
		/*wsSend();*/
	}
	
	webSocket.onmessage = (e) => {
		var v_alarmIcon = document.querySelector("#alarmIcon");
		v_alarmIcon.style.display = 'inline';
	}
	
	/*var wsSend=()=>{
		setInterval(function() {
			webSocket.send("${employee.empId}");
		}, 3000);
	}*/
}


function updateCheckedAlarm(alarmNo) {
    console.log("alarmNo: ", alarmNo);
	$.ajax({
        type: "POST",  // 또는 다른 HTTP 메서드
        url: "http://localhost:8080/otipms/updateCheckedAlarm", // 서버 URL로 대체
        data: { alarmNo: alarmNo }, // 업데이트에 필요한 데이터를 전달
        success: function (data) {
           
        },
        error: function () {
            alert("서버 오류: 업데이트를 완료할 수 없습니다.");
        }
    });
}