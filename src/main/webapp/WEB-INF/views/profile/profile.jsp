<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>사원 정보</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/plugins/fullcalendar/css/fullcalendar.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mySchedule/myScheduleCustom.css" rel="stylesheet">
    
    <script src="${pageContext.request.contextPath}/resources/js/profile/profile.js"></script>

</head>

<body>
	<jsp:include page="../headernsidebar.jsp">
		<jsp:param name="employee" value="${employee}" />
	</jsp:include>
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
					<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 mb-30">
						<div class="card" style="padding: 20px;">
							<div class="profile-photo">
								<a href="modal" data-toggle="modal" data-target="#modal" class="edit-avatar"><i class="fa fa-pencil"></i></a>
								<img src="${pageContext.request.contextPath}/resources/images/testProfile.jpg" alt="" class="avatar-photo">
								<%-- <img src="${pageContext.request.contextPath}/resources/images/testHuman.jpg" alt="user" class="rounded-circle" width="40" height="40"> --%>
								<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="modal-body pd-5">
												<div class="img-container">
													<img id="image" src="vendors/images/photo2.jpg" alt="Picture">
												</div>
											</div>
											<div class="modal-footer">
												<input type="submit" value="Update" class="btn btn-primary">
												<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<h5 class="text-center h5 mb-0">${employee.empName}</h5>
							<p class="text-center text-muted font-14">${employee.empRank} <c:if test="${employee.teamName != '미배정'}"> | ${employee.teamName}</p></c:if>
							<div class="profile-info">
								<h5 class="mb-20 h5 text-blue">사원 정보</h5>
								<ul>
									<li class="mb-1">
										<span>이메일:</span>
										${employee.empEmail}
									</li>
									<li class="mb-1">
										<span>연락처:</span>
										${employee.empTel}
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-xl-8 col-lg-8 col-md-8 col-sm-12 mb-30">
						<div class="card height-100-p overflow-hidden">
							<div class="profile-tab height-100-p">
								<div class="tab height-100-p">
									<div class="tab-content">
										<!-- Setting Tab start -->
										<div class="tab-pane fade height-100-p active show" id="setting" role="tabpanel">
											<div class="profile-setting">
												<form id="updatePasswordForm" onsubmit="submitUpdatePasswordForm()">
													<ul class="profile-edit-list">
														<li class="weight-500">
															<h4 class="text-blue h5 mb-20" style="margin-bottom: 34px;">비밀번호 변경</h4>
															<div class="form-group">
																<label>현재 비밀번호</label>
																<input id="currentPasswordCheck" class="form-control form-control" type="password" placeholder="**********">
															</div>
															<div class="form-group">
																<label>새 비밀번호</label>
																<input id="newPassword" class="form-control form-control" type="password" placeholder="영문,숫자  7자리~20자리" onkeyup="writeNewPassword(this)">
																<span id="newPasswordInval" class="mt-2 pl-1 d-none" style="font-size: small; color: #E53935;"></span>
															</div>
															<div class="form-group">
																<label>비밀번호 확인</label>
																<input id="newPasswordCheck" class="form-control form-control" type="password" onkeyup="writeNewPasswordCheck()">
																<span id="newPasswordCheckInval" class="mt-2 pl-1 d-none" style="font-size: small; color: #E53935;"></span>
															</div>
															<div class="form-group mb-0 mt-5">
																<input id="submitInput" type="submit" class="btn btn-primary" value="변경" disabled>
															</div>
														</li>
													</ul>
												</form>
											</div>
										</div>
										<!-- Setting Tab End -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
            </div>
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        <!-- <div class="modal fade" id="passwordModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">비밀번호가 변경되었습니다.</h5>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                            	해당 팀를 삭제하시겠습니까?
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer" style="border-top: none;">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
                    </div>
                </div>
            </div>
   		</div> -->
        
        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright &copy; Designed & Developed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="${pageContext.request.contextPath}/resources/plugins/common/common.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/gleek.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/styleSwitcher.js"></script>

    
    <script src="${pageContext.request.contextPath}/resources/plugins/jqueryui/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/moment/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/fullcalendar/js/fullcalendar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins-init/fullcalendar-init.js"></script>

</body>

</html>