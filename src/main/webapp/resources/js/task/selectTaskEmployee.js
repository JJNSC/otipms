document.addEventListener("DOMContentLoaded", function () {
    // 객체로 선택한 사원 정보를 관리
    const selectedTaskEmployee = [];
	
    window.receiveSelectedTaskEmployee = function (selectedEmployee) {
    	selectedTaskEmployee.push(selectedEmployee);
    	
    	console.log(selectedTaskEmployee);
    	
        updateSelectedEmployeesUI(selectedEmployee);
    };
    
    function updateSelectedEmployeesUI(selectedEmployee) {
    	/*const selectedTextbox = document.querySelector(`#selectedTextbox`);
        const selectedEmployeesContainer = document.querySelector(`#selectedEmployees`);*/
    	const empIdInput = document.querySelector(`#empIdInput`);
        const employeeName = document.querySelector(`#employeeName`);
        
        // 선택된 사원 정보를 텍스트 상자에 채우기
    	var selectedEmployeeId = [];
    	var selectedEmployeeName = [];
        for (var employee of selectedEmployee) {
        	selectedEmployeeId.push(`${employee.employeeId}`);
        	selectedEmployeeName.push(`${employee.name}`);
        }
        empIdInput.value = selectedEmployeeId.join(', ');
        employeeName.value = selectedEmployeeName.join(', ');
        
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
