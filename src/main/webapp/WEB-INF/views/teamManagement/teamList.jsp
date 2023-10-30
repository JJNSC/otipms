<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<script src="${pageContext.request.contextPath}/resources/js/team/selectPL.js"></script>
	
	<style>
		.fa-close {
		  background-color: transparent;
		}
		
		.paddingright{
			padding-right:5%;
		}
		
		
	</style>	
	
	<script>
	    // JavaScript를 사용하여 탭을 제어하는 함수
	    function showProjectTab(index) {
	        // 모든 탭 컨텐츠를 숨깁니다.
	        var tabContents = document.getElementsByClassName("tab-pane");
	        for (var i = 0; i < tabContents.length; i++) {
	            tabContents[i].classList.remove("show", "active");
	        }
	        
	        // 선택한 프로젝트 탭을 활성화합니다.
	        var selectedTab = document.getElementById("project" + index);
	        if (selectedTab) {
	            selectedTab.classList.add("show", "active");
	        }
	    }
	
	    // 페이지가 로드될 때 첫 번째 탭을 활성화
	    window.addEventListener("load", function () {
	        showProjectTab(0); // 0은 첫 번째 탭의 인덱스입니다.
	    });
	</script>
</head>

<body>

    <%@include file="/WEB-INF/views/headernsidebar.jsp" %>
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
           <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">팀 관리</h4>
                                    <span style="float: right;">
	                               		<button type="button" class="btn btn-primary" style="position:relative; bottom:20px; right:70px;" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">등록</button>
	                                </span>
                                <!-- Nav tabs -->
                                
		                                <div class="default-tab">
		                                    <ul class="nav nav-tabs mb-3" role="tablist">
											    <c:forEach var="projectTab" items="${projectList}" varStatus="c">
											        <c:choose>
											            <c:when test="${c.index==0 }">
											                <li class="nav-item">
											                    <a class="nav-link active" data-toggle="tab" href="#project${c.index }" onclick="showProjectTab(${c.index})">${projectTab.projectName}</a>
											                </li>
											            </c:when>
											            <c:otherwise>
											                <li class="nav-item">
											                    <a class="nav-link" data-toggle="tab" href="#project${c.index }" onclick="showProjectTab(${c.index})">${projectTab.projectName}</a>
											                </li>
											            </c:otherwise>
											        </c:choose>
											    </c:forEach>
											</ul>
		                                    <c:forEach var="project" items="${projectList}" varStatus="a">
				                                <c:forEach var="teamList" items="${allTeam}" varStatus="b">
				                                	<c:if test="${a.index==b.index }">
					                                    <div class="tab-content">
					                                    	<c:if test="${b.index==c.index }">
					                                        	<div class="tab-pane fade show active" id="project${b.index }" role="tabpanel">
					                                        </c:if>	
					                                       <c:if test="${b.index!=c.index  }">
					                                        	<div class="tab-pane fade show" id="project${b.index }" role="tabpanel">
					                                        </c:if>	
					                                            <div class="p-t-15">
					                                            	 <div class="table-responsive">
									                                    <table class="table table-hover table-custom" style="width:96%;">
									                                        <thead>
									                                            <tr>
									                                                <th class="text-center">번호</th>
									                                                <th>팀 명</th>
									                                                <th>팀장</th>
									                                                <th class="text-right ">수정</th>
									                                                <th class="text-center ">삭제</th>
									                                            </tr>
									                                        </thead>
									                                        <tbody>
									                                        	<c:forEach var="team" items="${teamList.teamList }" varStatus="d">
										                                            <tr  id="project${a.index }"  >
										                                                <td class="text-center">${team.teamNo}</td>
										                                                <td>
																						  ${team.teamName} 
																						</td>
																						<c:if test="${team.empName==null}">	
										                                                	<td>
										                                                		<span class="btn teamLeaderName${project.projectNo}_${team.teamNo}" onclick="javascript:void(window.open('findProjectLeader?projectNo=${project.projectNo}&teamNo=${team.teamNo}','_blank','width=600, height=600, left=600, top=30'))">
										                                                		팀장 선택</span>
										                                                	</td>
										                                                </c:if>
																						<c:if test="${team.empName!=null}">	
										                                                	<td>
										                                                		<span class="btn teamLeaderName${project.projectNo}_${team.teamNo}">
										                                                		${team.empRank} ${team.empName }</span>
										                                                	</td>
										                                                </c:if>
											                                            <td class="text-right" style="padding-right:20px"> 
											                                             	<a href="addAndModifyTeam">
											                                            			<i class="fa fa-pencil color-muted"></i>
											                                            		</a>
											                                             </td>
											                                             <td class="text-center"> 
											                                              	<button type="button"  class="btn fa fa-close color-danger" data-toggle="modal" data-target="#modalGrid"></button>
											                                             </td>
										                                            </tr>
									                                            </c:forEach>
									                                        </tbody>
									                                    </table>
									                                </div>
					                                            </div>
					                                        </div>
			                                       		</div>
	                                       			</c:if>
												</c:forEach>
											</c:forEach>
                                       	</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="modalGrid">
	                        <div class="modal-dialog" role="document">
	                            <div class="modal-content">
	                                <div class="modal-header">
	                                    <h5 class="modal-title">팀 삭제</h5>
	                                </div>
	                                <div class="modal-body">
	                                    <div class="container-fluid">
	                                        <div class="row">
	                                        	해당 팀를 삭제하시겠습니까?
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="modal-footer">
	                                    <button type="button" class="btn btn-primary">삭제</button>
	                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	                                </div>
	                            </div>
	                        </div>
                		</div>
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
					                <div class="basic-form">
                                    <form id="addTeamForProject" action="addTeam" method="post">
                                        <div class="form-row">
	                                        <div class="form-group col-md-10">
	                                            <label>프로젝트 명</label>
                                                <select id="inputState" class="form-control" name="selectedProject">
                                                    <option selected="selected">프로젝트 선택</option>
                                                    <c:forEach var="project" items="${projectList}" varStatus="e">
                                                    	<option value="${project.projectNo }">${project.projectName }</option>
                                                    </c:forEach>	
                                                </select>
	                                        </div>
	                                    </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-10">
                                                <label>팀 명</label>
                                                <input type="text" name="teamName" class="form-control">
                                            </div>
                                        </div>
                                    </form>
                                </div>
					            <div class="modal-footer">
					            	<button type="submit" form="addTeamForProject" class="btn btn-primary">등록</button>
					                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
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