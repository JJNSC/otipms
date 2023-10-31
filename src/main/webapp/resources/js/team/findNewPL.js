document.addEventListener("DOMContentLoaded", function () {
	var teamNoElement  = document.getElementById("thisTeamNo");
	
	var teamNo = teamNoElement.textContent;
	
	$.ajax({
	    url: 'http://localhost:8080/otipms/api/projectPeData?teamNo=' + teamNo, // URL ??
	    type: 'GET',
	    dataType: 'json',
	    success: function (data) {
	        const employeeList = document.getElementById("employee-list");
	        var employeeData = data.employeeData;
            //dropdown 선택 시 자동 필터링
            function populateEmployeeList() {
                employeeList.innerHTML = "";
                const filteredEmployees = employeeData.filter((employee) => {
                        return true;
                });
                filteredEmployees.forEach((employee,index) => {
                    const row = document.createElement("tr");
                    row.innerHTML = `
                       <td class="text-center"><input type="radio" name="employeeRadio" value="${index}"></td>
                    	<td class="text-center">${employee.empId}</td>
                    	<td class="text-left">${employee.empName}</td>
                    	<td class="text-center">${employee.empRank}</td>
                        <td class="text-center">${employee.role}</td>
                    `;
                    
                    const checkbox = row.querySelector("input[type='radio'][name='employeeRadio']");
                    employeeList.appendChild(row);
                });
            }
            populateEmployeeList();
	    },
	    error: function (error) {
	        console.log(error);
	    }
	});
});

function sendSelectedPL() {
	// 선택한 사원 정보를 저장할 배열
    var selectedEmployees = []; 

    // 선택한 사원 정보를 수집
    var radio = document.querySelector("#employee-list input[type='radio']:checked");
    var row = radio.parentElement.parentElement;
    var position = row.cells[3].textContent;
    var name = row.cells[2].textContent;
    var empId = row.cells[1].textContent;
    selectedEmployees.push({ position, name, empId });

    // 선택한 라디오 버튼의 값을 가져오기
    /*var recipientTypeInput = document.querySelector("input[name='recipient']:checked");
    var recipientType = recipientTypeInput ? recipientTypeInput.value : "Recipient";*/
    // 쪽지 쓰기에 선택한 사원 정보 전달
    var opener = window.opener;
    if (opener) {
        opener.receiveSelectedPL(selectedEmployees);
        window.close(); 
    }
}

function closeWindow() {
	window.close();
}