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
    <title>OTIPMS</title>
    <!-- Favicon icon -->
    <%-- <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png"> --%>
    <link rel="icon" type="image/jpeg" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/otipmsFavicon.png">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/js/project/selectPM.js"></script>
 	<script src="${pageContext.request.contextPath}/resources/js/project/selectClient.js"></script>
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
            <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                	<h4 class="card-title"><b>프로젝트 수정</b></h4>
                                <div class="basic-form">
                                    <form action="${pageContext.request.contextPath}/projectManagement/modifyProject" method="post">
                                    	<input class="d-none" name="projectNo" value="${projectInfo.projectNo }" ></input>
                                        <div class="form-row">
	                                        <div class="form-group col-md-3">
	                                            <label>프로젝트 명</label>
                                	 			<input type="text" class="form-control" name="projectName" value="${projectInfo.projectName}" placeholder="${projectInfo.projectName}" >
	                                        </div>
                                            <div class="form-group col-md-6">
                                                 <div class="col-md-4">
			                                        <div class="example">
			                                            <label>프로젝트 기간</label>
		                                            	<input class="form-control input-daterange-datepicker" type="text" name="projectDate" value="${startDate} - ${endDate}">	
			                                        </div>
			                                    </div>
                                            </div>
                                            <%-- <div class="form-group col-md-4">
                                                <label>담당자 (PM)</label> <!-- 추후 과장 이상만 나오게끔 필터링해보자 -->
                                                <label class="sr-only">담당자 검색</label>
                                                <div class="input-group mb-2">
                                                    <div class="text-left m-t-15">
			                                        <button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" 
			                                        		type="button" 
			                                        		onclick="javascript:void(window.open('findPM','_blank','width=600, height=600, left=600, top=30'))">
			                                        	<i class="fa fa-paper-plane m-r-5"></i>
			                                        	 담당자 검색
			                                        </button>
			                                        </div>
		                                	 			<input type="hidden" class="form-control" name="beforeProjectManagerId" value="${pmInfo.empId }">
		                                	 			<input type="hidden" class="form-control" id="PMid" name="ProjectManagerId" value="${pmInfo.empId }">
                                                    	<input type="text" class="form-control"style="background-color:transparent; border:0px;" id="PMINFO"placeholder="${pmInfo.empRank } ${pmInfo.empName} ">
                                                	</div>
                                                </div>
                                            </div> --%>
                                            <div class="form-group col-md-3"></div>
                                            <div class="form-group col-md-3">
                                                <label>담당자 (PM)</label> <!-- 추후 과장 이상만 나오게끔 필터링해보자 -->
                                                <label class="sr-only">담당자 검색</label>
                                                <div class="d-flex">
                                                	<input type="hidden" class="form-control" name="beforeProjectManagerId" value="${pmInfo.empId }">
	                                	 			<input type="hidden" class="form-control" id="PMid" name="ProjectManagerId" value="${pmInfo.empId }">
                                                   	<input type="text" class="form-control"style="background-color:transparent;" id="PMINFO"placeholder="${pmInfo.empRank } ${pmInfo.empName} ">
                                                	<div class="d-flex">
                                                		<button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" 
			                                        		type="button" 
			                                        		onclick="javascript:void(window.open('findPM','_blank','width=600, height=600, left=600, top=30'))">
			                                        		<i class="icon-copy fa fa-search" aria-hidden="true"></i>
			                                        	</button>
                                                	</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-5" style="padding-left:0px;">
                                            <label>프로젝트 개요</label>
                               	 			<textarea class="form-control" id="projectOutLines" name="projectOutLines" rows="5" >${projectInfo.projectContent }</textarea>
                                        </div>
                                        <div class="form-row">
	                                        <div class="form-group col-md-3">
	                                            <label>고객사 명 (company)</label>
	                                            <input type="text" class="form-control" name="customerCompany" value="${projectInfo.projectCompanyName }" placeholder="${projectInfo.projectCompanyName }">
	                                        </div>
                                        </div>
                                        <div class="form-group col-md-3" style="padding-left:0px;">
                                            <label>고객 명 (Customer)</label> <!-- 추후 과장 이상만 나오게끔 필터링해보자 -->
                                            <label class="sr-only">고객사 검색</label>
                                            <div class="d-flex">
                                            	<input type="hidden" class="form-control"  name="beforeCustomerId" value="${customerInfo.empId }">
                                                <input type="hidden" class="form-control" id="ClientId" name="customerId" value="${customerInfo.empId }">
                                                <input type="text" class="form-control"  style="background-color:transparent;" id="ClientINFO" placeholder="${customerInfo.empName }">
                                            	<div class="d-flex">
                                            		<button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" 
			                                        		type="button" 
			                                        		onclick="javascript:void(window.open('findClient','_blank','width=600, height=600, left=600, top=30'))">
			                                        	<i class="icon-copy fa fa-search" aria-hidden="true"></i>
			                                        </button>
                                            	</div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-3">
                                                <label>고객 이메일</label>
                                                <input type="text" class="form-control" id="ClientEmail" value="${customerInfo.empEmail }" readonly="readonly">
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label>고객 연락처</label>
                                                <input type="text" class="form-control" id="ClientTel" value="${customerInfo.empTel }" readonly="readonly">
                                            </div>
                                           
                                        </div>
                                        <div class="form-group">
                                            
                                        </div>
                                        <button type="submit" class="btn btn-primary">수정하기</button>
                                    </form>
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