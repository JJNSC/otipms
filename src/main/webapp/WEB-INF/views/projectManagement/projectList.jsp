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
    <title>OTIPMS</title>
    <!-- Favicon icon -->
    <%-- <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png"> --%>
    <link rel="icon" type="image/jpeg" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/otipmsFavicon.png">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/projectList.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    <script>
		$(document).ready(function() {
			$('.projectNo').on('click', function() {
		    	const close = $('.show');
		    	if(close != null) {
		    		close.collapse('toggle');
		    	}
		        const target = $(this).data('target');
		        $(target).collapse('toggle');
		    });
		}); 
		
		function prepareDelete(projectNo) {
		    // 모달 내의 숨겨진 입력 필드에 projectNo를 설정
		    document.getElementById('projectNoInput').value = projectNo;
		}
		
		function deleteProject() {
		    // 모달 내의 숨겨진 입력 필드에서 projectNo를 가져옴
		    var projectNo = document.getElementById('projectNoInput').value;

		    // 컨트롤러로 데이터를 전송하는 AJAX 요청
		    $.ajax({
		        type: 'POST', // 또는 GET, 컨트롤러의 요청 메서드에 맞게 선택
		        url: '/disableProject', // 컨트롤러의 URL로 대체해야 함
		        data: { disableProjectNo: projectNo },
		        success: function() {
		            // 성공 시 수행할 작업
		            console.log('프로젝트 삭제 성공');
		            // 모달을 닫음
		            $('#modalGrid').modal('hide');
		        },
		        error: function(error) {
		            // 실패 시 수행할 작업
		            console.error('프로젝트 삭제 실패');
		        }
		    });
		}
	</script>
	
	<style>
		body {
			color: #222324;
		}
	
		.fa-trash-o {
		  background-color: transparent;
		}
		
		.paddingright{
			padding-right:5%;
		}
		
		.noHover{
			background-color: #fff;
		}
		.noHover:hover{
			background-color: #fff;
		}
		.no-left-border {
		  border-left: none; /* 왼쪽 테두리 제거 */
		}
		.no-right-border {
		  border-right: none; /* 왼쪽 테두리 제거 */
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
                    <!-- /# column -->
                    <div class="col">
                        <div class="card card-custom" style="box-shadow: 6px 11px 41px -28px #B5C4D6;">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4 style="font-weight: bolder;">프로젝트 목록</h4> 
                                    <span style="float: right">
                                    	<a href="addProjectForm">
                                    		<button type="button" class="btn mb-1 btn-primary">등록</button>
                                    	</a>
                                    </span>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-custom">
                                        <thead>
                                            <tr>
                                                <th class="text-center">번호</th>
                                                <th>프로젝트 명</th>
                                                <th>담당자</th>
                                                <th>작업 시작일</th>
                                                <th>작업 종료일</th>
                                                <th>진척률</th>
                                                <th class="text-right ">수정</th>
                                                <th class="text-center ">삭제</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="project" items="${projectList}" varStatus="a">
                                        		<c:forEach var="pm" items="${PMList}" varStatus="b">
                                        			<c:if test="${a.index==b.index}">
                                        				<c:forEach var="customerInfo" items="${customerInfoList}" varStatus="c">
                                        					<c:if test="${b.index==c.index}">
					                                            <tr class="reviewTitle table-hover " data-toggle="collapse" data-review-id="${project.projectNo }" id="projectNo${project.projectNo }" href="#collapseExample${project.projectNo }" role="button" aria-expanded="false" aria-controls="collapseExample">
					                                                <td class="text-center">P${project.projectNo }</td>
					                                                <td>
																	   ${project.projectName }
																	</td>
					                                                <td>${pm.empName }</td>
					                                                <td>
					                                                	<c:set var="startDate" value="${project.projectStartDate}" />
																		<c:choose>
																		    <c:when test="${not empty startDate}">
																		        <fmt:formatDate value="${startDate}" pattern="yyyy.MM.dd" var="formattedStartDate" />
																		    </c:when>
																		    <c:otherwise>
																		        <c:set var="formattedStartDate" value="" />
																		    </c:otherwise>
																		</c:choose>
																		${formattedStartDate}
					                                                </td>
					                                                <td>
					                                                	<c:set var="endDate" value="${project.projectEndDate}" />
																		<c:choose>
																		    <c:when test="${not empty endDate}">
																		        <fmt:formatDate value="${endDate}" pattern="yyyy.MM.dd" var="formattedEndDate" />
																		    </c:when>
																		    <c:otherwise>
																		        <c:set var="formattedEndDate" value="" />
																		    </c:otherwise>
																		</c:choose>
																		${formattedEndDate}
					                                                </td>
					                                                <td class="progressTd">
						                                                <c:if test="${project.progressRate < 20}">
																			<h5 class="mt-3"> <i class="icon-copy fa fa-frown-o" aria-hidden="true"></i><span class="float-right">${project.progressRate}%</span></h5>
						                                                	<div class="progress" style="height: 9px">
											                                    <div class="progress-bar wow  progress-" style="width: ${project.progressRate}%; background-color:#dd2c00;" role="progressbar"><span class="sr-only">60% Complete</span></div>
											                                </div>
						                                                </c:if>
						                                                <c:if test="${20 <= project.progressRate and project.progressRate < 80}">
																			<h5 class="mt-3"> <i class="icon-copy fa fa-meh-o" aria-hidden="true"></i><span class="float-right">${project.progressRate}%</span></h5>
						                                                	<div class="progress" style="height: 9px">
											                                    <div class="progress-bar wow  progress-" style="width:${project.progressRate}%; background-color:#2b5797;" role="progressbar"><span class="sr-only">60% Complete</span></div>
											                                </div>
						                                                </c:if>
						                                                <c:if test="${80 <= project.progressRate}">
																			<h5 class="mt-3"> <i class="icon-copy fa fa-smile-o" aria-hidden="true"></i><span class="float-right">${project.progressRate}%</span></h5>
						                                                	<div class="progress" style="height: 9px">
											                                    <div class="progress-bar wow  progress-" style="width: ${project.progressRate}%; background-color:#00aba9;" role="progressbar"><span class="sr-only">60% Complete</span></div>
											                                </div>
						                                                </c:if>
					                                                </td>
						                                            <td class="text-right" style="padding-right:20px"> 
						                                             	<a href="modifyProjectForm?projectNo=${project.projectNo}&pmId=${pm.empId}&customerId=${customerInfo.empId}">
						                                            			<i class="fa fa-pencil color-muted"></i>
						                                            		</a>
						                                             </td>	
						                                             <td class="text-center"> 
						                                              	<button type="button" class="btn fa fa-trash-o color-danger" data-toggle="modal" 
						                                              	data-target="#modalGrid" data-projectno="${project.projectNo }" onclick="prepareDelete(${project.projectNo})"></button>
						                                             </td>
					                                            </tr>
					                                            <tr style="background-color:#f3f3f3;" id="${project.projectNo }bottom">
														   			<td style="padding-top :0px; padding-bottom :0px;"colspan="8">
												                      	<div class="collapse" id="collapseExample${project.projectNo }">
																         	<div class="card card-body mt-3 noHover" style="height:200px; box-shadow: 6px 11px 41px -28px #B5C4D6;">
							                                            		<table border="1" class="table-in-table">
							                                            			<tr>
							                                            				<td class="no-right-border col-md-8">
							                                            					<i class="icon-copy fa fa-book" aria-hidden="true"> 프로젝트 개요</i>
							                                            				</td>
							                                            				<td class="no-right-border col-md-2">
							                                            					<i class="icon-copy fa fa-user" aria-hidden="true"> 고객 명</i>
							                                            				</td>
							                                            				<td class="no-left-border col-md-2">
							                                            					${customerInfo.empName }
							                                            				</td>
							                                            			</tr>
							                                            			<tr>
							                                            				<td rowspan="2"class="no-right-border">
							                                            					${project.projectContent }
							                                            				</td>
							                                            				<td class="no-right-border">
							                                            					<i class="icon-copy fa fa-drivers-license-o" aria-hidden="true"> 고객 연락처</i>
							                                            				</td>
							                                            				<td class="no-left-border">
							                                            					${customerInfo.empTel }
							                                            				</td>
							                                            			</tr>
							                                            			<tr>
							                                            				<td class="no-right-border">
							                                            					<i class="icon-copy fa fa-envelope" aria-hidden="true"> 고객 이메일</i>
							                                            				</td>
							                                            				<td class="no-left-border">
							                                            					${customerInfo.empEmail }
							                                            				</td>
							                                            			</tr>
							                                            		</table>
																         	</div>
																      	</div>
														   			</td>
																</tr>
															</c:if>
														</c:forEach>
													</c:if>
												</c:forEach>
											</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="modalGrid">
	                        <div class="modal-dialog" role="document">
	                            <div class="modal-content">
	                                <div class="modal-header">
	                                    <h5 class="modal-title">프로젝트 삭제</h5>
	                                </div>
	                                <form action="disableProject" method="Post">
	                                <div class="modal-body">
	                                    <div class="container-fluid">
	                                        <div class="row">
	                                        	<input type="hidden" id="projectNoInput" name="disableProjectNo">
	                                        	해당 프로젝트를 삭제하시겠습니까?
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="modal-footer">
	                                    <button class="btn btn-primary" onclick="deleteProject()">삭제</button>
	                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	                                </div>
	                                </form>
	                            </div>
	                        </div>
                		</div>
                        <!-- /# card -->
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
    
    

</body>

</html>