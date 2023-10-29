window.onload = function(){
	var webSocket = new WebSocket("ws://localhost:8080/otipms/ws-alarm");
	
	var dtdd = '<c:out value="${employee.empId}"/>';
	
	webSocket.onopen = () => {
		webSocket.send("${employee.empId}");
		console.log();
		wsSend();
	}
	
	webSocket.onmessage = (e) => {
		var v_alarmIcon = document.querySelector("#alarmIcon");
		v_alarmIcon.style.display = 'inline';
	}
	
	var wsSend=()=>{
		setInterval(function() {
			webSocket.send("${employee.empId}");
		}, 3000);
	}
}