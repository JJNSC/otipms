
function uploadImage() {
   $("#imageInput").click();
}

function changeProfile() {
   var profileImage = document.getElementById("profileImage");
   var imageInput = document.getElementById("imageInput");
   var selectedImage = imageInput.files[0];
   
   if(selectedImage) {
	   // 이미지를 미리보기로 설정
	   const imageURL = URL.createObjectURL(selectedImage);
	   profileImage.src = imageURL;
	   
	   var defaultProfileImage = document.getElementById("defaultProfileImgContainer");
	   defaultProfileImage.classList.remove("d-none");
   }
}

function setDefaultProfileImgBtn(){
	$("#imageInput").click();
	/*var defaultProfileImage = document.getElementById("defaultProfileImgContainer");
	defaultProfileImage.classList.remove("d-none");*/
}
	
    

