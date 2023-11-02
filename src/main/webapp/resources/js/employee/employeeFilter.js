document.addEventListener("DOMContentLoaded", function () {
	
	$.ajax({
	    url: 'http://localhost:8080/otipms/api/employeeData', // URL ??
	    type: 'GET',
	    dataType: 'json',
	    success: function (data) {
	    	const projectDropdown = document.getElementById("project-dropdown");
	        const teamDropdown = document.getElementById("team-dropdown");
	        const projectDropdownModal = document.getElementById("project-dropdown-modal");
	        const teamDropdownModal = document.getElementById("team-dropdown-modal");
	        const projectDropdownModalRegister = document.getElementById("project-dropdown-modal-register");
	        const teamDropdownModalRegister = document.getElementById("team-dropdown-modal-register");
	        const employeeList = document.getElementById("employee-list");
	        
	        var employeeData = data.employeeData;
	        var projectData = data.projectData;
	        var teamData = data.teamData;
            
            //dropdown 선택 시 자동 필터링
            function populateEmployeeList() {
                const selectedProject = projectDropdown.value;
                const selectedTeam = teamDropdown.value;
                const selectedProjectModal = projectDropdownModal.value;
                const selectedTeamModal = teamDropdownModal.value;
                const selectedProjectModalRegister = projectDropdownModalRegister.value;
                const selectedTeamModalRegister = teamDropdownModalRegister.value;
                const filteredEmployees = employeeData.filter((employee) => {
                    if (
                        (!selectedProject || employee.projectName === selectedProject) ||
                        (!selectedTeam || employee.teamName === selectedTeam)
                    ) {
                        return true;
                    }
                    return false;
                });
                
                const filterDiv  = document.getElementById("DataTables_Table_0_filter");
                
                const searchBar = filterDiv.querySelector("input[type='search']");
                
                searchBar.val="PMS 제작 프로젝트";
            }
            
            projectData.forEach((project) => {
                const option = document.createElement("option");
                option.value = project.projectName; // 변경된 JSON 데이터 구조에 맞게 수정
                option.text = project.projectName; // 변경된 JSON 데이터 구조에 맞게 수정
                projectDropdown.appendChild(option);
                projectDropdownModal.appendChild(option);
                projectDropdownModalRegister.appendChild(option);
            });

            projectDropdown.addEventListener("change", function () {
            	const selectedProject = projectDropdown.value;
            	const selectedProjectData = projectData.find((project) => project.projectName === selectedProject);

				const filterDiv  = document.getElementById("DataTables_Table_0_filter");
				const searchBar = filterDiv.querySelector("input[type='search']");
				
				var dt_product_table = $('.datatables-products');
				
				
            	searchBar.value = selectedProject;
            	
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

                populateEmployeeList();
            });
            projectDropdownModal.addEventListener("change", function () {
            	const selectedProjectModal = projectDropdownModal.value;
            	const selectedProjectDataModal = projectData.find((project) => project.projectName === selectedProjectModal);
            	
            	// 이전 하위 드롭다운 제거
            	while (teamDropdownModal.options.length > 1) {
            		teamDropdownModal.remove(1);
            	}
            	
            	if (selectedProjectDataModal) {
            		// 프로젝트 선택에 따라 팀 데이터 필터링
            		const filteredTeams = teamData.filter((team) => team.projectNo === selectedProjectDataModal.projectNo);
            		filteredTeams.forEach((team) => {
            			const option = document.createElement("option");
            			option.value = team.teamName;
            			option.text = team.teamName;
            			teamDropdownModal.appendChild(option);
            		});
            	}
            	const selectedTeamModal = teamDropdownModal.value;
            	
            	populateEmployeeList();
            });
            projectDropdownModalRegister.addEventListener("change", function () {
            	const selectedProjectModalRegister = projectDropdownModalRegister.value;
            	const selectedProjectDataModalRegister = projectData.find((project) => project.projectName === selectedProjectModalRegister);
            	
            	// 이전 하위 드롭다운 제거
            	while (teamDropdownModalRegister.options.length > 1) {
            		teamDropdownModalRegister.remove(1);
            	}
            	
            	if (selectedProjectDataModalRegister) {
            		// 프로젝트 선택에 따라 팀 데이터 필터링
            		const filteredTeams = teamData.filter((team) => team.projectNo === selectedProjectDataModalRegister.projectNo);
            		filteredTeams.forEach((team) => {
            			const option = document.createElement("option");
            			option.value = team.teamName;
            			option.text = team.teamName;
            			teamDropdownModalRegister.appendChild(option);
            		});
            	}
            	const selectedTeamModalRegister= teamDropdownModalRegister.value;
            	
            	populateEmployeeList();
            });
            teamDropdown.addEventListener("change", function () {
                // 다음 드롭다운 값 갱신
                const selectedProject = projectDropdown.value;
                const selectedProjectId = projectData.find((project) => project.projectName === selectedProject).projectNo;

                // 프로젝트 선택 후 직급 드롭다운도 갱신
                const selectedTeam = teamDropdown.value;
                //updatePositionDropdown(selectedProjectId, selectedTeam);
                
                const filterDiv  = document.getElementById("DataTables_Table_0_filter");
				const searchBar = filterDiv.querySelector("input[type='search']");
                searchBar.value = selectedProject.concat(" ").concat(selectedTeam);

                populateEmployeeList();
            });
            teamDropdownModal.addEventListener("change", function () {
            	// 다음 드롭다운 값 갱신
            	const selectedProjectModal = projectDropdownModal.value;
            	const selectedProjectIdModal = projectData.find((project) => project.projectName === selectedProjectModal).projectNo;
            	
            	// 프로젝트 선택 후 직급 드롭다운도 갱신
            	const selectedTeamModal = teamDropdownModal.value;
            	//updatePositionDropdown(selectedProjectId, selectedTeam);
            	
            	populateEmployeeList();
            });
            teamDropdownModalRegister.addEventListener("change", function () {
            	// 다음 드롭다운 값 갱신
            	const selectedProjectModalRegister = projectDropdownModalRegister.value;
            	const selectedProjectIdModalRegister = projectData.find((project) => project.projectName === selectedProjectModalRegister).projectNo;
            	
            	// 프로젝트 선택 후 직급 드롭다운도 갱신
            	const selectedTeamModalRegister = teamDropdownModalRegister.value;
            	//updatePositionDropdown(selectedProjectId, selectedTeam);
            	
            	populateEmployeeList();
            });
         
	    },
	    error: function (error) {
	        console.log(error);
	    }
	});
	
    
});

