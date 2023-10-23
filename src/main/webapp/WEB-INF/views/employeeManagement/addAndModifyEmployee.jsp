<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>막내온탑 >v<</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

	<style>
		.select2-container--default .select2-selection--single .select2-selection__rendered {
		    line-height: 32px;
		}
		.select2-container--default .select2-selection--single .select2-selection__rendered {
		    color: #444;
		    line-height: 28px;
		}
		.select2-container .select2-selection--single .select2-selection__rendered {
		    display: block;
		    padding-left: 8px;
		    padding-right: 20px;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: nowrap;
		}
	</style>
</head>

<body>

    <%@include file="/WEB-INF/views/headernsidebar.jsp" %>

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <!-- <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                    </ol>
                </div>
            </div> -->
            <!-- row -->
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                            <h4 class="card-title"><b>인력 등록</b></h4>
                                <div class="form-validation">
                                    <form class="form-valide" action="#" method="post">
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label" for="val-username">이름
                                            </label>
                                            <div class="col-lg-4">
                                                <input type="text" class="form-control" id="val-username" name="val-username" placeholder="Enter a username..">
                                            </div>
                                        </div>
                                        <div class="form-group row">
	                                        <label class="col-lg-2 col-form-label" for="positionSelect">직책</label>
	                                        <div class="col-lg-4">
	                                            <select class="form-control" id="positionSelect" name="positionSelect">
	                                                <option value="">직책 선택</option>
	                                                <option value="html">사원</option>
	                                                <option value="css">선임</option>
	                                                <option value="javascript">대리</option>
	                                                <option value="angular">과장</option>
	                                                <option value="angular">차장</option>
	                                                <option value="angular">부장</option>
	                                                <option value="angular">이사</option>
	                                                <option value="angular">상무</option>
	                                                <option value="angular">사장</option>
	                                                <option value="angular">고객</option>
	                                            </select>
	                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label" for="phoneNumber">연락처 
                                            </label>
                                            <div class="col-lg-4">
                                                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="010-xxxx-xxxx">
                                            </div>
                                        </div>
                                        <div class="form-group row">
	                                        <label class="col-lg-2 col-form-label" for="projectSelect">프로젝트 </label>
	                                        <div class="col-lg-4">
	                                            <select class="form-control" id="projectSelect" name="projectSelect">
	                                                <option value="">프로젝트 선택</option>
	                                                <option value="html">PMS 제작 프로젝트</option>
	                                                <option value="css">프로젝트 2번째</option>
	                                                <option value="javascript">본격 취업 프로젝트</option>
	                                                <option value="angular">임시 프로젝트</option>
	                                            </select>
	                                        </div>
                                        </div>
                                        <div class="form-group row">
	                                        <label class="col-lg-2 col-form-label" for="teamSelect">팀</label>
	                                        <div class="col-lg-4">
	                                            <select class="form-control" id="projectSelect" name="projectSelect">
	                                                <option value="">팀 선택</option>
	                                                <option value="html">기획 1팀</option>
	                                                <option value="css">기획 2팀</option>
	                                                <option value="javascript">개발 1팀</option>
	                                                <option value="javascript">개발 2팀</option>
	                                                <option value="javascript">개발 3팀</option>
	                                                <option value="angular">QA 1팀</option>
	                                                <option value="angular">QA 2팀</option>
	                                                <option value="angular">고객</option>
	                                            </select>
	                                        </div>
                                        </div>
                                        <div class="form-group row">
	                                        <label class="col-lg-2 col-form-label" for="authoritySelect">권한</label>
	                                        <div class="col-lg-4">
	                                            <select class="form-control" id="projectSelect" name="projectSelect">
	                                                <option value="">권한 선택</option>
	                                                <option value="html">팀원</option>
	                                                <option value="css">팀장</option>
	                                                <option value="css">PM</option>
	                                                <option value="javascript">관리자</option>
	                                                <option value="angular">고객사</option>
	                                            </select>
	                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-lg-8 ">
                                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalGrid">등록</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="modalGrid">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">인력 등록</h5>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div class="row">
                                	등록 되었습니다.
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
                        </div>
                    </div>
                </div>
       		</div>
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
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
    
    
    <script src="${pageContext.request.contextPath}/resources/plugins/moment/moment.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
    <!-- Clock Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/plugins/clockpicker/dist/jquery-clockpicker.min.js"></script>
    <!-- Color Picker Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/plugins/jquery-asColorPicker-master/libs/jquery-asColor.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/jquery-asColorPicker-master/libs/jquery-asGradient.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"></script>
    <!-- Date Picker Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <!-- Date range Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/plugins/timepicker/bootstrap-timepicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/js/plugins-init/form-pickers-init.js"></script>

</body>

</html>