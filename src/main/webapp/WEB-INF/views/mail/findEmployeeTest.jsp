<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>사원 찾기</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Favicon icon -->
    <%-- <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png"> --%>
    <link rel="icon" type="image/jpeg" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/otipmsFavicon.png">
    
   <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/mail/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mail/customStyle.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mail/dropzone.css" rel="stylesheet" type="text/css">
  
    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/resources/plugins/common/common.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/gleek.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/styleSwitcher.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mail/dropzone.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mail/writemail.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mail/writemailTest.js"></script>
    
    <!-- Editer -->
	<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
	
	<!-- selector -->
	<link href="${pageContext.request.contextPath}/resources/css/mail/prism.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/js/mail/prism.js"></script>
	<link href="${pageContext.request.contextPath}/resources/css/mail/select2.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/js/mail/select2.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/mail/custom.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/mail/findEmployeeTest.js"></script>
	
	<style>
		.form-control {
		    min-height: 90px;
		}	
				
	</style>
</head>

<body>
	<div class="card" style="margin-bottom:0px;">
	<span class="pt-3 pl-3 pb-1 mb-2" style="background-color: #11407a;">
		<h4 style="color:#fff;"><img src="${pageContext.request.contextPath}/resources/images/otipmsCube.jpg" style="height: 30px;" alt=""> 사원 찾기</h4>
	</span>
		<div class="card-body" style="padding: 1rem;">
			<div class="container">
				<div class="row">
					<div class="col">
						<h5 class="">프로젝트</h5>
						<div class="form-group" style="Width:100%;">
							<select multiple="multiple" style="height:300px;width:300px;" id="projectList">
							    
							</select>
						</div>
					</div>
					<div class="col">
						<h5 class="">팀</h5>
						<div class="form-group">
							<select multiple="multiple" style="height:300px;width:150px;"id="teamList">

							</select>
						</div>
					</div>
					<div class="col pr-0" >
						<h5 class="">사원</h5>
						<div class="form-group">
							<select multiple="multiple" style="height:300px;width:150px;" id="employeeList">
							    
							</select>
						</div>
					</div>
					<div class="col">
						<div class="row" style="height:130px; align-items: center; justify-content: center; ">
							<button style="background-color: transparent;border:none;" id="addSendBtn">
								<i class="icon-copy ion-android-arrow-forward"></i>
							</button>
						</div>
						<div class="row" style="height:100px; align-items: center; justify-content: center; " >
							<button style="background-color: transparent;border:none;" id="addCCBtn">
								<i class="icon-copy ion-android-arrow-forward"></i>
							</button>
						</div>
						<div class="row" style="height:100px; align-items: center; justify-content: center; ">
							<button style="background-color: transparent;border:none;" id="addSecretCCBtn">
								<i class="icon-copy ion-android-arrow-forward"></i>
							</button>
						</div>
					</div>
					<div class="col mr-4" >
						<div class="row">
							<div class="row">
								<span><b>수신</b></span>
								<div style="height:80px;width:200px;border:1px solid #b5b5b5; overflow-y: auto; margin-bottom:12px;" id="send">
								
								</div>
							</div>
						</div>
						<div class="row">
							<div class="row">
								<span><b>참조</b></span>
								<div style="height:80px;width:200px;border:1px solid #b5b5b5; overflow-y: auto; margin-bottom:12px;" id="CC">
								
								</div>
							</div>
						</div>
						<div class="row">
							<div class="row">
								<span><b>비밀참조</b></span>
								<div style="height:80px;width:200px;border:1px solid #b5b5b5; overflow-y: auto;" id="secretCC">
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="float:right;">
				<button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" style="height:35px;" onclick="sendSelectedEmployees()">선택</button>
			</div>
		</div>
	</div>
</body>

</html>