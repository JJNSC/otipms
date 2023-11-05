document.addEventListener("DOMContentLoaded", function () {
	
	$.ajax({
	    url: 'http://localhost:8080/otipms/api/employeeData', // URL ??
	    type: 'GET',
	    dataType: 'json',
	    success: function (data) {
	    	const projectDropdown = document.getElementById("project-dropdown");
	        const teamDropdown = document.getElementById("team-dropdown");
	        const employeeList = document.getElementById("employee-list");
	        
	        var employeeData = data.employeeData;
	        var projectData = data.projectData;
	        var teamData = data.teamData;
            
            //dropdown 선택 시 자동 필터링
            function populateEmployeeList() {
                const selectedProject = projectDropdown.value;
                const selectedTeam = teamDropdown.value;
                const filteredEmployees = employeeData.filter((employee) => {
                    if (
                        (!selectedProject || employee.projectName === selectedProject) ||
                        (!selectedTeam || employee.teamName === selectedTeam)
                    ) {
                        return true;
                    }
                    return false;
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

                populateEmployeeList();
            });
            teamDropdown.addEventListener("change", function () {
                // 다음 드롭다운 값 갱신
                const selectedProject = projectDropdown.value;
                const selectedProjectId = projectData.find((project) => project.projectName === selectedProject).projectNo;

                // 프로젝트 선택 후 직급 드롭다운도 갱신
                const selectedTeam = teamDropdown.value;
                //updatePositionDropdown(selectedProjectId, selectedTeam);
                
                /*const filterDiv  = document.getElementById("DataTables_Table_0_filter");
				const searchBar = filterDiv.querySelector("input[type='search']");
                searchBar.value = selectedProject.concat(" ").concat(selectedTeam);*/

                populateEmployeeList();
            });
         
	    },
	    error: function (error) {
	        console.log(error);
	    }
	});
	
    
});

