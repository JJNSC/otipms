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
    <script src="${pageContext.request.contextPath}/resources/js/project/selectClient.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/team/selectNewPL.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/team/findNewPL.js"></script>

</head>

<body>

   <%-- <%@include file="/WEB-INF/views/headernsidebar.jsp" %> --%>
   <jsp:include page="../headernsidebar.jsp">
		<jsp:param name="employee" value="${employee}" />
		<jsp:param name="mf" value="${mf}" />
		<jsp:param name="base64Img" value="${base64Img}" />
	</jsp:include>
        <!--**********************************
            Sidebar end
        ***********************************-->

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
                                <h4 class="card-title">팀 수정</h4>
                                <div class="basic-form">
                                    <form action="modifyTeam" method="post">
                                        <div class="form-row">
	                                        <div class="form-group col-md-4">
                                                <label>${oldTeam.projectName }</label>
	                                        </div>
	                                    </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-4">
                                                <label>팀 명</label>
                                                <c:if test="${oldTeam.teamName.equals('고객')}">
                                                	<input type="text" class="form-control" name="newTeamName" value="${oldTeam.teamName }" readonly="readonly">
                                                </c:if>
                                                <c:if test="${!oldTeam.teamName.equals('고객')}">
                                                	<input type="text" class="form-control" name="newTeamName" value="${oldTeam.teamName }">
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-4">
                                            	<c:if test="${oldTeam.teamName.equals('고객')}">
	                                                <label>고객 (Client)</label> <!-- 추후 과장 이상만 나오게끔 필터링해보자 -->
	                                                <label class="sr-only">고객 검색</label>
                                                </c:if>
                                            	<c:if test="${!oldTeam.teamName.equals('고객')}">
	                                                <label>팀장 (PL)</label> <!-- 추후 과장 이상만 나오게끔 필터링해보자 -->
	                                                <label class="sr-only">팀장 검색</label>
                                                </c:if>
                                                <!-- <div class="input-group mb-2"> -->
                                                <div class="d-flex">
	                                                <input type="hidden" class="form-control" name="teamNo" value="${oldTeam.teamNo }">
	                                                <input type="hidden" class="form-control" id="ClientId" name="newTeamEmpId" value="${oldTeam.empId }">
	                                                <input type="text" class="form-control"  style="background-color:transparent;" id="ClientINFO" placeholder="${oldTeam.empRank } ${oldTeam.empName }">
                                                    <!-- <div class="text-left m-t-15"> -->
                                                    <div class="d-flex">
                                                    	<c:if test="${oldTeam.teamName.equals('고객')}">
					                                        <!-- <button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" 
					                                        		type="button" 
					                                        		onclick="javascript:void(window.open('findClient','_blank','width=600, height=600, left=600, top=30'))">
					                                        	<i class="fa fa-paper-plane m-r-5"></i>
					                                        	 고객 찾기
					                                        </button> -->
					                                        <button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" 
					                                        		type="button" 
					                                        		onclick="javascript:void(window.open('findClient','_blank','width=600, height=600, left=600, top=30'))">
					                                        	<i class="icon-copy fa fa-search" aria-hidden="true"></i>
					                                        </button>
				                                        </c:if>
                                                    	<c:if test="${!oldTeam.teamName.equals('고객')}">
					                                        <%-- <button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" 
															    type="button" 
															    onclick="openFindPL(${oldTeam.teamNo })">
															    <i class="fa fa-paper-plane m-r-5"></i>
															    팀장 찾기
															</button> --%>
															<button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" 
															    type="button" 
															    onclick="openFindPL(${oldTeam.teamNo })">
															    <i class="icon-copy fa fa-search" aria-hidden="true"></i>
															</button>
															
															<script>
															function openFindPL(teamNo) {
															    // URL을 동적으로 생성하여 teamNo를 query parameter로 전달
															    var url = 'findPL?teamNo=' + teamNo;
															    
															    // 팝업 창 열기
															    window.open(url, '_blank', 'width=600, height=600, left=600, top=30');
															}
															</script>
				                                        </c:if>
			                                    	</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            
                                        </div>
                                        <button type="submit" class="btn btn-dark">수정하기</button>
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