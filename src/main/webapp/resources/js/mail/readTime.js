document.addEventListener("DOMContentLoaded", function () {
	var messageNo = document.getElementById("messageNo").value;
	var empId = document.getElementById("empId").value;
	var msempId = document.getElementById("msempId").value;
	
	console.log(empId);
	console.log(msempId);
	
	if(empId == msempId){
		$.ajax({
			url: 'http://localhost:8080/otipms/api/employeeDataRead?messageNo='+messageNo,
			type: 'GET',
			dataType: 'json',
			success: function (data) {
				const employeeList = document.getElementById("employee-list");
				
				var messageData = data.messageData;
				console.log(messageData);
				messageData.forEach((message, index) => {
					const row = document.createElement("tr");
					row.innerHTML = `
						<td class="text-center">${message.ccType}</td>
						<td class="text-center">${message.empRank}</td>
						<td class="text-center">${message.empName}</td>
						<td class="text-center">${message.ccCheckedDate}</td>
						`;
					if (message.messageChecked === "읽지 않음") {
				        const cancelButton = document.createElement("button");
				        cancelButton.textContent = "발송 취소";
				        cancelButton.addEventListener("click", function () {
				        	$.ajax({
				                url: 'http://localhost:8080/otipms/mail/deleteCC',
				                type : 'POST',
				                data : {
				                	messageNo : messageNo,
				        			empId : message.empId
				                },
				                success : function (data){
				                	row.remove();
				                },
				                error : function (error){
				                	console.log("쪽지 삭제에 실패");
				                }
				        	});
				        });

				        const cancelButtonCell = document.createElement("td");
				        cancelButtonCell.classList.add("text-center");
				        cancelButtonCell.appendChild(cancelButton);
				        row.appendChild(cancelButtonCell);
				    } else {
				        const emptyCell = document.createElement("td");
				        emptyCell.classList.add("text-center");
				        row.appendChild(emptyCell);
				    }
					
					employeeList.appendChild(row);
					
				});
				
				
			},
			error: function (error) {
				console.log(error);
			}
		});
	} else {
		$.ajax({
			url: 'http://localhost:8080/otipms/api/employeeDataRead?messageNo='+messageNo,
			type: 'GET',
			dataType: 'json',
			success: function (data) {
				const employeeList = document.getElementById("employee-list");
				
				var messageData = data.messageData;
				console.log(messageData);
				messageData.forEach((message) => {
					if(message.ccType != 4){
						const row = document.createElement("tr");
						row.innerHTML = `
							<td class="text-center"></td>
							<td class="text-center">${message.ccType}</td>
							<td class="text-center"></td>
							<td class="text-center">${message.empRank}</td>
							<td class="text-center">${message.empName}</td>
							`;
						
						employeeList.appendChild(row);
					}
				});
			},
			error: function (error) {
				console.log(error);
			}
		});
	}
});

function closeWindow() {
	window.close();
}