<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-100" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Quixlab - Bootstrap Admin Dashboard Template by Themefisher.com</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
    <!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> -->
    <link href="${pageContext.request.contextPath}/resources/plugins/fullcalendar/css/fullcalendar.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mySchedule/myScheduleCustom.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/initialAccess/profile.js"></script>
    
</head>

<body class="h-100">
    
    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    



    <div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                <a class="text-center"> <h4>OtiPMS-관리자 계정 생성</h4></a>
                                <form class="mt-5 mb-2 login-input" method="post" action="employeeManagement/createAdmin" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="adminId" placeholder="관리자 ID 입력 (숫자)">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" name="adminPw" placeholder="관리자 비밀번호 입력">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="adminName" placeholder="이름">
                                    </div>
                                    <div class="form-group">
										<select class="form-control" id="positionSelect" name="adminPosition">
											<option value="" id="nowEmpRank">직급선택</option>
											<option value="사원">사원</option>
											<option value="대리">대리</option>
											<option value="과장">과장</option>
											<option value="차장">차장</option>
											<option value="부장">부장</option>
											<option value="이사">이사</option>
										</select>
                                    </div>
                                     <div class="form-group">
                                        <input type="text" class="form-control" name="adminTel" placeholder="전화번호 ex)010-0000-0000">
                                    </div>
                                    <span style="cursor:pointer;" onclick="setDefaultProfileImgBtn()">기본 프로필사진 설정하려면 절 클릭해줘요<strong style="color:blue">(CLICK ME!)</strong></span>
		                            <div id="defaultProfileImgContainer" class="profile-photo d-none mt-4 mb-0">
										<input class="d-none" type="file" id="imageInput" name="defaultProfileImage" accept="image/*" onchange="changeProfile()">
										<!-- <a href="modal" data-toggle="modal" data-target="#modal" class="edit-avatar"><i class="fa fa-pencil"></i></a> -->
										<span class="edit-avatar" onclick="uploadImage()"><i class="fa fa-pencil"></i></span>
										<img id="profileImage" src="" alt="" class="avatar-photo" width="160px" height="160px"/>
									</div>
                                    <button class="btn login-form__btn submit w-100 mt-4 mb-0">생성</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

    

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="${pageContext.request.contextPath}/resources/plugins/common/common.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/gleek.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/styleSwitcher.js"></script>
</body>
</html>