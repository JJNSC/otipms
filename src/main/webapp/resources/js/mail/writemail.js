document.addEventListener("DOMContentLoaded", function () {
    function checksave() {
        window.history.back();
    }

    // 객체로 선택한 사원 정보를 관리
    const selectedEmployees = {
        'Recipient': [],
        'Reference': [],
        'BlindCopy': []
    };
    
    window.receiveSelectedEmployees = function (selectedEmployee, recipientType) {
        selectedEmployees[recipientType].push(selectedEmployee);
        
        console.log(selectedEmployees[recipientType]);
        
        updateSelectedEmployeesUI(selectedEmployee, recipientType);
    };

    function updateSelectedEmployeesUI(selectedEmployee, recipientType) {
    	const selectedTextbox = document.querySelector(`#selected${recipientType}Textbox`);
        const selectedEmployeesContainer = document.querySelector(`#selected${recipientType}Employees`);
        
        console.log(selectedEmployees[recipientType]);
        
        if (selectedTextbox && selectedEmployeesContainer) {
            // 선택된 사원 정보를 텍스트 상자에 채우기
        	const selectedEmployeeNames = [];
            for (const employee of selectedEmployee) {
                selectedEmployeeNames.push(`${employee.position} ${employee.name}`);
            }
            selectedTextbox.value = selectedEmployeeNames.join(', ');
            
            console.log(selectedTextbox.value);
            
            // 선택된 사원들을 화면에 추가
            selectedEmployeesContainer.innerHTML = ""; // 기존 내용을 지우고 새로 업데이트
            selectedEmployee.forEach(employee => {
                const div = document.createElement("div");
                div.classList.add("selected-employee");
                div.innerHTML = `${employee.position} ${employee.name} <button class="remove-employee">x</button>`;
                selectedEmployeesContainer.appendChild(div);
            });

            // 이벤트 리스너를 추가하여 "x" 버튼 클릭 시 선택된 사원을 제거
            const removeButtons = selectedEmployeesContainer.querySelectorAll('.remove-employee');
            removeButtons.forEach((button, index) => {
                button.addEventListener('click', function () {
                    selectedEmployee.splice(index, 1);
                    updateSelectedEmployeesUI(selectedEmployee, recipientType);
                });
            });
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