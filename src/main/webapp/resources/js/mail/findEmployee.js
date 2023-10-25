document.addEventListener("DOMContentLoaded", function () {
    const projectDropdown = document.getElementById("project-dropdown");
    const teamDropdown = document.getElementById("team-dropdown");
    const positionDropdown = document.getElementById("position-dropdown");
    const employeeList = document.getElementById("employee-list");
    
    const selectAllCheckbox = document.getElementById("selectAllCheckbox");
    
    let employeeCheckboxes = [];
    
    const employeeData = [
    	{ project: "프로젝트 1", team: "팀 1", position: "사원", name: "김사원" },
    	  { project: "프로젝트 1", team: "팀 2", position: "대리", name: "박대리" },
    	  { project: "프로젝트 1", team: "팀 2", position: "과장", name: "이과장" },
    	  { project: "프로젝트 1", team: "팀 1", position: "차장", name: "최차장" },
    	  { project: "프로젝트 1", team: "팀 1", position: "부장", name: "정부장" },
    	  { project: "프로젝트 1", team: "팀 2", position: "이사", name: "송이사" },
    	  { project: "프로젝트 1", team: "팀 1", position: "사원", name: "김사원1" },
    	  { project: "프로젝트 1", team: "팀 3", position: "대리", name: "박대리1" },
    	  { project: "프로젝트 1", team: "팀 3", position: "과장", name: "이과장1" },
    	  { project: "프로젝트 1", team: "팀 4", position: "차장", name: "최차장1" },
    	  { project: "프로젝트 1", team: "팀 4", position: "부장", name: "정부장1" },
    	  { project: "프로젝트 1", team: "팀 3", position: "이사", name: "송이사1" },
    	  { project: "프로젝트 1", team: "팀 4", position: "사원", name: "김사원2" },
    	  { project: "프로젝트 1", team: "팀 3", position: "대리", name: "박대리2" },
    	  { project: "프로젝트 1", team: "팀 3", position: "과장", name: "이과장2" },
    	  { project: "프로젝트 1", team: "팀 4", position: "차장", name: "최차장2" },
    	  { project: "프로젝트 1", team: "팀 5", position: "부장", name: "정부장2" },
    	  { project: "프로젝트 1", team: "팀 5", position: "이사", name: "송이사2" },
    	  { project: "프로젝트 1", team: "팀 5", position: "사원", name: "김사원3" },
    	  { project: "프로젝트 2", team: "팀 7", position: "대리", name: "박대리3" },
    	  { project: "프로젝트 2", team: "팀 8", position: "과장", name: "이과장3" },
    	  { project: "프로젝트 2", team: "팀 9", position: "차장", name: "최차장3" },
    	  { project: "프로젝트 2", team: "팀 6", position: "부장", name: "정부장3" },
    	  { project: "프로젝트 2", team: "팀 7", position: "이사", name: "송이사3" },
    	  { project: "프로젝트 2", team: "팀 8", position: "사원", name: "김사원4" },
    	  { project: "프로젝트 2", team: "팀 9", position: "대리", name: "박대리4" },
    	  { project: "프로젝트 2", team: "팀 6", position: "과장", name: "이과장4" },
    	  { project: "프로젝트 2", team: "팀 7", position: "차장", name: "최차장4" },
    	  { project: "프로젝트 2", team: "팀 8", position: "부장", name: "정부장4" },
    	  { project: "프로젝트 2", team: "팀 9", position: "이사", name: "송이사4" },
    	  { project: "프로젝트 3", team: "팀 10", position: "사원", name: "김사원5" },
    	  { project: "프로젝트 3", team: "팀 11", position: "대리", name: "박대리5" },
    	  { project: "프로젝트 3", team: "팀 12", position: "과장", name: "이과장5" },
    	  { project: "프로젝트 3", team: "팀 10", position: "차장", name: "최차장5" },
    	  { project: "프로젝트 3", team: "팀 11", position: "부장", name: "정부장5" },
    	  { project: "프로젝트 3", team: "팀 12", position: "이사", name: "송이사5" },
    ];

    const projectData = [
        { id: 1, name: "프로젝트 1" },
        { id: 2, name: "프로젝트 2" },
        { id: 3, name: "프로젝트 3" },
    ];

    const teamData = {
        1: ["팀 1", "팀 2", "팀 3", "팀 4", "팀 5"],
        2: ["팀 6", "팀 7", "팀 8", "팀 9"],
        3: ["팀 10", "팀 11", "팀 12"],
    };

    const positionData = {
        "팀 1": ["사원", "대리", "과장", "차장", "부장", "이사"],
        "팀 2": ["사원", "대리", "과장", "차장", "부장", "이사"],
        "팀 3": ["사원", "대리", "과장", "차장", "부장", "이사"],
        "팀 4": ["사원", "대리", "과장", "차장", "부장", "이사"],
        "팀 5": ["사원", "대리", "과장", "차장", "부장", "이사"],
        "팀 6": ["사원", "대리", "과장", "차장", "부장", "이사"],
        "팀 7": ["사원", "대리", "과장", "차장", "부장", "이사"],
        "팀 8": ["사원", "대리", "과장", "차장", "부장", "이사"],
        "팀 9": ["사원", "대리", "과장", "차장", "부장", "이사"],
        "팀 10": ["사원", "대리", "과장", "차장", "부장", "이사"],
        "팀 11": ["사원", "대리", "과장", "차장", "부장", "이사"],
        "팀 12": ["사원", "대리", "과장", "차장", "부장", "이사"],
    };
    
    function syncSelectAllCheckbox() {
    	const allChecked = [...employeeCheckboxes].every(function (cb) {
    		return cb.checked;
    	});
    	selectAllCheckbox.checked = allChecked;
    }
    
    function populateEmployeeList() {
        employeeList.innerHTML = "";

        const selectedProject = projectDropdown.value;
        const selectedTeam = teamDropdown.value;
        const selectedPosition = positionDropdown.value;

        const filteredEmployees = employeeData.filter((employee) => {
            if (
        		(!selectedProject || employee.project === projectData.find(p => p.id == selectedProject).name) &&
                (!selectedTeam || employee.team === selectedTeam) &&
                (!selectedPosition || employee.position === selectedPosition)
            ) {
                return true;
            }
            return false;
        });
        
        employeeCheckboxes = [];
        
        filteredEmployees.forEach((employee) => {
            const row = document.createElement("tr");
            row.innerHTML = `
                <td class="text-center"><input type="checkbox"></td>
                <td class="text-center">${employee.project}</td>
                <td class="text-center">${employee.team}</td>
                <td class="text-center">${employee.position}</td>
                <td class="text-left">${employee.name}</td>
            `;
            
            const checkbox = row.querySelector("input[type='checkbox']");
            // 배열에 체크박스 추가
            employeeCheckboxes.push(checkbox);

            checkbox.addEventListener("change", function () {
            	// 각 체크박스 상태가 변경될 때 selectAllCheckbox 동기화
            	syncSelectAllCheckbox();
            });
            
            employeeList.appendChild(row);
        });
        
        syncSelectAllCheckbox();
    }

    projectData.forEach((project) => {
        const option = document.createElement("option");
        option.value = project.id;
        option.text = project.name;
        projectDropdown.appendChild(option);
    });

    projectDropdown.addEventListener("change", function () {
        const selectedProjectId = projectDropdown.value;

        // 이전 하위 드롭다운 제거
        while (teamDropdown.options.length > 1) {
            teamDropdown.remove(1);
        }

        if (selectedProjectId) {
            teamData[selectedProjectId].forEach((team) => {
                const option = document.createElement("option");
                option.value = team;
                option.text = team;
                teamDropdown.appendChild(option);
            });
        }
        
        const allChecked = [...employeeCheckboxes].every(function (cb) {
            return cb.checked;
        });
        selectAllCheckbox.checked = allChecked;

        updatePositionDropdown(selectedProjectId, teamDropdown.value);

        populateEmployeeList();
    });

    
    selectAllCheckbox.addEventListener("change", function () {
    	const isChecked = selectAllCheckbox.checked;
    	employeeCheckboxes.forEach(function (checkbox) {
    		checkbox.checked = isChecked;
    	});
    });
    
    // employeeCheckboxes 각각의 체크 상태를 감지하는 리스너 연결
    employeeCheckboxes.forEach(function (checkbox) {
    	checkbox.addEventListener("change", function () {
    		syncSelectAllCheckbox();
    	});
    });
    
    teamDropdown.addEventListener("change", function () {
    	const selectedTeam = teamDropdown.value;

        // 프로젝트 선택 후 직급 드롭다운도 갱신
        const selectedProjectId = projectDropdown.value;
        updatePositionDropdown(selectedProjectId, selectedTeam);
    	
        const allChecked = [...employeeCheckboxes].every(function (cb) {
            return cb.checked;
        });
        selectAllCheckbox.checked = allChecked;
        
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
            const positions = positionData[selectedTeam];
            positions.forEach((position) => {
                const option = document.createElement("option");
                option.value = position;
                option.text = position;
                positionDropdown.appendChild(option);
            });
        }
    }
    

});

function sendSelectedEmployees() {
	// 선택한 사원 정보를 저장할 배열
    var selectedEmployees = []; 

    // 선택한 사원 정보를 수집
    var checkboxes = document.querySelectorAll("#employee-list input[type='checkbox']:checked");
    checkboxes.forEach(function (checkbox) {
        var row = checkbox.parentElement.parentElement;
        var position = row.cells[3].textContent;
        var name = row.cells[4].textContent;
        selectedEmployees.push({ position, name });
    });

    // 선택한 라디오 버튼의 값을 가져오기
    var recipientTypeInput = document.querySelector("input[name='recipient']:checked");
    var recipientType = recipientTypeInput ? recipientTypeInput.value : "Recipient";
    // 쪽지 쓰기에 선택한 사원 정보 전달
    var opener = window.opener;
    if (opener) {
        opener.receiveSelectedEmployees(selectedEmployees, recipientType);
        window.close(); 
    }
}

function closeWindow() {
	window.close();
}