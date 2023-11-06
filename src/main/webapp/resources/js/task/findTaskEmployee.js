document.addEventListener("DOMContentLoaded", function () {
	  
	$.ajax({
	    url: 'http://localhost:8080/otipms/api/employeeData', // URL ??
	    type: 'GET',
	    dataType: 'json',
	    success: function (data) {
	    	const projectDropdown = document.getElementById("project-dropdown");
	        const teamDropdown = document.getElementById("team-dropdown");
	        const positionDropdown = document.getElementById("position-dropdown");
	        const employeeList = document.getElementById("employee-list");
	        
	        var employeeData = data.employeeData;
	        var projectData = data.projectData;
	        var teamData = data.teamData;
	      	        
            //dropdown 선택 시 자동 필터링
            function populateEmployeeList() {
                employeeList.innerHTML = "";

                const selectedProject = projectDropdown.value;
                const selectedTeam = teamDropdown.value;
                const selectedPosition = positionDropdown.value;

                const filteredEmployees = employeeData.filter((employee) => {
                    if (
                        (!selectedProject || employee.projectName === selectedProject) &&
                        (!selectedTeam || employee.teamName === selectedTeam) &&
                        (!selectedPosition || employee.empRank === selectedPosition)
                    ) {
                        return true;
                    }
                    return false;
                });
                
                filteredEmployees.forEach((employee, index) => {
                    const row = document.createElement("tr");
                    row.innerHTML = `
                        <td class="text-center"><input type="radio" name="taskEmpRadio" value="${index}"></td>
                        <td class="text-center">${employee.projectName}</td>
                        <td class="text-center">${employee.teamName}</td>
                        <td class="text-center">${employee.empRank}</td>
                        <td class="text-left">${employee.empName}</td>
                        <td class="text-left d-none">${employee.empId}</td>
                    `;
                    
                    const checkbox = row.querySelector("input[type='radio'][name='taskEmpRadio']");

                    employeeList.appendChild(row);
                });
                
            }
            
            projectData.forEach((project) => {
                const option = document.createElement("option");
                option.value = project.projectName; // 변경된 JSON 데이터 구조에 맞게 수정
                option.text = project.projectName; // 변경된 JSON 데이터 구조에 맞게 수정
                projectDropdown.appendChild(option);
            });

            projectDropdown.addEventListener("change", function () {
            	const selectedProject = projectDropdown.value;
            	const selectedProjectData = projectData.find((project) => project.projectName === selectedProject);

                // 이전 하위 드롭다운 제거
                while (teamDropdown.options.length > 1) {
                    teamDropdown.remove(1);
                }

                if (selectedProjectData) {
                    // 프로젝트 선택에 따라 팀 데이터 필터링
                    const filteredTeams = teamData.filter((team) => team.projectNo === selectedProjectData.projectNo);
                    filteredTeams.forEach((team) => {
                        const option = document.createElement("option");
                        option.value = team.teamName;
                        option.text = team.teamName;
                        teamDropdown.appendChild(option);
                    });
                }
                
                const selectedTeam = teamDropdown.value;
                const selectedPosition = positionDropdown.value;

                populateEmployeeList();
            });

            teamDropdown.addEventListener("change", function () {
                // 다음 드롭다운 값 갱신
                const selectedProject = projectDropdown.value;
                const selectedProjectId = projectData.find((project) => project.projectName === selectedProject).projectNo;

                // 프로젝트 선택 후 직급 드롭다운도 갱신
                const selectedTeam = teamDropdown.value;
                updatePositionDropdown(selectedProjectId, selectedTeam);

                populateEmployeeList();
            });

            positionDropdown.addEventListener("change", function () {
                populateEmployeeList();
            });

            populateEmployeeList();


            
            // 직급 드롭다운 갱신 함수
            function updatePositionDropdown(projectId, selectedTeam) {
                while (positionDropdown.options.length > 1) {
                    positionDropdown.remove(1);
                }

                if (projectId && selectedTeam) {
                    const positions = ["사원", "대리", "과장", "차장", "부장", "이사", "고객사"];

                    positions.forEach((position) => {
                        const option = document.createElement("option");
                        option.value = position;
                        option.text = position;
                        positionDropdown.appendChild(option);
                    });
                }
            }
            
           console.log("keyup아 키가 업되고 싶지 않은거지?" + $("#hzInput").val())
            $("#hzInput").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                console.log("keyup아 키가 업되고 싶지 않은거지?" + value)
                $("#employee-list tr").filter(function() {
                  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
              });
            
	    },
	    error: function (error) {
	        console.log(error);
	    }
	});
	
    
});

function sendSelectedEmployees() {
	// 선택한 사원 정보를 저장할 배열
    var selectedEmployees = []; 

    // 선택한 사원 정보를 수집
    var radio = document.querySelector("#employee-list input[type='radio']:checked");
    var row = radio.parentElement.parentElement;
    var name = row.cells[4].textContent;
    var id = row.cells[5].textContent;
    selectedEmployees.push({name, employeeId: id});
    /*var position = row.cells[3].textContent;
    var name = row.cells[4].textContent;
    var id = row.cells[5].textContent;
    selectedEmployees.push({ position, name, id});*/
    // 쪽지 쓰기에 선택한 사원 정보 전달
    console.log("잘 전달할건지" + selectedEmployees.toString());
    var opener = window.opener;
    if (opener) {
        opener.receiveSelectedTaskEmployee(selectedEmployees);
        window.close();
    }
}

function closeWindow() {
	window.close();
}