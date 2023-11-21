window.onload = function(){
	var chatWebSocket = null;
	var socket = new WebSocket("ws://localhost:8080/otipms/chat/ws-chat");
	chatWebSocket = socket;
	chatWebSocket.onopen = () => {
	}
	
	chatWebSocket.onmessage = (e) => {
		var empId = $('#empId').val();
		var crmrNo = $('#mrNo').val();
		const message = JSON.parse(e.data);
		const mrNo = message.mrNo;
	    const nmempId = message.empId;
	    const messageContent = message.messageContent;
	    const messageDate = message.messageDate;
	    if(nmempId != empId && mrNo == crmrNo){
	    	addChatYourMessage(messageContent, messageDate);
	    }
	    updateLastChat(mrNo, messageContent, messageDate);
	    
	    $.get("/otipms/chat/chatRoom", function(data) {
	        $("#chatRoomContainer").html(data);
	    });
	}  
	
	chatWebSocket.onclose = () => {
	}
	
	//채팅방 목록 보이기
	$.get("/otipms/chat/chatRoom", function(data) {
        $("#chatRoomContainer").html(data);
    });
	
	//채팅방 목록중 하나 클릭 시 그에 맞는 채팅 내용 제공
	$(document).on('click', '.chat-notification-list li a', function(event) {
        event.preventDefault();
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
                alert('발생했습니다.');
            }
        });
    });
	
	//사원 정보를 findEmployee.jsp에서 받아와서 채팅방 생성
	window.receiveSelectedTaskEmployee = function (selectedEmployee) {
		 var selectedEmployeeJSON = JSON.stringify(selectedEmployee);
		 $.ajax({
		        url: '/otipms/api/createChatRoom', 
		        type: 'POST',
		        data: selectedEmployeeJSON, 
		        contentType: 'application/json',
		        success: function (response) {
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
                alert('삭제된 채팅방입니다.');
            }
        });
    });
	
	$("#searchRoom").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $(".chatRooms").each(function() {
        	var currentText = $(this).find(".chatEmp").text().toLowerCase();
        	$(this).toggle(currentText.indexOf(value) > -1);
        });
      });
}

function createChatRoomElement(chatRoomInfo) {
    var chatRoomList = document.getElementById('chatRoomList'); // 채팅방 목록을 표시할 요소 (ul 등)
    var chatRoomItem = document.createElement('li'); // li 요소 생성
    chatRoomItem.id = 'chatRoom' + chatRoomInfo.mrNo;
    chatRoomItem.className = 'chatRooms';
    
    var link = document.createElement('a'); // a 요소 생성
    link.href = '#';
    link.setAttribute('data-mrno', chatRoomInfo.mrNo);
    link.id = 'findRoom';
    link.style = 'padding-left:52px;'
    
    var status = document.createElement('span');
    if (`${chatRoomInfo.empStatus}` == 1){
    	status.className= 'activity logined';
    } else {
    	status.className= 'activity logout';
    }
    
    var image = document.createElement('img'); // 이미지 요소 생성
    image.src = `data:${chatRoomInfo.mediaFile.mediaFileType};base64, ${chatRoomInfo.mediaFileData}`;
    image.alt = '';

    var spanName = document.createElement('span');
    spanName.className = 'chatEmp';
    spanName.style = 'display:inline-block;clear: both;font-size: 16px;color: #202342;font-weight: 700;text-transform: capitalize;font-family: "Inter",sans-serif;padding-bottom: 5px;padding-left:3px;';
    spanName.textContent = chatRoomInfo.empRank + ' ' + chatRoomInfo.empName;

    var spanTime = document.createElement('span');
    spanTime.className = 'chatTime';
    spanTime.style = 'position: absolute;right: 0px;top: 18px;';
    var currentDate = new Date();
    var chatDate = new Date(chatRoomInfo.mrDate);
    if (chatDate.toDateString() === currentDate.toDateString()) {
        spanTime.textContent = chatDate.getHours() + ':' + (chatDate.getMinutes() < 10 ? '0' : '') + chatDate.getMinutes();
    } else {
        spanTime.textContent = (chatDate.getMonth() + 1) + '/' + chatDate.getDate();
    }
    
    var spanMessage = document.createElement('span');
    spanMessage.className = 'chatMessage';
    spanMessage.style = 'white-space: nowrap; display: block; overflow: hidden; text-overflow: ellipsis; max-width: 160px;margin-left: 18px;';
    spanMessage.textContent = chatRoomInfo.mrLastChat;
    
    link.appendChild(status);
    link.appendChild(image);
    link.appendChild(spanName);
    link.appendChild(spanTime);
    link.appendChild(spanMessage);
    
    chatRoomItem.appendChild(link);

    chatRoomList.insertBefore(chatRoomItem, chatRoomList.firstChild); // 채팅방 목록에 추가
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

    var chatBody = document.createElement('div'); // 채팅 본문 생성
    chatBody.classList.add('chat-body', 'clearfix');

    var chatText = document.createElement('p'); // 채팅 메시지 생성
    chatText.innerHTML = message;

    var chatTime = document.createElement('div'); // 채팅 시간 생성
    chatTime.classList.add('chat_time');
    chatTime.innerHTML = messengerDate;

    chatBody.appendChild(chatText);
    chatBody.appendChild(chatTime);

    chatItem.appendChild(chatBody);

    chatList.appendChild(chatItem); // 채팅 메시지 항목을 채팅 목록에 추가
    scrollToBottom();
}


function addChatYourMessage(message, messengerDate) {
    var chatList = document.getElementById('chatList'); // 채팅 메시지를 표시할 요소 (예: ul, div 등)
    var empName = document.getElementById('empName').value;
    var empRank = document.getElementById('empRank').value;
    
    var chatItem = document.createElement('li'); // 채팅 메시지 항목 생성
    chatItem.classList.add('clearfix');

    var chatImage = document.createElement('h6'); // 이미지 요소 생성
    chatImage.style = 'margin-bottom:5px;margin-left:5px;';
    chatImage.innerHTML = empRank + " " + empName;

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

function updateLastChat(mrNo, message, messengerDate){
	var lastChat = document.querySelector('#chatRoom' + mrNo + ' .chatMessage');
    lastChat.innerHTML = message;
    
    var chatTimeSpan = document.querySelector('#chatRoom' + mrNo + ' .chatTime');
    // 날짜 문자열을 JavaScript Date 객체로 변환
    var chatTime = new Date(messengerDate.replace('오후 ', '').replace('오전 ', '').replace(/-/g, '/'));

    // 시간과 분을 가져와서 표시
    var hours = chatTime.getHours();
    var minutes = chatTime.getMinutes();

    // "오후"인 경우에는 12시간을 추가
    if (messengerDate.includes('오후') && hours < 12) {
        hours += 12;
    }

    // 시간과 분이 10 미만일 경우 0을 추가하여 표시
    hours = hours < 10 ? '0' + hours : hours;
    minutes = minutes < 10 ? '0' + minutes : minutes;

    var formattedTime = hours + ':' + minutes;
    chatTimeSpan.innerHTML = formattedTime;
}

function getCurrentDateTime() {
    var currentDateTime = new Date();
    return currentDateTime.toLocaleString(); 
}

function deleteChat(mrNo,event) {
	event.preventDefault();
    // 서비스 호출
    $.ajax({
        type: 'POST', // 또는 'GET'
        url: '/otipms/chat/deleteChat', // 채팅방 삭제 서비스 엔드포인트
        data: { mrNo: mrNo }, // 전달할 데이터
        success: function(response) {
        	window.location.href = '/otipms/chat/chat'; // 리다이렉트할 페이지의 URL로 대체
        	chatWebSocket.send();
        },
        error: function(error) {
            console.error('채팅방 지우기 에러 :', error);
        }
    });
}
