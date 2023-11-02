document.addEventListener("DOMContentLoaded", function () {
	function checksave() {
        window.history.back();
    }

    // 객체로 선택한 사원 정보를 관리
    var selectedEmployees = {
    	    'Recipient': [],
    	    'Reference': [],
    	    'BlindCopy': []
    	};
    
    window.receiveSelectedEmployees = function (selectedEmployee, recipientType) {
    	var recipientTypeToNumber = {
    		        'Recipient': 1,
    		        'Reference': 3,
    		        'BlindCopy': 4
    		    };
    	var ccType = recipientTypeToNumber[recipientType];
    	

    	selectedEmployees[recipientType].push(selectedEmployee);
        updateSelectedEmployeesUI(selectedEmployee, recipientType);
    };

    function updateSelectedEmployeesUI(selectedEmployee, recipientType) {
    	const selectedTextbox = document.querySelector(`#selected${recipientType}Textbox`);
        const selectedEmployeesContainer = document.querySelector(`#selected${recipientType}Employees`);
        
        if (selectedTextbox && selectedEmployeesContainer) {
            // 선택된 사원 정보를 텍스트 상자에 채우기
        	var selectedEmployeeNames = [];
            for (var employee of selectedEmployee) {
                selectedEmployeeNames.push(`${employee.position} ${employee.name}`);
            }
            selectedTextbox.value = selectedEmployeeNames.join(', ');
            
            console.log(selectedTextbox.value);
            // 선택된 사원들을 화면에 추가
            selectedEmployee.forEach(employee => {
                const div = document.createElement("div");
                div.classList.add("selected-employee");
                div.innerHTML = `${employee.position} ${employee.name} <span class="d-none">${employee.employeeId}</span><button class="remove-employee">x</button>`;
                selectedEmployeesContainer.appendChild(div);
            });
            
            // 이벤트 리스너를 추가하여 "x" 버튼 클릭 시 선택된 사원을 제거
            const removeButtons = selectedEmployeesContainer.querySelectorAll('.remove-employee');
            removeButtons.forEach((button, index) => {
                button.addEventListener('click', function () {
                    selectedEmployee.splice(index, 1);
                    updateSelectedEmployeesUI(selectedEmployee, recipientType);
                });
            });
        }
    }

    function waitForElementToDisplay(selector, callback) {
        if (document.querySelector(selector) !== null) {
            callback();
        } else {
            setTimeout(function () {
                waitForElementToDisplay(selector, callback);
            }, 200);
        }
    }

    waitForElementToDisplay("#selectedRecipientTextbox", function () {
        // Callback 내에서 updateSelectedEmployeesUI 함수가 정의되도록 변경
    });
    
});


//선택한 직원 목록을 가져오는 함수
function getSelectedEmployees(employeeId, ccType) {
	var employees = [];
	$("#" + employeeId + " .selected-employee").each(function () {
		var id = $(this).find("span.d-none").text();
		var empId = parseInt(id, 10); // 정수로 변환
		if (!isNaN(empId)) {
			employees.push({
				employeeId: id,
				ccType: ccType
			});
		}
	});
	return employees;
}

function sendMail() {
	// 사용자가 입력한 제목과 내용을 가져옴
		
	var title = $("#mailTitleInput").val();
	var content = CKEDITOR.instances.myEditor.getData(); // CKEditor 내용을 가져옴
	
	var ccTypeToNumber = {
			'Recipient': 1,
			'Reference': 3,
			'BlindCopy': 4
	};
	
	// 사용자가 선택한 수신자, 참조자, 비밀 참조자 리스트를 구성
	var recipients = getSelectedEmployees("selectedRecipientEmployees", ccTypeToNumber["Recipient"]);
	var references = getSelectedEmployees("selectedReferenceEmployees", ccTypeToNumber["Reference"]);
	var blindCopies = getSelectedEmployees("selectedBlindCopyEmployees", ccTypeToNumber["BlindCopy"]);
	
	if (recipients.length === 0) {
        alert("수신자를 선택해주세요.");
        return;
    }
	
	var modifiedUploadedFiles = [];
    for (var i = 0; i < uploadedFiles.length; i++) {
        var file = uploadedFiles[i];
        var base64Data = file.data;
        var indexOfComma = base64Data.indexOf(',');
        if (indexOfComma !== -1) {
            var dataWithoutPrefix = base64Data.substr(indexOfComma + 1); // `,` 이후의 데이터 추출
            modifiedUploadedFiles.push({
                name: file.name,
                type: file.type,
                data: dataWithoutPrefix
            });
        }
    }
    var webSocket = new WebSocket("ws://localhost:8080/otipms/ws-alarm");
    var empId = document.getElementById("memIdSpan").value;
	// AJAX를 사용하여 서버로 데이터 전송
	$.ajax({
		url: 'http://localhost:8080/otipms/mail/sendMail',
		type: 'POST',
		data: JSON.stringify({
			title: title,
			content: content,
			recipients: recipients,
			references: references,
			blindCopies: blindCopies,
			uploadedFiles: modifiedUploadedFiles
		}),
		contentType: 'application/json',
		success: function (data) {
			// 성공 시, 메시지 ID를 받아옴
            var messageId = data.messageId;
            // 파일 업로드를 수행하고 메시지와 연결
            webSocket.send(empId);
			window.history.back();
		},
		error: function (error) {
			console.log("오류 발생: " + error.responseText);
			alert("파일 업로드 중 오류가 발생했습니다.");
		}
	});
}

