<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

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
    <link href="${pageContext.request.contextPath}/resources/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mySchedule/myScheduleCustom.css" rel="stylesheet">
    
    <script src="${pageContext.request.contextPath}/resources/js/mySchedule/mySchedule.js"></script>
    
    <style type="text/css">
    	.nk-sidebar{
			 height : 96%;
		}
		.tdl-holder label {
		    padding-left: 0;
		}
		
		/* 수직 스크롤바 숨김 */
		::-webkit-scrollbar {
		    width: 0;
		}
		
		/* 수평 스크롤바 숨김 */
		::-webkit-scrollbar-thumb {
		    background: transparent;
		}
		
    </style>
    
    <script type="text/javascript">
    </script>

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
                    <div class="col-lg-7" style="padding-right: 0px;">
                        <div class="card">
                            <div class="card-body">
                                <!-- <div class="card-title">
                                    <h4>개인 일정</h4>
                                </div> -->
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="card-box m-b-50">
                                            <div id="calendar"></div>
                                        </div>
                                    </div>
                                    <!-- BEGIN MODAL -->
                                    <%-- <div class="modal fade none-border" id="event-modal">
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
                                                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-success save-event waves-effect waves-light">Create event</button>
                                                    <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">Delete</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div> --%>
                                    <!-- Modal Add Category -->
                                    <div class="modal fade none-border" id="add-category">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title"><strong>일정 추가</strong></h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form>
                                                        <div class="row mb-3 d-none">
                                                            <div class="col-md-12">
                                                                <label class="control-label">일정 번호 (히든 처리할 예정)</label>
                                                                <input id="scheduleNoInput" class="form-control form-white" type="text" name="category-name">
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label class="control-label">일정 이름</label>
                                                                <input id="scheduleNameInput" class="form-control form-white" type="text" name="category-name">
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label class="control-label">일정 상세</label>
                                                                <input id="scheduleCommentInput" class="form-control form-white" type="text" name="category-name">
                                                            </div>
                                                        </div>
                                                        <!-- <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label class="control-label">사용자 추가</label>
                                                                <input class="form-control form-white" value="김종진 대리" type="text" name="category-name">
                                                            </div>
                                                        </div> -->
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label for="example-datetime-local-input" class="control-label">시작일</label>
                                                                <input id="scheduleStartDateInput" class="form-control form-white" type="datetime-local" name="category-name">
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label for="example-datetime-local-input" class="control-label">종료일</label>
                                                                <input id="scheduleEndDateInput" class="form-control form-white" type="datetime-local" name="category-name">
                                                            </div>
                                                        </div>
                                                        <%-- <div class="row mb-3">
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
				                                        </div> --%>
                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <label class="control-label">색상</label>
                                                                <select id="scheduleColorSelect" class="form-control form-white" name="category-color">
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
                                                    <button id="addBtn" type="button" class="btn btn-primary waves-effect waves-light save-category" data-dismiss="modal" onclick="createSchedule()">저장</button>
                                                    <button id="updateBtn" type="button" class="btn btn-primary waves-effect waves-light save-category d-none" data-dismiss="modal" onclick="updateSchedule()">수정</button>
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
                    <div class="col-lg-5">
                        <div class="card" style="height: 49.7rem; z-index: 0;">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4 style="font-weight: bolder;">개인 일정</h4>
                                </div>
                                <div class="row">
                                	<div class="col-lg-12">
                                        <a href="#" data-toggle="modal" data-target="#add-category" class="btn btn-primary btn-block" onclick="addScheduleBtn()"><i class="ti-plus f-s-12 m-r-5"></i> 일정 추가</a>
                                        <script type="text/javascript">
                                        	function addScheduleBtn() {
                                        		$("#scheduleNameInput").val('');
                                        		$("#scheduleCommentInput").val('');
                                        		$("#scheduleStartDateInput").val('');
                                        		$("#scheduleEndDateInput").val('');
                                        		$("#scheduleColorSelect").val('red');
                                        		
                                        		$("#addBtn").removeClass("d-none");
                                        		$("#updateBtn").addClass("d-none");
                                        	}
                                        </script>
                                        <div class="tdl-holder-custom m-t-20">
                                            <!-- <p>Drag and drop your event or click in the calendar</p> -->
                                            <ul id="todo_list" style="height: 661px; overflow: scroll; width: auto; margin-top: 20px;">
                                            	<c:forEach var="schedule" items="${scheduleList}">
						                            <li>
						                            	<strong class="labelCustom">
						                            		<label>
						                            			<c:if test="${schedule.scheduleChecked == true}">
							                            			<input type="checkbox" checked value="${schedule.scheduleNo}" onchange="applyStyle(this)">
						                            			</c:if>
						                            			<c:if test="${schedule.scheduleChecked == false}">
							                            			<input type="checkbox" value="${schedule.scheduleNo}" onchange="applyStyle(this)">
						                            			</c:if>
						                            			<i></i>
						                            		</label>
						                            		<c:if test="${schedule.scheduleChecked == true}">
						                            			<span onclick="openScheduleDetail(this)" data-toggle="modal" data-target="#add-category" style="text-decoration: line-through;">
						                            				${schedule.scheduleName}
						                            			</span>
					                            			</c:if>
					                            			<c:if test="${schedule.scheduleChecked == false}">
						                            			<span onclick="openScheduleDetail(this)" data-toggle="modal" data-target="#add-category">
						                            				${schedule.scheduleName}
						                            			</span>
					                            			</c:if>
						                            		<c:set var="now" value="<%= new java.util.Date() %>" />
					                            			<c:choose>
						                            			<c:when test="${fn:substring(schedule.scheduleStartDate, 0, 10) == fn:substring(now, 0, 10) and fn:substring(schedule.scheduleEndDate, 0, 10) == fn:substring(now, 0, 10)}">
							                            			<em style="position: absolute; right: 60px; font-style: normal; font-weight: normal;">
							                            				<fmt:formatDate value="${schedule.scheduleStartDate}" pattern="HH시"/> 
							                            				-
							                            				<fmt:formatDate value="${schedule.scheduleEndDate}" pattern="HH시"/> 
							                            			</em>
						                            			</c:when>
															    <c:otherwise>
							                            			<em style="position: absolute; right: 60px; font-style: normal; font-weight: normal;">
							                            				<fmt:formatDate value="${schedule.scheduleStartDate}" pattern="MM/dd"/> 
							                            				-
							                            				<fmt:formatDate value="${schedule.scheduleEndDate}" pattern="MM/dd"/> 
							                            			</em>
							                            		</c:otherwise>
															</c:choose>
						                            		<%-- <span onclick="openScheduleDetail(this)" data-toggle="modal" data-target="#add-category">${schedule.scheduleName}</span> --%>
						                            		<a role="button" class="ti-trash" onclick="deleteSchedule(this)"></a>
						                            	</strong>
						                            </li>
                                            	</c:forEach>
					                            <!-- <li><strong class="labelCustom"><label><input type="checkbox" onchange="applyStyle(this)"><i></i></label><span>Get up</span><a href="#" class="ti-trash"></a></strong></li> -->
					                        </ul>
                                            <!-- <div class="external-event bg-primary text-white" data-class="bg-primary"><i class="fa fa-move"></i>New Theme Release</div>
                                            <div class="external-event bg-success text-white" data-class="bg-success"><i class="fa fa-move"></i>My Event</div>
                                            <div class="external-event bg-warning text-white" data-class="bg-warning"><i class="fa fa-move"></i>Meet manager</div>
                                            <div class="external-event bg-dark text-white" data-class="bg-dark"><i class="fa fa-move"></i>Create New theme</div> -->
                                            <script>
										        function applyStyle(checkbox) {
										            var span = checkbox.parentElement.parentElement.querySelector("span");
										            if (checkbox.checked) {
										                span.style.textDecoration = "line-through";
										            } else {
										                span.style.textDecoration = "none";
										            }
										            
										            checkSchedule(checkbox.checked, checkbox.value);
										        }
										        function openScheduleDetail(span) {
										        	var checkbox = span.parentElement.querySelector("input");
										        	console.log("span: " + checkbox.value);
										        	var scheduleNo = checkbox.value;
										        	
										        	openDetailModal(scheduleNo);
										        	//$("#add-category").show();
										        }
										        function openDetail(strong) {
										        	var value = $(strong).find("input").val();
										        	console.log("strong: " + value)
										        }
										    </script>
                                        </div>
                                    </div>
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