newPasswordInvalOk = false;
newPasswordCheckInvalOk = false;

//비밀번호 수정 폼 제출
function submitUpdatePasswordForm() {
	var password = $("#currentPasswordCheck").val();
	var newPassword = $("#newPassword").val();
	
	console.log("사용자가 입력한 비밀번호: " + $("#currentPasswordCheck").val());
	console.log("새 비밀번호: " + $("#newPassword").val());
	console.log("새 비밀번호 확인: " + $("#newPasswordCheck").val());

	if(newPasswordInvalOk && newPasswordCheckInvalOk) {
		$.ajax({
			url: "/otipms/updatePassword",
			method: "post",
			data: {
				password:password,
				newPassword:newPassword
			},
			success: function(data) {
				console.log("비밀번호 확인 결과: " + data);
				if(data == "success") {
					alert("비밀번호가 변경되었습니다.");
					location.href = "profile";
				} else {
					alert("현재 비밀번호를 다시 확인해주세요.");
				}
				/*$('#modifyInfo').modal('show');*/
			},
			error: function(error) {
				console.log(error);
			}
		});
		
	}
	event.preventDefault(); // 폼 제출을 막음
}

//새 비밀번호 입력
function writeNewPassword(text) {
	// 입력된 글자수 길이 확인
    var inputLength = $(text).val().length; 

    // 작성된 전체 데이터 확인
    var totalText = $(text).val();

    // 현재 입력된 데이터 확인 
    var nowText = totalText.substring(inputLength-1, inputLength);
    
    console.log("");
    console.log("[writeNewPassword] : [inputLength] : " + inputLength);
    console.log("[writeNewPassword] : [totalText] : " + totalText);
    console.log("[writeNewPassword] : [nowText] : " + nowText);
    
    //======유효성
       
    var num = totalText.search(/[0-9]/g);
    var eng = totalText.search(/[a-z][A-Z]/ig);

    if (inputLength == 0) {
    	
    	$("#newPasswordInval").html("");
    	$("#newPasswordInval").addClass("d-none");
    	newPasswordInvalOk = false;
    	
    } else if(inputLength < 7 || inputLength > 20){
    	
    	$("#newPasswordInval").removeClass("d-none");
    	$("#newPasswordInval").html("7자리 ~ 20자리 이내로 입력해주세요.");
    	newPasswordInvalOk = false;
     
    } else if(totalText.search(/\s/) != -1) {
    	
    	$("#newPasswordInval").removeClass("d-none");
    	$("#newPasswordInval").html("비밀번호는 공백 없이 입력해주세요.");
    	newPasswordInvalOk = false;
     
    } else if(num < 0 || eng < 0) {
    
    	$("#newPasswordInval").removeClass("d-none");
    	$("#newPasswordInval").html("영문,숫자를 혼합하여 입력해주세요.");
    	newPasswordInvalOk = false;
    
    } else {
    	
    	console.log("통과");
    	$("#newPasswordInval").html("");
    	$("#newPasswordInval").addClass("d-none");
    	newPasswordInvalOk = true;
    	
    }
    
    writeNewPasswordCheck();
}

//새 비밀번호 체크 입력
function writeNewPasswordCheck() {
	/*
	// 입력된 글자수 길이 확인
    var inputLength = $(text).val().length; 

    // 작성된 전체 데이터 확인
    var totalText = $(text).val();

    // 현재 입력된 데이터 확인 
    var nowText = totalText.substring(inputLength-1, inputLength);
    
    console.log("");
    console.log("[writeNewPasswordCheck] : [inputLength] : " + inputLength);
    console.log("[writeNewPasswordCheck] : [totalText] : " + totalText);
    console.log("[writeNewPasswordCheck] : [nowText] : " + nowText);
    */
    //======유효성
	var inputLength = $("#newPasswordCheck").val().length; 
	var totalText = $("#newPasswordCheck").val();
    
    if (inputLength == 0) {
    	
    	$("#newPasswordCheckInval").html("");
    	$("#newPasswordCheckInval").addClass("d-none");
    	newPasswordCheckInvalOk = false;
    	
    } else if(totalText != $("#newPassword").val()){
    	
    	$("#newPasswordCheckInval").removeClass("d-none");
    	$("#newPasswordCheckInval").html("비밀번호가 일치하지 않습니다.");
    	newPasswordCheckInvalOk = false;
     
    } else {
    	
    	console.log("통과");
    	$("#newPasswordCheckInval").html("");
    	$("#newPasswordCheckInval").addClass("d-none");
    	newPasswordCheckInvalOk = true;
    	
    }
    
    if(newPasswordInvalOk && newPasswordCheckInvalOk) {
    	$("#submitInput").attr("disabled", false);
	} else {
		$("#submitInput").attr("disabled", true);
	}
}