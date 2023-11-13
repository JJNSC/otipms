document.addEventListener("DOMContentLoaded", function () {
	$.ajax({
		url:'/otipms/api/projectList',
		type:'GET',
		dataType: 'json',
		success: function(data){
			const projectListContainer = document.getElementById("projectList");
			
			data.forEach(function(project,index){
				const option = document.createElement("option");
				option.value = project.projectNo;
				option.text = (index+1)+'. '+project.projectName;
				
				option.style.height = '20px';
				option.addEventListener('click',function(){
					getTeamList(project.projectNo);
				})
				
				projectListContainer.appendChild(option);
			});
		},
		error: function (error) {
	        console.log(error);
	    }
	})
	
	function getTeamList(projectNo){
		$.ajax({
			url:'/otipms/api/teamList',
			type:'GET',
			data:{projectNo:projectNo},
			dataType: 'json',
			success: function(data){
				const teamListContainer = document.getElementById("teamList");
				
				while (teamListContainer.firstChild) {
				    teamListContainer.removeChild(teamListContainer.firstChild);
				}
				
				data.forEach(function(team,index){
					const option = document.createElement("option");
					option.value = team.teamNo;
					option.text = (index+1)+'. '+team.teamName;
					
					option.style.height = '20px';
					option.addEventListener('click',function(){
						getEmployeeList(team.teamNo);
					})
					
					teamListContainer.appendChild(option);
				});
			},
			error: function (error) {
		        console.log(error);
		    }
		})
	}
	
	function getEmployeeList(teamNo){
		$.ajax({
			url:'/otipms/api/employeeList',
			type:'GET',
			data:{teamNo:teamNo},
			dataType: 'json',
			success: function(data){
				const employeeListContainer = document.getElementById("employeeList");
				
				while (employeeListContainer.firstChild) {
					employeeListContainer.removeChild(employeeListContainer.firstChild);
				}
				
				data.forEach(function(employee,index){
					const option = document.createElement("option");
					option.value = employee.empId;
					option.text = employee.empRank+' '+employee.empName;
					
					option.style.height = '20px';
					employeeListContainer.appendChild(option);
				});
			},
			error: function (error) {
		        console.log(error);
		    }
		})
	}
	//수신
	document.getElementById("addSendBtn").addEventListener("click",function(){
		const employeeList = document.getElementById("employeeList");
		const selectedEmployees = [];
		
		for(let i = 0; i < employeeList.options.length; i++){
			if(employeeList.options[i].selected){
				selectedEmployees.push(employeeList.options[i].value);
			}
		}
		console.log("Selected Options: " + selectedEmployees);
		
		$.ajax({
			url:'/otipms/api/sendList',
			type:'GET',
			data:{selectedEmployees:selectedEmployees},
			dataType: 'json',
			success: function(data){
				const sendListContainer = document.getElementById("send");
				console.log("data : "+ data);
				data.forEach(function(employee,index){
					const div = document.createElement("div");
				    div.textContent = employee.empRank + ' ' + employee.empName;
				    div.style.height = '20px';

				    const input = document.createElement("input");
				    input.value = employee.empId;
				    input.type = 'hidden';
				    input.classList.add("Recipient");

				    sendListContainer.appendChild(div); 
				    sendListContainer.appendChild(input);
				});
			}
		})
	})
	//참조
	document.getElementById("addCCBtn").addEventListener("click",function(){
		const employeeList = document.getElementById("employeeList");
		const selectedEmployees = [];
		
		for(let i = 0; i < employeeList.options.length; i++){
			if(employeeList.options[i].selected){
				selectedEmployees.push(employeeList.options[i].value);
			}
		}
		console.log("Selected Options: " + selectedEmployees);
		
		$.ajax({
			url:'/otipms/api/sendList',
			type:'GET',
			data:{selectedEmployees:selectedEmployees},
			dataType: 'json',
			success: function(data){
				const sendListContainer = document.getElementById("CC");
				console.log("data : "+ data);
				data.forEach(function(employee,index){
					const div = document.createElement("div");
					div.textContent = employee.empRank + ' ' + employee.empName;
					div.style.height = '20px';
					
					const input = document.createElement("input");
					input.value = employee.empId;
					input.type = 'hidden';
					input.classList.add("Reference");
					
					sendListContainer.appendChild(div); 
					sendListContainer.appendChild(input);
				});
			}
		})
	})
	//비밀 참조
	document.getElementById("addSecretCCBtn").addEventListener("click",function(){
		const employeeList = document.getElementById("employeeList");
		const selectedEmployees = [];
		
		for(let i = 0; i < employeeList.options.length; i++){
			if(employeeList.options[i].selected){
				selectedEmployees.push(employeeList.options[i].value);
			}
		}
		console.log("Selected Options: " + selectedEmployees);
		
		$.ajax({
			url:'/otipms/api/sendList',
			type:'GET',
			data:{selectedEmployees:selectedEmployees},
			dataType: 'json',
			success: function(data){
				const sendListContainer = document.getElementById("secretCC");
				console.log("data : "+ data);
				data.forEach(function(employee,index){
					const div = document.createElement("div");
					div.textContent = employee.empRank + ' ' + employee.empName;
					div.style.height = '20px';
					
					const input = document.createElement("input");
					input.value = employee.empId;
					input.type = 'hidden';
					input.classList.add("BlindCopy");
					
					sendListContainer.appendChild(div); 
					sendListContainer.appendChild(input);
				});
			}
		})
	})
});

function sendSelectedEmployees() {
	// 선택한 사원 정보를 저장할 배열
    var sendEmployees = []; 
    var CCEmployees = []; 
    var secretCCEmployees = []; 

    // 수신 사원 정보를 수집
    var sendList = document.querySelectorAll(".Recipient");
    sendList.forEach(function (input) {
        var empId = input.value;
        var recipientType = "Recipient";
        sendEmployees.push(empId);
        console.log("선택한 수신 인원들의 아이디 : "+empId);
    });
    // 참조 사원 정보를 수집
    var CCList = document.querySelectorAll(".Reference");
    CCList.forEach(function (input) {
    	var empId = input.value;
    	var recipientType = "Reference";
    	CCEmployees.push(empId);
    	console.log("선택한 참조 인원들의 아이디 : "+empId);
    });
    // 비밀참조 사원 정보를 수집
    var secretCCList = document.querySelectorAll(".BlindCopy");
    secretCCList.forEach(function (input) {
    	var empId = input.value;
    	var recipientType = "BlindCopy";
    	secretCCEmployees.push(empId);
    	console.log("선택한 비밀참조 인원들의 아이디 : "+empId);
    });

    // 선택한 라디오 버튼의 값을 가져오기
    //var recipientTypeInput = document.querySelector("input[name='recipient']:checked");
    //var recipientType = recipientTypeInput ? recipientTypeInput.value : "Recipient";
    // 쪽지 쓰기에 선택한 사원 정보 전달
    var opener = window.opener;
    if (opener) {
        opener.receiveSelectedEmployeesTest(sendEmployees, CCEmployees, secretCCEmployees);
        window.close(); 
    }
}

function closeWindow() {
	window.close();
}