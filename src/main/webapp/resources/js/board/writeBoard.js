$(init);

function init() {
	//$("#submitBtn").click(submitBoard);
	$("#submitBoardForm").submit(submitBoardTest);
}

uploadedFiles = [];

function submitBoard() {
	console.log($("#boardTitle").val());
	console.log($("#myEditor").val());
	console.log(CKEDITOR.instances.myEditor.getData());
}

function addDropzoneFunction(file) {
	// 파일이 추가될 때 업로드 대기열을 처리
    console.log("파일이 추가되었습니다.", file);
    console.log(file.name);
    console.log(file.type);
    
    const reader = new FileReader();
    reader.onload = function () {
        // 파일 데이터 (base64 내용)이 여기에서 사용 가능합니다.
        const base64Data = reader.result;
        console.log("파일 데이터 (Base64):", base64Data);
        // 필요한 경우 추가 처리를 수행하거나 데이터를 저장할 수 있습니다.
        
        const fileInfo = {
                name: file.name,
                type: file.type,
                data: base64Data,
            };
       uploadedFiles.push(fileInfo);
    };
    
    // 파일을 base64 문자열로 읽기
    reader.readAsDataURL(file);
    //dropzone.processQueue();
}

function submitBoardTest(event) {
	console.log($("#boardTitle").val());
	
	if(uploadedFiles.length == 0) {
		
	} else {
		event.preventDefault();
		
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
		
		console.log(modifiedUploadedFiles);
		
		$.ajax({
		      url: '/otipms/insertBoardFileData',
		      type: 'POST',
		      data: JSON.stringify({
		         uploadedFiles: modifiedUploadedFiles
		      }),
		      contentType: 'application/json',
		      success: function (data) {
		         console.log("data" + data.messageId);
		         uploadedFiles = [];
		         $("#submitBoardForm").submit();
		      },
		      error: function (error) {
		         console.log("오류 발생: " + error.responseText);
		         alert("파일 업로드 중 오류가 발생했습니다.");
		      }
		   });
	}
	
}

