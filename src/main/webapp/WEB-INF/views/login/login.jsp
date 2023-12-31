<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Basic Page Info -->
	<meta charset="utf-8">
	<title>OTIPMS</title>

	<!-- Site favicon -->
	<%-- <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/vendors/images/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/vendors/images/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/vendors/images/favicon-16x16.png"> --%>
	<link rel="icon" type="image/jpeg" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/otipmsFavicon.png">

	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendors/styles/core.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendors/styles/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendors/styles/style.css">

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());

		gtag('config', 'UA-119386393-1');
	</script>
	
<!-- 	<script>
		$
	</script> -->
</head>
<body class="login-page">
	<div class="login-header box-shadow">
		<div class="container-fluid d-flex justify-content-between align-items-center">
			<div class="brand-logo">
				<a href="login">
					<img src="${pageContext.request.contextPath}/resources/vendors/images/otipms.jpg" style="height:70px;" alt="">
				</a>
			</div>
			<div class="login-menu">
			</div>
		</div>
	</div>
	<div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6 col-lg-7">
					<img src="${pageContext.request.contextPath}/resources/vendors/images/login-page-img.png" alt="">
				</div>
				<div class="col-md-6 col-lg-5">
					<div class="login-box bg-white box-shadow border-radius-10">
						<div class="login-title">
							<h2 class="text-center text-primary">Login To OTI PMS</h2>
						</div>
						<form method="post" action="${pageContext.request.contextPath}/login">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<div class="input-group custom">
								<input type="text" id="empId" name="empId" class="form-control form-control-lg" placeholder="UserID">
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="icon-copy dw dw-user1"></i></span>
								</div>
							</div>
							<div class="input-group custom">
								<input type="password" id="empPw" name="empPw" class="form-control form-control-lg" placeholder="**********">
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="dw dw-padlock1"></i></span>
								</div>
							</div>
							<div class="row pb-30">
								<div class="col-8">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" style="accent-color:#11407a;" id="rememberMe" name="_spring_security_remember_me">
										<label class="custom-control-label" for="rememberMe">로그인 상태 유지</label>
									</div>
								</div>
								<div class="col-9 d-none">
									<div class="forgot-password ml-0 pl-0"></div>
								</div>
								
							</div>
							<div class="row">
								<div class="col-sm-12">
									<div class="input-group mb-0">
										<!--
											use code for form submit
											<input class="btn btn-primary btn-lg btn-block" type="submit" value="Sign In">
										-->
										<button type="submit" class="btn btn-primary btn-lg btn-block">Sign In</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- js -->
	<script src="${pageContext.request.contextPath}/resources/vendors/scripts/core.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/scripts/script.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/scripts/process.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/scripts/layout-settings.js"></script>
</body>
</html>