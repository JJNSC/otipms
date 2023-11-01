document.addEventListener("DOMContentLoaded", function () {
	var projectNoElement  = document.getElementById("thisProjectNo");
	var projectNameElement  = document.getElementById("thisProjectName");
	var teamNoElement  = document.getElementById("thisTeamNo");
	var teamNameElement  = document.getElementById("thisTeamName");
	
	 if (projectNoElement && teamNoElement) {
        var projectNo = projectNoElement.textContent;
        var projectName = projectNameElement.textContent;
        var teamNo = teamNoElement.textContent;
        var teamName = teamNameElement.textContent;

        // AJAX 요청을 보낼 URL을 설정 해야하는데 왜 안뜨지
        var url = 'http://localhost:8080/otipms/api/employeeData2?projectNo=' + projectNo + '&teamNo=' + teamNo;
	
		$.ajax({
		    url: url, // URL ??
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
	                        <td class="text-center"><input type="radio" name="PLRadio" value="${index}"></td>
	                    	<td class="d-none">${projectName}</td>
	                    	<td class="text-center">${teamName}</td>
	                        <td class="text-center">${employee.empId}</td>
	                        <td class="text-center">${employee.empRank}</td>
	                        <td class="text-left">${employee.empName}</td>
	                    	<td class="d-none">${projectNo}</td>
	                    	<td class="d-none">${teamNo}</td>
	                    `;
	                    
	                    const checkbox = row.querySelector("input[type='radio'][name='PLRadio']");
	                    
	                    employeeList.appendChild(row);
	                });
	                
	            }
	
	            populateEmployeeList();
	
	
		    },
		    error: function (error) {
		        console.log(error);
		    }
		});
	 }
});

function sendSelectedEmployees() {
	// 선택한 사원 정보를 저장할 배열
    var selectedEmployees = []; 

    // 선택한 사원 정보를 수집
    var radio = document.querySelector("#employee-list input[type='radio']:checked");
    var row = radio.parentElement.parentElement;
    var empId = row.cells[3].textContent;
    var position = row.cells[4].textContent;
    var name = row.cells[5].textContent;
    var projectNo = row.cells[6].textContent;
    var teamNo = row.cells[7].textContent;
    selectedEmployees.push({empId, position, name ,projectNo,teamNo});

    // 선택한 라디오 버튼의 값을 가져오기
    var opener = window.opener;
    if (opener) {
        opener.receiveSelectedEmployees(selectedEmployees);
        window.close();
    }
}

function closeWindow() {
	window.close();
}