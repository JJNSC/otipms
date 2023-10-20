<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <link href="${pageContext.request.contextPath}/resources/css/customStyle.css" rel="stylesheet">

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
                                    <!-- <h4>공지사항</h4> -->
                                    <h4>${boardType}</h4>
                                </div>
				                <c:if test="${boardType eq '질의 게시판'}">
	                                <div class="dropdown d-inline-block my-1">
		                                <button type="button" class="btn btn-primary btn-custom dropdown-toggle dropdownCategoryFilter" data-toggle="dropdown" aria-expanded="false" style="padding: 5px 9px;">시스템 관리 문의  </button>
		                                <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 37px, 0px);">
		                                	<a class="dropdown-item" href="#" onclick="categoryFilter(this)">시스템 관리 문의  </a> 
		                                	<a class="dropdown-item" href="#" onclick="categoryFilter(this)">아키텍처 문의  </a> 
		                                	<a class="dropdown-item" href="#" onclick="categoryFilter(this)">DBA 문의  </a>
		                                </div>
		                                <script type="text/javascript">
		                                function categoryFilter(selectedItem) {
		                                    /* $(".dropdownCategoryFilter").innerHTML = selectedItem.innerHTML; */
		                                	var dropdownButton = document.querySelector(".dropdownCategoryFilter");
		                                    dropdownButton.innerHTML = selectedItem.innerHTML;
		                                }
	                                </script>
		                            </div>
		                        </c:if>
                                <div class="table-responsive">
                                    <table class="table table-hover table-custom">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>제목</th>
                                                <th>작성자</th>
                                                <th>작성일</th>
                                                <th>조회수</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                       		<tr onclick="window.location.href='detailBoard?boardType=${boardType}';">
                                                <th>3</th>
                                                <td>
                                                	게시글 테스트 3 게시글 테스트 3 게시글 테스트 3 게시글 테스트 3
                                                	&nbsp;
                                                	<i class="icon-copy fa fa-paperclip" aria-hidden="true" style="transform: rotate(445deg);"></i>
                                                	&nbsp;
                                                	<span class="text-red">[2]</span>
                                                </td>
                                                <td>김종진</td>
                                                <td>23.10.15</td>
                                                <td>12345</td>
                                            </tr>
                                            <tr onclick="window.location.href='detailBoard?boardType=${boardType}';">
                                                <th>2</th>
                                                <td>
                                                	게시글 테스트 2 게시글 테스트 2
                                                	&nbsp;
                                                	<span class="text-red">[1]</span>
                                                </td>
                                                <td>김진성</td>
                                                <td>23.10.15</td>
                                                <td>12345</td>
                                            </tr>
                                            <tr onclick="window.location.href='detailBoard?boardType=${boardType}';">
                                                <th>1</th>
                                                <td>
                                                	게시글 테스트 1
                                                	&nbsp;
                                                	<i class="icon-copy fa fa-paperclip" aria-hidden="true" style="transform: rotate(445deg);"></i>
                                                	&nbsp;
                                                	<span class="text-red">[286]</span>
                                                </td>
                                                <td>이은지</td>
                                                <td>23.10.15</td>
                                                <td>12345</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="bootstrap-pagination">
                           		<nav>
			                        <ul class="pagination justify-content-center">
			                            <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">이전</a>
			                            </li>
			                            <li class="page-item active"><a class="page-link" href="#">1</a>
			                            </li>
			                            <li class="page-item"><a class="page-link" href="#">2</a>
			                            </li>
			                            <li class="page-item"><a class="page-link" href="#">3</a>
			                            </li>
			                            <li class="page-item"><a class="page-link" href="#">4</a>
			                            </li>
			                            <li class="page-item"><a class="page-link" href="#">5</a>
			                            </li>
			                            <li class="page-item"><a class="page-link" href="#">다음</a>
			                            </li>
			                        </ul>
			                    </nav>
			                </div>
			                <div class="mb-3 text-right px-5">
			                	<div class="dropdown d-inline-block">
	                                <button type="button" class="btn btn-primary btn-custom dropdown-toggle dropdownSearchFilter" data-toggle="dropdown" aria-expanded="false">게시글 + 댓글  </button>
	                                <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 37px, 0px);">
	                                	<a class="dropdown-item" href="#" onclick="searchFilter(this)">게시글 + 댓글  </a> 
	                                	<a class="dropdown-item" href="#" onclick="searchFilter(this)">제목만  </a> 
	                                	<a class="dropdown-item" href="#" onclick="searchFilter(this)">작성자  </a>
	                                	<a class="dropdown-item" href="#" onclick="searchFilter(this)">댓글 내용  </a>
	                                	<a class="dropdown-item" href="#" onclick="searchFilter(this)">댓글 작성자  </a>
	                                </div>
	                                <script type="text/javascript">
		                                function searchFilter(selectedItem) {
		                                    /* $(".dropdownSearchFilter").innerHTML = selectedItem.innerHTML; */
		                                	var dropdownButton = document.querySelector(".dropdownSearchFilter");
		                                    dropdownButton.innerHTML = selectedItem.innerHTML;
		                                }
	                                </script>
	                            </div>
								<div class="input-group mb-3 input-group-custom">
	                                <input type="text" class="form-control form-custom">
	                                <div class="input-group-append">
	                                    <button class="btn btn-primary" type="button">검색</button>
	                                </div>
	                            </div>
	                            <div class="btn-write">
	                            	<a href="${pageContext.request.contextPath}/writeBoard?boardType=${boardType}" type="button" class="btn btn-primary text-white">글쓰기</a>
	                            </div>
			                </div>
                        </div>
                        <!-- /# card -->
                    </div>
                </div>
                
                <!-- <div class="bootstrap-pagination">
                    <nav>
                        <ul class="pagination justify-content-center">
                            <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">Previous</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">2</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">3</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">Next</a>
                            </li>
                        </ul>
                    </nav>
                </div> -->
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
	<%-- <script src="${pageContext.request.contextPath}/resources/js/board.js"></script> --%>
</body>

</html>