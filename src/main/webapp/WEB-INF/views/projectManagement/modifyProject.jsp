<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                	<h4 class="card-title"><b>프로젝트 등록</b></h4>
                                <div class="basic-form">
                                    <form action="${pageContext.request.contextPath}/projectManagement/addProject" method="post">
                                        <div class="form-row">
	                                        <div class="form-group col-md-6">
	                                            <label>프로젝트 명</label>
                                	 			<input type="text" class="form-control" name="projectName" placeholder="프로젝트 명 입력">
	                                        </div>
                                            <div class="form-group col-md-6">
                                                 <div class="col-md-6">
			                                        <div class="example">
			                                            <label>프로젝트 기간</label>
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
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label>담당자 (PM)</label> <!-- 추후 과장 이상만 나오게끔 필터링해보자 -->
                                                <label class="sr-only">담당자 검색</label>
                                                <div class="input-group mb-2">
                                                    <div class="input-group-prepend">
                                                        <div class="input-group-text">
                                                        	<button type="button" class="btn" style="padding:0px; background-color: #e9ecef;" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"><i class="icon-copy fa fa-search" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                    <c:if test="${project.projectNo !=0 }">
		                                	 			<input type="hidden" class="form-control" name="ProjectManagerId" value="${pmInfo.empId }">
                                                    	<input type="text" class="form-control" placeholder="${pmInfo.empName} ">
					                                </c:if>
					                            	<c:if test="${project.projectNo ==0 }">
					                                	<input type="hidden" class="form-control" name="ProjectManagerId" >
                                                    	<input type="text" class="form-control" placeholder="프로젝트 매니저">
					                                </c:if>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>프로젝트 개요</label>
                                            <c:if test="${project.projectNo !=0 }">
                                	 			<textarea class="form-control" id="projectOutLines" name="projectOutLines" rows="5" value="${project.projectContent }"></textarea>
                                	 			"?"
			                                </c:if>
			                            	<c:if test="${project.projectNo ==0 }">
			                                	<textarea class="form-control" id="projectOutLines" name="projectOutLines" rows="5" placeholder="프로젝트 개요를 입력해 주세요."></textarea>
			                                </c:if>
                                            
                                        </div>
                                        <div class="form-row">
	                                        <div class="form-group col-md-4">
	                                            <label>고객사 명 (company)</label>
	                                            <input type="text" class="form-control" name="customerCompany" placeholder="고객사 명 입력">
	                                        </div>
                                        </div>
                                        <div class="form-group col-md-4" style="padding-left:0px;">
                                            <label>고객 명 (Customer)</label> <!-- 추후 과장 이상만 나오게끔 필터링해보자 -->
                                            <label class="sr-only">고객사 검색</label>
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">
                                                    	<button type="button" class="btn" style="padding:0px; background-color: #e9ecef;" data-toggle="modal" data-target="#exampleModal2" data-whatever="@mdo"><i class="icon-copy fa fa-search" aria-hidden="true"></i></button>
                                                    </div>
                                                </div>
                                                <input type="hidden" class="form-control" name="customerId" >
                                                <input type="text" class="form-control"  placeholder="고객 명">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-3">
                                                <label>고객 연락처</label>
                                                <input type="text" class="form-control">
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label>고객 이메일</label>
                                                <input type="text" class="form-control">
                                            </div>
                                           
                                        </div>
                                        <div class="form-group">
                                            
                                        </div>
                                        <button type="submit" class="btn btn-dark">등록하기</button>
                                    </form>
                                </div>
                                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">담당자 검색</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <form>
                                                        <div class="form-group">
                                                            <label for="recipient-name" class="col-form-label">직급</label>
                                                            <select id="inputState" class="form-control">
			                                                    <option selected="selected">Choose...</option>
			                                                    <option>Option 1</option>
			                                                    <option>Option 2</option>
			                                                    <option>Option 3</option>
			                                                </select>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="message-text" class="col-form-label">직원 명</label>
                                                            <select id="inputState" class="form-control">
			                                                    <option selected="selected">Choose...</option>
			                                                    <option>Option 1</option>
			                                                    <option>Option 2</option>
			                                                    <option>Option 3</option>
			                                                </select>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                                    <button type="button" class="btn btn-primary">담당자 등록</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                     <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">고객사 검색</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <form>
                                                        <div class="form-group">
                                                            <label for="message-text" class="col-form-label">고객사 명</label>
                                                            <select id="inputState" class="form-control">
			                                                    <option selected="selected">Choose...</option>
			                                                    <option>Option 1</option>
			                                                    <option>Option 2</option>
			                                                    <option>Option 3</option>
			                                                </select>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                                    <button type="button" class="btn btn-primary">고객사 등록</button>
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