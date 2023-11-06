window.onload = function(){
	var empId = document.getElementById("memIdSpan").value;
	var filteredEmailsCount = document.getElementById("cntSpan").value;
	$.ajax({
	    url: "http://localhost:8080/otipms/mail/importantMails?empId="+empId,
	    dataType: "json",
	    success: function (data) {
	        var messageList = data;
	        console.log(messageList);
	        updateMessageList(messageList)
			updatePaging(messageList)
	    }
	});
	function updateMessageList(messageList) {
		var messageListContainer  = document.getElementById("email-list-container");
		
		if(messageListContainer){
			messageListContainer.innerHTML = ""; // 기존 메일 목록을 초기화합니다.
			
			console.log(messageList);
			messageList.forEach((message, index) => {
				var messageDiv = document.createElement("div");
				messageDiv.className = "message message-" + (index + 1);
				
				var messageDateFormatted = parseMessageDate(message.messageReservedDate);
				console.log("미디어 파일 : " + message.MediaFile);
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
					<img src="data:${message.mediaFileType};base64, ${message.profile}" height="40" width="40" alt="">
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
	function updatePaging(messageList) {
		var itemsPerPage = 10; // 페이지당 보여질 쪽지 수
		var totalPages = Math.ceil(filteredEmailsCount / itemsPerPage);
		console.log("메일 수 : " + filteredEmailsCount)
		console.log("쪽 수 : " + totalPages)
		var pagingContainer = document.getElementById("pagingContainer");
		pagingContainer.innerHTML = ""; // 기존 페이지 버튼 초기화
		var navElement = document.createElement("nav");
		var ulElement = document.createElement("ul");
		ulElement.className = "pagination";
		$.get("http://localhost:8080/otipms/mail/importantMails?empId="+empId, function (data) {
			console.log(messageList);
			for (var i = 1; i <= totalPages; i++) {
				var pageli = document.createElement("li");
				pageli.className = "page-item";
				var pageButton = document.createElement("a");
				pageButton.className = "page-link";
				pageButton.innerText = i;
				pageButton.dataset.page = i; // 페이지 번호를 data 속성으로 저장
				showEmailsForPage(1, 10, messageList);
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
		});
		
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
}