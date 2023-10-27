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
    <link href="${pageContext.request.contextPath}/resources/css/projectList.css" rel="stylesheet">
    
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
	</script>
	
	<style>
		.fa-close {
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
		
	</style>	

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
            <div class="container-fluid">
                <div class="row">
                    <!-- /# column -->
                    <div class="col">
                        <div class="card card-custom">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4><b>프로젝트 목록</b></h4> 
                                    <span style="float: right">
                                    	<a href="addAndModifyProject">
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
					                                                <td class="text-center">${project.projectNo }</td>
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
					                                                <td>
																		<h5 class="mt-3"> <i class="icon-copy fa fa-smile-o" aria-hidden="true"></i><span class="float-right">88%</span></h5>
					                                                	<div class="progress" style="height: 9px">
										                                    <div class="progress-bar bg-info wow  progress-" style="width: 88%;" role="progressbar"><span class="sr-only">60% Complete</span>
										                                    </div>
										                                </div>
					                                                </td>
						                                            <td class="text-right" style="padding-right:20px"> 
						                                             	<a href="addAndModifyProject?projectNo=${project.projectNo}&pmId=${pm.empId}&customerId=${customerInfo.empId}">
						                                            			<i class="fa fa-pencil color-muted"></i>
						                                            		</a>
						                                             </td>
						                                             <td class="text-center"> 
						                                              	<button type="button"  class="btn fa fa-close color-danger" data-toggle="modal" data-target="#modalGrid"></button>
						                                             </td>
					                                            </tr>
					                                            <tr style="background-color:#f3f3f3;" id="${project.projectNo }bottom">
														   			<td style="padding-top :0px; padding-bottom :0px;"colspan="8">
												                      	<div class="collapse" id="collapseExample${project.projectNo }">
																         	<div class="card card-body mt-3 noHover" style="height:200px;">
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
	                                <div class="modal-body">
	                                    <div class="container-fluid">
	                                        <div class="row">
	                                        	해당 프로젝트를 삭제하시겠습니까?
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
    
    

</body>

</html>