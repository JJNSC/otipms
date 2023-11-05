document.addEventListener("DOMContentLoaded", function () {
	var messageNo = document.getElementById("messageNo").value;
	
	$.ajax({
	    url: 'http://localhost:8080/otipms/api/employeeDataRead?messageNo='+messageNo,
	    type: 'GET',
	    dataType: 'json',
	    success: function (data) {
	        const employeeList = document.getElementById("employee-list");
	        
	        var messageData = data.messageData;
            console.log(messageData);
	        messageData.forEach((message) => {
                const row = document.createElement("tr");
                row.innerHTML = `
                    <td class="text-center">${message.ccType}</td>
                    <td class="text-center">${message.empRank}</td>
                    <td class="text-center">${message.empName}</td>
                    <td class="text-center">${message.messageChecked}</td>
                    <td class="text-center">${message.ccCheckedDate}</td>
                `;
                
                employeeList.appendChild(row);
                
            });
            
            
	    },
	    error: function (error) {
	        console.log(error);
	    }
	});
});

function closeWindow() {
	window.close();
}