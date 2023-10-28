$(init);

function init() {
	//$("#submitBtn").click(submitBoard);
	$("#submitBoardForm").submit(submitBoardTest);
}

function submitBoard() {
	console.log($("#boardTitle").val());
	console.log($("#myEditor").val());
	console.log(CKEDITOR.instances.myEditor.getData());
}

function submitBoardTest(event) {
	console.log($("#boardTitle").val());
	
	//$(event.target).preventDefault();
	//event.preventDefault();
}