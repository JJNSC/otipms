window.onload = function(){
	var chatWebSocket = null;
	var socket = new WebSocket("ws://192.168.0.169:8080/otipms/chat/ws-chat");
	chatWebSocket = socket;
	chatWebSocket.onopen = () => {
		console.log("소켓 연결");
	}
	
	chatWebSocket.onmessage = (e) => {
		var empId = $('#empId').val();
		var crmrNo = $('#mrNo').val();
		const message = JSON.parse(e.data);
		console.log("나 파싱 받앗숴~ : " + message);
		const mrNo = message.mrNo;
	    const nmempId = message.empId;
	    const messageContent = message.messageContent;
	    const messageDate = message.messageDate;
	    
	    console.log("messageContent : " + messageContent);
	    console.log("messageDate : " + messageDate);
	    
	    console.log("empId : " + empId);
	    console.log("nmempId : " + nmempId);
	    if(nmempId != empId && mrNo == crmrNo){
	    	addChatYourMessage(messageContent, messageDate);
	    }
	    		
	} 
	
	chatWebSocket.onclose = () => {
		console.log("소켓 종료");
	}
	
	//채팅방 목록 보이기
	$.get("/otipms/chat/chatRoom", function(data) {
        $("#chatRoomContainer").html(data);
    });
	
	//채팅방 목록중 하나 클릭 시 그에 맞는 채팅 내용 제공
	$(document).on('click', '.chat-notification-list li a', function(event) {
        event.preventDefault();
        console.log('Notification clicked');
		var mrNo = $(this).data('mrno'); 

        $.ajax({
            type: 'GET',
            url: '/otipms/chat/chatContent',
            data: { mrNo: mrNo },
            success: function(response) {
                $('.chat-detail').html(response);
                scrollToBottom();
            },
            error: function() {
                alert('에러가 발생했습니다.');
            }
        });
    });
	
	//사원 정보를 findEmployee.jsp에서 받아와서 채팅방 생성
	window.receiveSelectedTaskEmployee = function (selectedEmployee) {
		 var selectedEmployeeJSON = JSON.stringify(selectedEmployee);
		 console.log("selectedEmployeeJSON : " + selectedEmployeeJSON);
		 $.ajax({
		        url: '/otipms/api/createChatRoom', 
		        type: 'POST',
		        data: selectedEmployeeJSON, 
		        contentType: 'application/json',
		        success: function (response) {
		        	console.log("성공적으로 채팅이 만들어졌습니다.");
		        	createChatRoomElement(response);
		            
		        },
		        error: function (error) {
		            console.log(error);
		        }
		    });
	}
	
	//채팅 보내기를 엔터키로도 가능하게
	$(document).on('keydown', '#chatInput', function(event){
		if(event.key === 'Enter'){
			event.preventDefault();
			$('#sendMessageButton').click();
		}
	});
	
	//채팅 내용을 저장하게 함
	$(document).on('click', '#sendMessageButton', function (event) {
		event.preventDefault();
        var chatInput = $('#chatInput').val(); // 입력된 채팅 내용 가져오기
        var mrNo = $('#mrNo').val();
        var empId = $('#empId').val();
        var currentDatetime = getCurrentDateTime();
      
        var message = {
                mrNo: mrNo,
                empId: empId,
                messageContent: chatInput,
                messageDate: currentDatetime
            };
        
        // 서버로 데이터 전송
        $.ajax({
            type: 'POST',
            url: '/otipms/chat/sendMessage',
            data: {
                mrNo: mrNo,
                empId: empId,
                message: chatInput
            },
            success: function (response) {
            	$('#chatInput').val('');
            	addChatMessage(chatInput, currentDatetime);
            	chatWebSocket.send(JSON.stringify(message));
            },
            error: function () {
                alert('에러가 발생했습니다.');
            }
        });
    });
	
}

function createChatRoomElement(chatRoomInfo) {
    var chatRoomList = document.getElementById('chatRoomList'); // 채팅방 목록을 표시할 요소 (ul 등)
    var chatRoomItem = document.createElement('li'); // li 요소 생성

    var link = document.createElement('a'); // a 요소 생성
    link.href = '#';
    link.setAttribute('data-mrno', chatRoomInfo.mrNo);

    var image = document.createElement('img'); // 이미지 요소 생성
    image.src = '/otipms/resources/images/user/1.jpg';
    image.alt = '';

    var heading = document.createElement('h3'); // h3 요소 생성
    heading.className = 'clearfix';
    heading.textContent = chatRoomInfo.empRank + ' ' + chatRoomInfo.empName;

    link.appendChild(image);
    link.appendChild(heading);
    chatRoomItem.appendChild(link);

    chatRoomList.appendChild(chatRoomItem); // 채팅방 목록에 추가
}

function scrollToBottom() {
    var chatList = document.getElementById('chatBox');
    chatList.scrollTop = chatList.scrollHeight;
}

function addChatMessage(message, messengerDate) {
    var chatList = document.getElementById('chatList'); // 채팅 메시지를 표시할 요소 (예: ul, div 등)

    var chatItem = document.createElement('li'); // 채팅 메시지 항목 생성
    chatItem.classList.add('clearfix');

    chatItem.classList.add('admin_chat');

    var chatImage = document.createElement('span'); // 이미지 요소 생성
    chatImage.classList.add('chat-img');
    chatImage.innerHTML = '<img src="/otipms/resources/images/defaultHuman.jpg" alt="" />';

    var chatBody = document.createElement('div'); // 채팅 본문 생성
    chatBody.classList.add('chat-body', 'clearfix');

    var chatText = document.createElement('p'); // 채팅 메시지 생성
    chatText.innerHTML = message;

    var chatTime = document.createElement('div'); // 채팅 시간 생성
    chatTime.classList.add('chat_time');
    chatTime.innerHTML = messengerDate;

    chatBody.appendChild(chatText);
    chatBody.appendChild(chatTime);

    chatItem.appendChild(chatImage);
    chatItem.appendChild(chatBody);

    chatList.appendChild(chatItem); // 채팅 메시지 항목을 채팅 목록에 추가
    scrollToBottom();
}


function addChatYourMessage(message, messengerDate) {
    var chatList = document.getElementById('chatList'); // 채팅 메시지를 표시할 요소 (예: ul, div 등)

    var chatItem = document.createElement('li'); // 채팅 메시지 항목 생성
    chatItem.classList.add('clearfix');

    var chatImage = document.createElement('span'); // 이미지 요소 생성
    chatImage.classList.add('chat-img');
    chatImage.innerHTML = '<img src="/otipms/resources/images/defaultHuman.jpg" alt="" />';

    var chatBody = document.createElement('div'); // 채팅 본문 생성
    chatBody.classList.add('chat-body', 'clearfix');

    var chatText = document.createElement('p'); // 채팅 메시지 생성
    chatText.innerHTML = message;

    var chatTime = document.createElement('div'); // 채팅 시간 생성
    chatTime.classList.add('chat_time');
    chatTime.innerHTML = messengerDate;

    chatBody.appendChild(chatText);
    chatBody.appendChild(chatTime);

    chatItem.appendChild(chatImage);
    chatItem.appendChild(chatBody);

    chatList.appendChild(chatItem); // 채팅 메시지 항목을 채팅 목록에 추가
    scrollToBottom();
}

function getCurrentDateTime() {
    var currentDateTime = new Date();
    return currentDateTime.toLocaleString(); 
}