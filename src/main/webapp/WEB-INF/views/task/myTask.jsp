<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="${pageContext.request.contextPath}/resources/css/customStyle.css" rel="stylesheet">
    
    <script src="${pageContext.request.contextPath}/resources/js/task/task.js"></script>
    
    <style type="text/css">
    	/* 일정 달력 */
		a.fc-day-grid-event.fc-h-event.fc-event.fc-start.fc-end.bg-custom.fc-draggable {
		    background-color: #2f588b !important;
		}
		a.fc-day-grid-event.fc-h-event.fc-event.fc-start.fc-end.bg-red.fc-draggable {
		    background-color: #ffcfd2 !important;
		}
		a.fc-day-grid-event.fc-h-event.fc-event.fc-start.fc-end.bg-orange.fc-draggable {
		    background-color: #fde4cf !important;
		}
		a.fc-day-grid-event.fc-h-event.fc-event.fc-start.fc-end.bg-yellow.fc-draggable {
		    background-color: #fbf8cc !important;
		}
		a.fc-day-grid-event.fc-h-event.fc-event.fc-start.fc-end.bg-lightGreen.fc-draggable {
		    background-color: #b9fbc0 !important;
		}
		a.fc-day-grid-event.fc-h-event.fc-event.fc-start.fc-end.bg-green.fc-draggable {
		    background-color: #98f5e1 !important;
		}
		a.fc-day-grid-event.fc-h-event.fc-event.fc-start.fc-end.bg-lightBlue.fc-draggable {
		    background-color: #8eecf5 !important;
		}
		a.fc-day-grid-event.fc-h-event.fc-event.fc-start.fc-end.bg-blue.fc-draggable {
		    background-color: #90dbf4 !important;
		}
		a.fc-day-grid-event.fc-h-event.fc-event.fc-start.fc-end.bg-purple.fc-draggable {
		    background-color: #cfbaf0 !important;
		}
		a.fc-day-grid-event.fc-h-event.fc-event.fc-start.fc-end.bg-pink.fc-draggable {
		    background-color: #f1c0e8 !important;
		}
		a.fc-day-grid-event.fc-h-event.fc-event.fc-start.fc-end.fc-draggable {
			color: #76838f;
		}
		/* 수직 스크롤바 숨김 */
		::-webkit-scrollbar {
		    width: 0;
		}
    </style>

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
            		<div class="col-lg-7 pr-0">
            			<div class="card">
            				<div class="card-body">
            					<div class="row">
            						<div class="col-lg-12">
            							<div class="card-box m-b-50">
                                            <div id="calendar"></div>
                                        </div>
            						</div>
            					</div>
            				</div>
            			</div>
            		</div>
            		<div class="col-lg-5">
            			<div class="card">
            				<div class="card-body">
            					<div class="card-title">
                                    <h4 style="font-weight: bolder;">개인 업무 관리</h4>
                                </div>
                                <div class="row">
                                	<div class="col-lg-12">
                                		<table class="table table-hover taskTable">
	                                        <tbody id="taskListTableBody">
	                                            <tr>
	                                                <td><div class="taskEvent-red mb-1" style="position: relative;">${project.projectName}</div></td>
	                                                <td class="text-success">진행중</td>
	                                                <td><button class="btn btn-sm btn-detail" data-toggle="modal" data-target="#taskDetail" onclick="openProjectDetail()">상세</button></td>
	                                            </tr>
	                                            
	                                            <c:forEach var="task" items="${taskList}">
		                                            <tr>
		                                                <td><div class="taskEvent-${task.taskColor} mb-1" style="position: relative;">${task.taskName}</div></td>
		                                                <c:if test="${task.taskStatus == '진행전'}">
			                                                <td class="text-light">${task.taskStatus}</td>
		                                                </c:if>
		                                                <c:if test="${task.taskStatus == '진행중'}">
			                                                <td class="text-success">${task.taskStatus}</td>
		                                                </c:if>
		                                                <c:if test="${task.taskStatus == '진행완료'}">
			                                                <td class="text-danger">${task.taskStatus}</td>
		                                                </c:if>
		                                                <td>
		                                                	<input id="taskNoFromModel" type="hidden" value="${task.taskNo}">
		                                                	<button class="btn btn-sm btn-detail" data-toggle="modal" data-target="#taskDetail" onclick="openTaskDetail(this)">상세</button>
		                                                </td>
		                                            </tr>
	                                            </c:forEach>
	                                        </tbody>
	                                    </table>
                                	</div>
                                </div>
            				</div>
            			</div>
            		</div>
            	</div>
                    <!-- /# column -->
            </div>
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        <div class="modal fade none-border" id="taskDetail">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h4 class="modal-title"><strong>업무 상세</strong></h4>
	                </div>
	                <div class="modal-body">
	                    <form>
	                        <div class="row mb-3">
	                            <div class="col-md-12">
	                                <label id="taskNoLabel" class="control-label">업무 번호 (히든 처리할 예정)</label>
	                                <input id="taskNoInput" class="form-control form-white" value="" type="text" name="category-name" readonly>
	                                <input id="projectNoInput" class="form-control form-white" type="text" value="${project.projectNo}" readonly>
	                            </div>
	                        </div>
	                        <div class="row mb-3">
	                            <div class="col-md-12">
	                                <label id="taskNameLabel" class="control-label">업무 이름</label>
	                                <input id="taskNameInput" class="form-control form-white" type="text" name="category-name" readonly>
	                            </div>
	                        </div>
	                        <div class="row mb-3">
	                            <div class="col-md-12">
	                                <label id="taskCommentLabel" class="control-label">업무 개요</label>
	                                <textarea id="taskCommentInput" class="form-control form-white" name="category-name"></textarea>
	                            </div>
	                        </div>
	                        <div class="row mb-3">
	                            <div class="col-md-12">
	                                <label class="control-label">담당자</label>
	                                <input id="taskEmpInput" class="form-control form-white" type="text" name="category-name" readonly>
	                            </div>
	                        </div>
	                        <%-- <div class="row mb-3">
	                                         <div class="col-md-12">
	                                             <label for="example-datetime-local-input" class="control-label">기간</label>
	                                             <%
	    // Java 코드를 사용하여 내일 날짜를 가져옴
	    java.time.LocalDate today = java.time.LocalDate.now();
	    java.time.LocalDate tomorrow = today.plusDays(1);
	    
	    // 원하는 형식으로 날짜를 포맷팅 (예: "yyyy-MM-dd")
	    java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("MM/dd/yyyy");
	    String formattedDate = today.format(formatter);
	    String formattedTomorrow = tomorrow.format(formatter);
	%>
	                             	<input id="taskDateInput" class="form-control input-daterange-datepicker" type="text" name="projectDate" value="${formattedDate}-${formattedTomorrow}">
	                                         	<input id="taskDateInput" class="form-control input-daterange-datepicker" type="text" name="taskDate">
	                                         	<input id="projectDateInput" class="form-control input-daterange-datepicker" type="text" name="projectDate" readonly>
	                                         </div>
	                                     </div> --%>
	                        <div class="row mb-3">
	             <div class="col-md-12">
	                 <label for="example-datetime-local-input" class="control-label">시작일</label>
	                 <input id="taskStartDateInput" class="form-control form-white" type="date" id="startDate" name="startDate">
	             </div>
	         </div>
	         <div class="row mb-3">
	             <div class="col-md-12">
	                 <label for="example-datetime-local-input" class="control-label">종료일</label>
	                 <input id="taskEndDateInput" class="form-control form-white" type="date" id="endDate" name="endDate">
	             </div>
	         </div>
	         
	                        <!-- <div class="row mb-3">
	                            <div class="col-md-12">
	                                <label for="example-datetime-local-input" class="control-label">시작일</label>
	                                <input id="taskStartDateInput" class="form-control form-white dateSelectable" required aria-required="true" type="date" name="category-name">
	                            </div>
	                        </div>
	                        <div class="row mb-3">
	                            <div class="col-md-12">
	                                <label for="example-datetime-local-input" class="control-label">종료일</label>
	                                <input id="taskEndDateInput" class="form-control form-white dateSelectable" required aria-required="true" type="date" name="category-name">
	                            </div>
	                        </div> -->
	                        <div id="taskDetailForm-client" class="row mb-3 d-none">
	                            <div class="col-md-12">
	                                <label id="taskClientLabel" for="example-datetime-local-input" class="control-label">고객명</label>
	                                <input id="taskClientInput" class="form-control form-white" type="text" name="category-name" readonly>
	                            </div>
	                        </div>
	                        <div class="row mb-3">
	                            <div class="col-md-12">
	                                <label class="control-label">작업 상태</label>
	                                <select id="taskStatusSelect" class="form-control form-white" name="category-status">
	                                    <option value="진행전">진행전</option>
	                                    <option value="진행중">진행중</option>
	                                    <option value="진행완료">진행완료</option>
	                                </select>
	                            </div>
	                        </div>
	                        <div id="taskDetailForm-color" class="row mb-3">
	                            <div class="col-md-12">
	                                <label class="control-label">색상</label>
	                                <select id="taskColorSelect" class="form-control form-white" data-placeholder="표시 색상을 고르세여" name="category-color">
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
	                    <button id="closeMoalBtn" type="button" class="btn btn-default waves-effect" data-dismiss="modal">닫기</button>
	                    <button id="updateMoalBtn" type="button" class="btn btn-danger waves-effect waves-light save-category" data-dismiss="modal" onclick="updateTaskDetail()">수정</button>
	                </div>
	            </div>
	        </div>
	    </div>
        
        
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
    <%-- <script src="${pageContext.request.contextPath}/resources/js/plugins-init/fullcalendar-init.js"></script> --%>
    <script src="${pageContext.request.contextPath}/resources/js/plugins-init/fullcalendar-init-task.js"></script>
        
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
    
    <script src="${pageContext.request.contextPath}/resources/js/task/task.js"></script>
    
    <script>
		document.querySelector('.fc-view.fc-month-view.fc-basic-view').style.overflowY='hidden';
    </script>

</body>

</html>