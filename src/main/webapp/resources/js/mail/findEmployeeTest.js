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
				const nosel = document.createElement("option");
				nosel.text = "선택 안함";
				nosel.style.height = '20px';
				employeeListContainer.appendChild(nosel);
				
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
	
	
	$.ajax({
		url:'/otipms/api/adminList',
		type:'GET',
		success: function(data){
			const employeeListContainer = document.getElementById("adminList");
			data.forEach(function(employee,index){
				const option = document.createElement("option");
				option.value = employee.empId;
				option.text = employee.empRank+' '+employee.empName;
				
				option.style.height = '20px';
				employeeListContainer.appendChild(option);
			});
		},
		error : function (error){
			console.log(error);
		}
	})
	
	
	// 전역 배열을 정의하여 다양한 유형에서 선택된 사원들을 저장합니다.
	const allSelectedEmployees = [];

	// 중복을 확인하기 위한 함수
	function checkForDuplicates(selectedEmployees) {
	    for (let i = 0; i < selectedEmployees.length; i++) {
	    	 const selectedEmployee = selectedEmployees[i];
	         console.log(selectedEmployee);
	        // 다른 유형에서 이미 선택된 사원인지 확인합니다.
	         if (allSelectedEmployees.includes(selectedEmployee)) {
	             alert("이미 선택된 사원입니다.");
	             return true;
	         }
	    }

	    // 중복이 없으면 선택된 사원을 전역 배열에 추가합니다.
	    allSelectedEmployees.push(...selectedEmployees);
	    return false;
	}
	
	//수신
	document.getElementById("addSendBtn").addEventListener("click",function(){
		const employeeList = document.getElementById("employeeList");
		const adminList = document.getElementById("adminList");
		const selectedEmployees = [];
		
		for(let i = 0; i < employeeList.options.length; i++){
			if(employeeList.options[i].value != "선택 안함"){
				if(employeeList.options[i].selected){
					const selectedValue = employeeList.options[i].value;
	            	selectedEmployees.push(selectedValue);
				}
			}
		}
		for(let i = 0; i< adminList.options.length; i++){
			if(adminList.options[i].value != "선택 안함"){
				if(adminList.options[i].selected){
					const selectedAdmin = adminList.options[i].value;
					selectedEmployees.push(selectedAdmin);
				}
			}
		}
		console.log("Selected Options: " + selectedEmployees);
		if(!checkForDuplicates(selectedEmployees)){
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
						div.className = "Recipient";
						const rank = document.createElement("span");
						rank.textContent = employee.empRank;
						rank.className = "empRank"
							const space = document.createElement("span");
						space.textContent = " ";
						const name = document.createElement("span");
						name.textContent = employee.empName;
						name.className = "empName"
							div.style.height = '20px';
						
						const input = document.createElement("input");
						input.value = employee.empId;
						input.type = 'hidden';
						input.classList.add("empId");
						
						sendListContainer.appendChild(div); 
						div.appendChild(rank);
						div.appendChild(space);
						div.appendChild(name);
						div.appendChild(input);
					});
				}
			})
		}
	})
	//참조
	document.getElementById("addCCBtn").addEventListener("click",function(){
		const employeeList = document.getElementById("employeeList");
		const adminList = document.getElementById("adminList");
		const selectedEmployees = [];
		
		for(let i = 0; i < employeeList.options.length; i++){
			if(employeeList.options[i].value != "선택 안함"){
				if(employeeList.options[i].selected){
					const selectedValue = employeeList.options[i].value;
	                selectedEmployees.push(selectedValue);
				}
			}
		}
		for(let i = 0; i< adminList.options.length; i++){
			if(adminList.options[i].value != "선택 안함"){
				if(adminList.options[i].selected){
					const selectedAdmin = adminList.options[i].value;
					selectedEmployees.push(selectedAdmin);
				}
			}
		}
		console.log("Selected Options: " + selectedEmployees);
		if(!checkForDuplicates(selectedEmployees)){
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
						div.className = "Reference";
						const rank = document.createElement("span");
						rank.textContent = employee.empRank;
						rank.className = "empRank"
						const space = document.createElement("span");
						space.textContent = " ";
						const name = document.createElement("span");
						name.textContent = employee.empName;
						name.className = "empName"
					    div.style.height = '20px';
						
						const input = document.createElement("input");
						input.value = employee.empId;
						input.type = 'hidden';
						input.classList.add("empId");
						
						sendListContainer.appendChild(div);
						div.appendChild(rank);
						div.appendChild(space);
					    div.appendChild(name);
						div.appendChild(input);
					});
				}
			})
		}
	})
	//비밀 참조
	document.getElementById("addSecretCCBtn").addEventListener("click",function(){
		const employeeList = document.getElementById("employeeList");
		const adminList = document.getElementById("adminList");
		const selectedEmployees = [];
		
		for(let i = 0; i < employeeList.options.length; i++){
			if(employeeList.options[i].value != "선택 안함"){
				if(employeeList.options[i].selected){
					const selectedValue = employeeList.options[i].value;
					selectedEmployees.push(selectedValue);
				}
			}
		}
		for(let i = 0; i< adminList.options.length; i++){
			if(adminList.options[i].value != "선택 안함"){
				if(adminList.options[i].selected){
					const selectedAdmin = adminList.options[i].value;
					selectedEmployees.push(selectedAdmin);
				}
			}
		}
		console.log("Selected Options: " + selectedEmployees);
		if(!checkForDuplicates(selectedEmployees)){
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
						div.className = "BlindCopy";
						const rank = document.createElement("span");
						rank.textContent = employee.empRank;
						rank.className = "empRank"
						const space = document.createElement("span");
						space.textContent = " ";
						const name = document.createElement("span");
						name.textContent = employee.empName;
						name.className = "empName"
						div.style.height = '20px';
						
						const input = document.createElement("input");
						input.value = employee.empId;
						input.type = 'hidden';
						input.classList.add("empId");
						
						sendListContainer.appendChild(div);
						div.appendChild(rank);
						div.appendChild(space);
					    div.appendChild(name);
						div.appendChild(input);
					});
				}
			})
		}
	})
});

function sendSelectedEmployees() {
	// 선택한 사원 정보를 저장할 배열
    var sendEmployees = []; 
    var CCEmployees = []; 
    var secretCCEmployees = []; 

    // 수신 사원 정보를 수집	
    var sendList = document.querySelectorAll(".Recipient");
    sendList.forEach(function (div) {
    	var empId = div.querySelector(".empId").value;
        var rank = div.querySelector(".empRank").textContent;
        var name = div.querySelector(".empName").textContent;
        var recipientType = "Recipient";
        sendEmployees.push({rank, name, empId});
        console.log("선택한 수신 인원들의 아이디 : "+empId);
    });
    // 참조 사원 정보를 수집
    var CCList = document.querySelectorAll(".Reference");
    CCList.forEach(function (div) {
    	var empId = div.querySelector(".empId").value;
        var rank = div.querySelector(".empRank").textContent;
        var name = div.querySelector(".empName").textContent;
    	var recipientType = "Reference";
    	CCEmployees.push({rank, name, empId});
    	console.log("선택한 참조 인원들의 아이디 : "+empId);
    });
    // 비밀참조 사원 정보를 수집
    var secretCCList = document.querySelectorAll(".BlindCopy");
    secretCCList.forEach(function (div) {
    	var empId = div.querySelector(".empId").value;
        var rank = div.querySelector(".empRank").textContent;
        var name = div.querySelector(".empName").textContent;
    	var recipientType = "BlindCopy";
    	secretCCEmployees.push({rank, name, empId});
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