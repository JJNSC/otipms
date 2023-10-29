document.addEventListener("DOMContentLoaded", function () {
    // 객체로 선택한 사원 정보를 관리
    const selectedPL = [];
    var projectNumber;
    var teamNumber;
    
    window.receiveSelectedEmployees = function (selectedEmployee) {
        selectedPL.push(selectedEmployee);
        for(const emp of selectedEmployee){
        	projectNumber = emp.projectNo;
        	teamNumber = emp.teamNo;
        }
        console.log(selectedPL);
        console.log(projectNumber);
        console.log(teamNumber);
        
        updateSelectedEmployeesUI(selectedEmployee, projectNumber, teamNumber);
    };

    function updateSelectedEmployeesUI(selectedEmployee,projectNumber, teamNumber) {
    	const selectedTextbox = document.querySelector(`.teamLeaderName${projectNumber}_${teamNumber}`);
        
        // 선택된 사원 정보를 텍스트 상자에 채우기
    	const selectedPLInfo = [];
    	let empId;
        for (const employee of selectedEmployee) {
        	selectedPLInfo.push(`${employee.position} ${employee.name}`);
        	empId = `${employee.empId}`;
        }
        
        // 선택된 사원들을 화면에 추가
        selectedTextbox.innerHTML = ""; // 기존 내용을 지우고 새로 업데이트
        selectedTextbox.innerHTML = selectedPLInfo;
        
        
        let sendData="teamNo="+teamNumber+"&empId="+empId;
        $.ajax({
        	type:'POST',
        	url:'/otipms/updateTL',
        	data:sendData,
        	dataType:'json',
        	success:function(data){
        		
        	},
        	error:function(error){
        		
        	}
        	
        })

    }

    function waitForElementToDisplay(selector, callback) {
        if (document.querySelector(selector) !== null) {
            callback();
        } else {
            setTimeout(function () {
                waitForElementToDisplay(selector, callback);
            }, 200);
        }
    }

    waitForElementToDisplay("#selectedRecipientTextbox", function () {
        // Callback 내에서 updateSelectedEmployeesUI 함수가 정의되도록 변경
    });
});