document.addEventListener("DOMContentLoaded", function () {
    // 객체로 선택한 사원 정보를 관리
    const selectedPM = [];
    
    window.receiveSelectedClient = function (selectedEmployee) {
    	selectedPM.push(selectedEmployee);
        
        updateSelectedEmployeesUI(selectedEmployee);
    };

    function updateSelectedEmployeesUI(selectedEmployee) {
    	const selectedTextbox = document.querySelector(`#ClientINFO`);
    	const textbox = document.getElementById("ClientINFO");
        const selectedEmployeesContainer = document.querySelector(`#ClientId`);
        const selectedClientTel = document.querySelector(`#ClientTel`);
        const selectedClientEmail = document.querySelector(`#ClientEmail`);
        
        
        if (selectedTextbox && selectedEmployeesContainer) {
            // 선택된 사원 정보를 텍스트 상자에 채우기
        	const selectedPMInfo = []; 
        	const selectedPMempId = []; 
        	const selectedPMTel = []; 
        	const selectedPMEmail = []; 
            for (const employee of selectedEmployee) {
            	selectedPMInfo.push(`${employee.position} ${employee.name}`);
            	selectedPMempId.push(`${employee.empId}`);
            	selectedPMTel.push(`${employee.empEmail}`)
            	selectedPMEmail.push(`${employee.empTel}`)
            }
            
            // 선택된 사원들을 화면에 추가
            selectedTextbox.innerHTML = ""; // 기존 내용을 지우고 새로 업데이트
            selectedTextbox.value = selectedPMInfo.join(', ');
            selectedEmployeesContainer.innerHTML = ""; // 기존 내용을 지우고 새로 업데이트
            selectedEmployeesContainer.value = selectedPMempId.join(', ');
            selectedClientTel.innerHTML = ""; // 기존 내용을 지우고 새로 업데이트
            selectedClientTel.value = selectedPMTel.join(', ');
            selectedClientEmail.innerHTML = ""; // 기존 내용을 지우고 새로 업데이트
            selectedClientEmail.value = selectedPMEmail.join(', ');
 
        }
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