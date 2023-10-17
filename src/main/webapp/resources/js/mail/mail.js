
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
		// 모든 이메일 체크박스를 선택 또는 해제합니다.
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
    
    //선택된 메일 삭제하기(jsp 상에서만 삭제되게 해놨음)
    // -중요- : 나중에 꼭 백엔드 작성 할 때, 삭제 시 상태를 휴지통으로 보내고 html은 지워주기!!
    selectedMessageIndices.forEach(function (index) {
        var emailMessage = document.querySelector(".message.message-" + (index + 1)); // 인덱스는 0부터 시작하므로 +1을 해줍니다.
        if (emailMessage) {
            emailMessage.remove(); // 선택된 메일을 삭제
        }
    });
}

function refreshReceivedEmailList() {
    // 새로고침할 HTML 페이지의 URL로 변경
    var url = "reloadReceivedMail";

    // email-list-container div를 선택.
    var emailListContainer = document.getElementById("email-list-container");

    // fetch를 사용하여 해당 URL에서 데이터 가져오기.
    fetch(url)
        .then(function (response) {
            return response.text();
        })
        .then(function (html) {
            // 새로운 HTML로 email-list-container를 업데이트.
            emailListContainer.innerHTML = html;
        })
        .catch(function (error) {
            console.error("새로고침 중 오류 발생: " + error);
        });
}

function refreshSentEmailList() {
    // 새로고침할 HTML 페이지의 URL로 변경
    var url = "reloadSentMail";

    // email-list-container div를 선택.
    var emailListContainer = document.getElementById("email-list-container");

    // fetch를 사용하여 해당 URL에서 데이터 가져오기.
    fetch(url)
        .then(function (response) {
            return response.text();
        })
        .then(function (html) {
            // 새로운 HTML로 email-list-container를 업데이트.
            emailListContainer.innerHTML = html;
        })
        .catch(function (error) {
            console.error("새로고침 중 오류 발생: " + error);
        });
}


function refreshImportantEmailList() {
    // 새로고침할 HTML 페이지의 URL로 변경
    var url = "reloadImportantMail";

    // email-list-container div를 선택.
    var emailListContainer = document.getElementById("email-list-container");

    // fetch를 사용하여 해당 URL에서 데이터 가져오기.
    fetch(url)
        .then(function (response) {
            return response.text();
        })
        .then(function (html) {
            // 새로운 HTML로 email-list-container를 업데이트.
            emailListContainer.innerHTML = html;
        })
        .catch(function (error) {
            console.error("새로고침 중 오류 발생: " + error);
        });
}

function refreshTemporaryEmailList() {
    // 새로고침할 HTML 페이지의 URL로 변경
    var url = "reloadTemporaryMail";

    // email-list-container div를 선택.
    var emailListContainer = document.getElementById("email-list-container");

    // fetch를 사용하여 해당 URL에서 데이터 가져오기.
    fetch(url)
        .then(function (response) {
            return response.text();
        })
        .then(function (html) {
            // 새로운 HTML로 email-list-container를 업데이트.
            emailListContainer.innerHTML = html;
        })
        .catch(function (error) {
            console.error("새로고침 중 오류 발생: " + error);
        });
}

function refreshTrashEmailList() {
    // 새로고침할 HTML 페이지의 URL로 변경
    var url = "reloadTrashMail";

    // email-list-container div를 선택.
    var emailListContainer = document.getElementById("email-list-container");

    // fetch를 사용하여 해당 URL에서 데이터 가져오기.
    fetch(url)
        .then(function (response) {
            return response.text();
        })
        .then(function (html) {
            // 새로운 HTML로 email-list-container를 업데이트.
            emailListContainer.innerHTML = html;
        })
        .catch(function (error) {
            console.error("새로고침 중 오류 발생: " + error);
        });
}
// 이 버튼을 클릭하면 email-list-container 부분을 새로고침함.
document.querySelector(".refresh-button").addEventListener("click", refreshEmailList);

function checkimportant(index, event) {
    event.stopPropagation();
    
    var $icon = $(".message-" + index + " .icon-copy.star");
    
    if ($icon.hasClass("ion-ios-star-outline")) {
        $icon.removeClass("ion-ios-star-outline").addClass("ion-ios-star");
    } else if ($icon.hasClass("ion-ios-star")) {
        $icon.removeClass("ion-ios-star").addClass("ion-ios-star-outline");
    }
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