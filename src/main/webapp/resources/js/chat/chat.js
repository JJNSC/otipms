var mailWebSocket = new WebSocket("ws://localhost:8080/otipms/ws-alarm");
var chatWebSocket = new WebSocket("ws://localhost:8080/otipms/ws-chat");
window.onload = function(){
	
	chatWebSocket.onopen = () => {
	}
	
	chatWebSocket.onmessage = (e) => {
		
	}
	
	chatWebSocket.onclose = () => {
		
	}
	
	$.get("http://localhost:8080/otipms/chat/chatRoom", function(data) {
        $("#chatRoomContainer").html(data);
    });
	
	$(document).on('click', '.chat-notification-list li a', function(event) {
        event.preventDefault();
        console.log('Notification clicked');
		var mrNo = $(this).data('mrno'); // 예를 들어, 데이터 속성을 통해 mrNo 가져오기

        $.ajax({
            type: 'GET', // GET 또는 POST 요청 사용
            url: 'http://localhost:8080/otipms/chat/chatContent', // 실제 서버 엔드포인트 경로로 변경
            data: { mrNo: mrNo },
            success: function(response) {
                $('.chat-detail').html(response);
            },
            error: function() {
                alert('에러가 발생했습니다.');
            }
        });
    });
	
	window.receiveSelectedTaskEmployee = function (selectedEmployee) {
		 var selectedEmployeeJSON = JSON.stringify(selectedEmployee);
		 console.log("selectedEmployeeJSON : " + selectedEmployeeJSON);
		 $.ajax({
		        url: 'http://localhost:8080/otipms/api/createChatRoom', // 컨트롤러 엔드포인트 경로로 수정
		        type: 'POST', // POST 요청을 사용
		        data: selectedEmployeeJSON, // JSON 데이터를 전송
		        contentType: 'application/json', // 요청 데이터 타입을 JSON으로 설정
		        success: function (response) {
		            console.log("성공적으로 채팅이 만들어졌습니다.");
		            chatWebSocket.send();
		        },
		        error: function (error) {
		            // 에러 발생 시 처리
		            console.log(error);
		        }
		    });
	}
	
	$(document).on('keydown', '#chatInput', function(event){
		if(event.key === 'Enter'){
			event.preventDefault();
			$('#sendMessageButton').click();
		}
	});
	
	$(document).on('click', '#sendMessageButton', function (event) {
		event.preventDefault();
        var chatInput = $('#chatInput').val(); // 입력된 채팅 내용 가져오기
        var mrNo = $('#mrNo').val();
        var empId = $('#empId').val();
        
        // 서버로 데이터 전송
        $.ajax({
            type: 'POST',
            url: 'http://localhost:8080/otipms/chat/sendMessage',
            data: {
                mrNo: mrNo,
                empId: empId,
                message: chatInput
            },
            success: function (response) {
            	$('#chatInput').val('');
            	console.log("채팅 성공");
            },
            error: function () {
                alert('에러가 발생했습니다.');
            }
        });
    });
}