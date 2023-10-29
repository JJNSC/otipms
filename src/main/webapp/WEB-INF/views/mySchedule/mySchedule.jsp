<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>otipms</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/plugins/fullcalendar/css/fullcalendar.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

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
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>개인 일정</h4>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="card-box m-b-50">
                                            <div id="calendar"></div>
                                        </div>
                                    </div>
									<div class="col-lg-4 mt-5">
                                        <a href="#" data-toggle="modal" data-target="#add-category" class="btn btn-primary btn-block"><i class="ti-plus f-s-12 m-r-5"></i> 일정 추가</a>
                                        <div id="external-events" class="m-t-20">
                                            <p>Drag and drop your event or click in the calendar</p>
                                            <div class="external-event bg-primary text-white" data-class="bg-primary"><i class="fa fa-move"></i>New Theme Release</div>
                                            <div class="external-event bg-success text-white" data-class="bg-success"><i class="fa fa-move"></i>My Event</div>
                                            <div class="external-event bg-warning text-white" data-class="bg-warning"><i class="fa fa-move"></i>Meet manager</div>
                                            <div class="external-event bg-dark text-white" data-class="bg-dark"><i class="fa fa-move"></i>Create New theme</div>
                                        </div>
                                        <!-- checkbox -->
                                        <div class="checkbox m-t-40">
                                            <input id="drop-remove" type="checkbox">
                                            <label for="drop-remove">&nbsp; 드롭 후 제거</label>
                                        </div>
                                    </div>
                                    <!-- end col -->
                                    <!-- BEGIN MODAL -->
                                    <div class="modal fade none-border" id="event-modal">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title"><strong>일정 수정/추가</strong></h4>
                                                </div>
                                                <div class="mx-3" style="padding-top: 1rem;">
                                                	<form>
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label class="control-label">일정 이름</label>
                                                                <input class="form-control form-white" value="ㅇㅅㅇ 회의" type="text" name="category-name">
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label class="control-label">일정 상세</label>
                                                                <input class="form-control form-white" value="토즈모임센터 서울대입구역에서 9시 회의" type="text" name="category-name">
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label class="control-label">사용자 추가</label>
                                                                <input class="form-control form-white" value="김종진 대리" type="text" name="category-name">
                                                            </div>
                                                        </div>
                                                        <!-- <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label for="example-datetime-local-input" class="control-label">시작일</label>
                                                                <input class="form-control form-white" value="2023-10-25" type="date" name="category-name" readonly>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label for="example-datetime-local-input" class="control-label">종료일</label>
                                                                <input class="form-control form-white dateSelectable" data-placeholder="날짜 선택하세욧!" required aria-required="true" type="date" name="category-name">
                                                            </div>
                                                        </div> -->
                                                        <div class="row mb-3">
                                                        	<div class="col-md-12">
                                                                <label class="control-label">시작일 - 종료일</label>
							                                	<%-- <%
															    	// Java 코드를 사용하여 내일 날짜를 가져옴
															        java.time.LocalDate today = java.time.LocalDate.now();
															        java.time.LocalDate tomorrow = today.plusDays(1);
															        
															        // 원하는 형식으로 날짜를 포맷팅 (예: "yyyy-MM-dd")
															        java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("MM/dd/yyyy");
															        String formattedDate = today.format(formatter);
															        String formattedTomorrow = tomorrow.format(formatter);
															    %> --%>
			                                            		<input class="form-control input-daterange-datepicker" type="text" name="projectDate" value="${formattedDate}-${formattedTomorrow}">	
                                                            </div>
				                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label class="control-label">색상</label>
                                                                <select class="form-control form-white" data-placeholder="표시 색상을 고르세여" name="category-color">
                                                                    <option value="red">Red</option>
                                                                    <option value="orange">Orange</option>
                                                                    <option value="yellow">Yellow</option>
                                                                    <option value="lightGreen">Light Green</option>
                                                                    <option value="green">Green</option>
                                                                    <option value="lightBlue">Light Blue</option>
                                                                    <option value="blue">Blue</option>
                                                                    <option value="purple">Purple</option>
                                                                    <option value="pink">Pink</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-success save-event waves-effect waves-light">Create event</button>
                                                    <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">Delete</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Modal Add Category -->
                                    <div class="modal fade none-border" id="add-category">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title"><strong>일정 추가</strong></h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form>
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label class="control-label">일정 이름</label>
                                                                <input class="form-control form-white" value="ㅇㅅㅇ 회의" type="text" name="category-name">
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label class="control-label">일정 상세</label>
                                                                <input class="form-control form-white" value="토즈모임센터 서울대입구역에서 9시 회의" type="text" name="category-name">
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label class="control-label">사용자 추가</label>
                                                                <input class="form-control form-white" value="김종진 대리" type="text" name="category-name">
                                                            </div>
                                                        </div>
                                                        <!-- <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label for="example-datetime-local-input" class="control-label">시작일</label>
                                                                <input class="form-control form-white" value="2023-10-25" type="date" name="category-name" readonly>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label for="example-datetime-local-input" class="control-label">종료일</label>
                                                                <input class="form-control form-white dateSelectable" data-placeholder="날짜 선택하세욧!" required aria-required="true" type="date" name="category-name">
                                                            </div>
                                                        </div> -->
                                                        <div class="row mb-3">
                                                        	<div class="col-md-12">
                                                                <label class="control-label">시작일 - 종료일</label>
							                                	<%
															    	// Java 코드를 사용하여 내일 날짜를 가져옴
															        java.time.LocalDate today = java.time.LocalDate.now();
															        java.time.LocalDate tomorrow = today.plusDays(1);
															        
															        // 원하는 형식으로 날짜를 포맷팅 (예: "yyyy-MM-dd")
															        java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("MM/dd/yyyy");
															        String formattedDate = today.format(formatter);
															        String formattedTomorrow = tomorrow.format(formatter);
															    %>
			                                            		<input class="form-control input-daterange-datepicker" type="text" name="projectDate" value="${formattedDate}-${formattedTomorrow}">	
                                                            </div>
				                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label class="control-label">색상</label>
                                                                <select class="form-control form-white" data-placeholder="표시 색상을 고르세여" name="category-color">
                                                                    <option value="red">Red</option>
                                                                    <option value="orange">Orange</option>
                                                                    <option value="yellow">Yellow</option>
                                                                    <option value="lightGreen">Light Green</option>
                                                                    <option value="green">Green</option>
                                                                    <option value="lightBlue">Light Blue</option>
                                                                    <option value="blue">Blue</option>
                                                                    <option value="purple">Purple</option>
                                                                    <option value="pink">Pink</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">취소</button>
                                                    <button type="button" class="btn btn-danger waves-effect waves-light save-category" data-dismiss="modal">저장</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- END MODAL -->
                                </div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
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

    
    <script src="${pageContext.request.contextPath}/resources/plugins/jqueryui/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/moment/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/fullcalendar/js/fullcalendar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins-init/fullcalendar-init.js"></script>
    
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
    
    <script>
		document.querySelector('.fc-view.fc-month-view.fc-basic-view').style.overflowY='hidden';
		$(".applyBtn").html("확인");
		$(".cancelBtn").html("취소");
    </script>

</body>

</html>