<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>OTIPMS</title>
    <!-- Favicon icon -->
    <%-- <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png"> --%>
    <link rel="icon" type="image/jpeg" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/otipmsFavicon.png">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/plugins/fullcalendar/css/fullcalendar.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mySchedule/myScheduleCustom.css" rel="stylesheet">
    
    <script src="${pageContext.request.contextPath}/resources/js/profile/profile.js"></script>

</head>

<body>
	<jsp:include page="../headernsidebar.jsp">
      <jsp:param name="employee" value="${employee}" />
      <jsp:param name="mf" value="${mf}" />
      <jsp:param name="base64Img" value="${base64Img}" />
   </jsp:include>
        <!--**********************************
            Content body start
        ***********************************-->
        <!-- <div class="content-body"> -->
        <div style="height:810px; margin-left: 15.1875rem; margin-top:100px;">

            <!-- <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                    </ol>
                </div>
            </div> -->
            <!-- row -->
            <!-- <div class="container-fluid"> -->
            <div style="width:100%;padding-right:15px;padding-left:15px;margin-left:auto;margin-right:auto;margin-top:1rem;height:810px;">
                <div class="row">
					<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 mb-30" style="padding-right: 0px;">
						<div class="card" style="padding:20px; padding-bottom:0px;">
							<h4 class="text-blue h5 mb-20" style="margin-bottom: 34px; font-weight: bolder;">내 정보</h4>
							<div class="profile-photo">
								<input class="d-none" type="file" id="imageInput" accept="image/*" onchange="changeProfile()">
								<!-- <a href="modal" data-toggle="modal" data-target="#modal" class="edit-avatar"><i class="fa fa-pencil"></i></a> -->
								<span class="edit-avatar" onclick="uploadImage()"><i class="fa fa-pencil"></i></span>
								<c:if test="${profileEmployee.mediaFileData != null}">
									<img id="profileImage" src="data:${profileEmployee.mediaFileData};base64, ${base64Img}" alt="" class="avatar-photo" width="160px" height="160px"/>
								</c:if>
								<%-- <c:if test="${employee.mediaFileData == null}">
									<img id="profileImage" src="${pageContext.request.contextPath}/resources/images/defaultHuman.jpg" alt="" class="avatar-photo" width="160px" height="160px">
								</c:if> --%>
								<%-- <img id="profileImage" src="${pageContext.request.contextPath}/resources/images/testProfile.jpg" alt="" class="avatar-photo" width="160px" height="160px"> --%>
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
							<h5 class="text-center h5 mb-0">${profileEmployee.empName}</h5>
							<p class="text-center text-muted font-14">${profileEmployee.empRank} <c:if test="${profileEmployee.teamName != '미배정'}"> | ${profileEmployee.teamName}</c:if></p>
							<div class="profile-info">
								<!-- <h5 class="mb-20 h5 text-blue">사원 정보</h5> -->
								<ul>
									<li class="mb-1">
										<div style="display:inline-block; width:80px;">이름</div>
										${profileEmployee.empName}
									</li>
									<li class="mb-1">
										<div style="display:inline-block; width:80px;">직급</div>
										${profileEmployee.empRank}
									</li>
									<li class="mb-1">
										<div style="display:inline-block; width:80px;">이메일</div>
										${profileEmployee.empEmail}
									</li>
									<li class="mb-1">
										<div style="display:inline-block; width:80px;">연락처</div>
										${profileEmployee.empTel}
									</li>
									<c:if test="${profileEmployee.projectName != null}">
										<li class="mb-1">
											<div style="display:inline-block; width:80px;">프로젝트</div>
											${profileEmployee.projectName}
										</li>
									</c:if>
									<c:if test="${profileEmployee.teamName != null}">
										<li class="mb-1">
											<div style="display:inline-block; width:80px;">팀</div>
											${profileEmployee.teamName}
										</li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-xl-8 col-lg-8 col-md-8 col-sm-12 mb-30">
						<div class="card height-100-p overflow-hidden" style="height:33.3em">
							<div class="profile-tab height-100-p">
								<div class="tab height-100-p">
									<div class="tab-content">
										<!-- Setting Tab start -->
										<div class="tab-pane fade height-100-p active show" id="setting" role="tabpanel">
											<div class="profile-setting">
												<form id="updatePasswordForm" onsubmit="submitUpdatePasswordForm()">
													<ul class="profile-edit-list">
														<li class="weight-500">
															<h4 class="text-blue h5 mb-20" style="margin-bottom: 34px; font-weight: bolder;">비밀번호 변경</h4>
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
            <!-- <div class="copyright">
                <p>Copyright &copy; Designed & Developed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018</p>
            </div> -->
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