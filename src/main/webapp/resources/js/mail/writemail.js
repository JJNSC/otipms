document.addEventListener("DOMContentLoaded", function () {
    function checksave(){
        window.history.back();
    }
    
    window.receiveSelectedEmployees = function (selectedEmployees, recipientType) {
        const selectedTextboxId = `selected${recipientType}Textbox`;
        const selectedTextbox = document.querySelector(`#${selectedTextboxId}`);

        if (selectedTextbox) {
            // 선택한 사원 정보를 텍스트 상자에 채우기
            selectedTextbox.value = selectedEmployees.map(employee => `${employee.position} ${employee.name}`).join(', ');
        }
    };
});
