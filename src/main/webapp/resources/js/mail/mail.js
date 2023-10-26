// 드롭다운 항목 클릭 시 호출되는 함수
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
        var emailMessage = document.querySelector(".message.message-" + (index + 1)); // 인덱스는 0부터 시작하므로 +1을 해줍니다.
        if (emailMessage) {
        	var messageNo = emailMessage.getAttribute("data-messageNo"); // 메일의 messageNo 가져오기
            // 서버로 messageNo를 전송하여 메일을 휴지통으로 보냅니다.
            sendToTrash(messageNo, index);
        }
    });
}

function sendToTrash(messageNo, index) {
    // 서버로 메일을 휴지통으로 보내는 요청을 보냅니다.
    $.ajax({
        type: "POST",
        url: "http://localhost:8080/otipms/mail/updateMessageTrash", // 서버로 메일을 휴지통으로 보내는 URL
        data: { messageNo: messageNo },
        success: function (data) {
            if (data === "success") {
                // 서버에서 성공적으로 메일을 휴지통으로 보냈을 경우
                var emailMessage = document.querySelector(".message.message-" + (index + 1));
                if (emailMessage) {
                    emailMessage.remove();
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
        url: "http://localhost:8080/otipms/mail/updateMessageImportant", // 서버 업데이트를 처리할 URL
        data: { messageNo: messageNo },
        success: function(data) {
            
            var $icon = $(".message-" + index + " .icon-copy.star");
            
            if ($icon.hasClass("ion-ios-star-outline")) {
                $icon.removeClass("ion-ios-star-outline").addClass("ion-ios-star");
            } else if ($icon.hasClass("ion-ios-star")) {
                $icon.removeClass("ion-ios-star").addClass("ion-ios-star-outline");
            }
        },
        error: function() {
            // 오류 처리
        }
    });
}

function checkread(index, event) {
    event.stopPropagation();

    var $icon = $(".message-" + index + " .icon-copy.mail");

    if ($icon.hasClass("ion-android-mail")) {
        $icon.removeClass("ion-android-mail").addClass("ion-android-drafts");
    } else if ($icon.hasClass("ion-android-drafts")) {
        $icon.removeClass("ion-android-drafts").addClass("ion-android-mail");
    }
}