<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                        <div class="card card-custom">
                            <div class="card-body">
                                <div class="card-title">
                                    <!-- <h4>공지사항</h4> -->
                                    <c:if test="${boardType ne '팀 게시판'}">
	                                    <h4 style="font-weight: bolder;">${boardType}</h4>
                                    </c:if>
                                    <c:if test="${boardType eq '팀 게시판'}">
	                                    <h4 style="font-weight: bolder;">${teamName} 게시판</h4>
                                    </c:if>
                                </div>
				                <c:if test="${boardType eq '질의 게시판'}">
	                                <div class="dropdown d-inline-block my-1">
		                                <button type="button" class="btn btn-primary btn-custom dropdown-toggle dropdownCategoryFilter" data-toggle="dropdown" aria-expanded="false" style="padding: 5px 9px;">${inquiryType}  </button>
		                                <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 37px, 0px);">
		                                	<a class="dropdown-item" href="#" onclick="categoryFilter(this)">전체  </a> 
		                                	<a class="dropdown-item" href="#" onclick="categoryFilter(this)">시스템 관리 문의  </a> 
		                                	<a class="dropdown-item" href="#" onclick="categoryFilter(this)">아키텍처 문의  </a> 
		                                	<a class="dropdown-item" href="#" onclick="categoryFilter(this)">DBA 문의  </a>
		                                </div>
		                                <script type="text/javascript">
			                                function categoryFilter(selectedItem) {
			                                    /* $(".dropdownCategoryFilter").innerHTML = selectedItem.innerHTML; */
			                                	var dropdownButton = document.querySelector(".dropdownCategoryFilter");
			                                    var option = selectedItem.innerHTML;
			                                    dropdownButton.innerHTML = option;
			                                    
			                                    console.log("어라...option은? " + option);
			                                    
			                                    chooseInquiryType(option);
			                                    
			                                    /* $.ajax({
			                                		url: "/otipms/asncBoard",
			                                		method: "GET",
			                                		data: {
			                                			inquiryType:option
			                                		},
			                                		success: function(data) {
			                                			console.log(data);
			                                			console.log(data.boardPager);
			                                			console.log(data.boardList);
			                                			
			                                			var html = '';
			                                			
			                                			console.log("아니 여기서는 잘 나왔었잖아 ㅠㅅㅠ" + data.boardList);
			                                			console.log("아니 여기서는 잘 나왔었잖아 ㅠㅅㅠ ??????" + data.boardList.toString());
			                                			
			                                			$.each(data.boardList, function(index, item) {
			                                				console.log("item도 잘 나온다고 해주라 제발 ㅠㅅㅠ 이렇게 써야 하는거니???" + item.toString());
			                                				console.log("item도 잘 나온다고 해주라 제발 ㅠㅅㅠ" + item);
			                                			} 
			                                		},
			                                		error: function(error) {
			                                			console.log(error);
			                                		}
			                                	}); */
			                                }
	                                </script>
		                            </div>
		                        </c:if>
                                <div class="table-responsive">
                                    <table class="table table-hover table-custom">
                                        <thead>
                                            <c:if test="${boardType ne '질의 게시판'}">
	                                            <tr>
	                                                <th></th>
	                                                <th>제목</th>
	                                                <th>작성자</th>
	                                                <th>작성일</th>
	                                                <th>조회수</th>
	                                            </tr>
	                                        </c:if>
                                            <c:if test="${boardType eq '질의 게시판'}">
	                                            <tr>
	                                                <th></th>
		                                            <th style="width: 10%;">문의 유형</th>
	                                                <th style="width: 58%;">제목</th>
	                                                <th style="width: 9%;">작성자</th>
	                                                <th style="width: 10%;">작성일</th>
	                                                <th style="width: 7%;">조회수</th>
	                                            </tr>
                                            </c:if>
                                        </thead>
                                        <tbody>
                                        	<c:if test="${fn:length(boardPagerMap.boardList) == 0}">
                                        		<tr>
                                        			<td colspan="5">게시글이 존재하지 않습니다.<td>
                                        		</tr>
                                        	</c:if>
                                        	<c:if test="${fn:length(boardPagerMap.boardList) != 0}">
	                                        	<c:forEach var="board" items="${boardPagerMap.boardList}">
		                                       		<tr onclick="window.location.href='detailBoard?boardNo=${board.boardNo}';">
		                                                <td>${board.rnum}</td>
		                                                <c:if test="${boardType eq '질의 게시판'}">
			                                                <td>${board.inquiryBoardType}</td>
		                                                </c:if>
		                                                <td>
		                                                	${board.boardTitle}
		                                                	<c:if test="${board.mediaFileName != null}">
			                                                	&nbsp;
			                                                	<i class="icon-copy fa fa-paperclip" aria-hidden="true" style="transform: rotate(445deg);"></i>
		                                                	</c:if>
		                                                	<c:if test="${board.commentCount != 0}">
			                                                	&nbsp;
			                                                	<span class="text-red">[${board.commentCount}]</span>
		                                                	</c:if>
		                                                </td>
		                                                <td>${board.empName}</td>
		                                                <!-- 오늘 날짜면 시간만 보이도록 -->
		                                                <c:set var="now" value="<%= new java.util.Date() %>" />
		                                                <c:choose>
														    <c:when test="${fn:substring(board.boardWriteDate, 0, 10) == fn:substring(now, 0, 10)}">
														        <td>
														            <fmt:formatDate value="${board.boardWriteDate}" pattern="HH:mm"/>
														        </td>
														    </c:when>
														    <c:otherwise>
														        <td>
														            <fmt:formatDate value="${board.boardWriteDate}" pattern="yyyy.MM.dd"/>
														        </td>
														    </c:otherwise>
														</c:choose>
		                                                <td>${board.boardHitcount}</td>
		                                            </tr>
	                                        	</c:forEach>
	                                        </c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <c:if test="${fn:length(boardPagerMap.boardList) != 0}">
                            	<div class="bootstrap-pagination">
	                           		<!-- <nav> -->
	                           		<nav class="justify-content-center" style="display: flex; margin-bottom: 1rem;">
	                           			<c:set var="pager" value="${boardPagerMap.boardPager}" />
				                        <!-- <ul class="pagination justify-content-center"> -->
				                        
			                        	<c:if test="${pager.groupNo>1}">
			                            	<input type="button" class="page-link" tabindex="-1" value="${pager.startPageNo-1}" onclick="movePage(this)">이전</input>
			                            </c:if>
			                            <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
											<c:if test="${pager.pageNo == i}">
												<input type="button" class="page-link selected" value="${i}" onclick="movePage(this)">
											</c:if>
											<c:if test="${pager.pageNo != i}">
												<input type="button" class="page-link" value="${i}" onclick="movePage(this)">
											</c:if>
										</c:forEach>
										<c:if test="${pager.groupNo<pager.totalGroupNo}">
											<input type="button" class="page-link" value="${pager.endPageNo+1}" onclick="movePage(this)">다음</input>
			                            </c:if>
				                    </nav>
		                    		<!-- <script type="text/javascript">
		                                /* function movePageInquiry(clickedInput) {
		                                    /* $(".dropdownCategoryFilter").innerHTML = selectedItem.innerHTML; */
		                                    console.log("일단 첫번째 pageNo 뭐가 맞을까 " + clickedInput.value);
		                                    console.log("일단 첫번째 pageNo 뭐가 맞을까 " + $(clickedInput).val())
		                                    
		                                    var pageNo = clickedInput.value;
		                                    
		                                    chooseInquiryType(null, pageNo);
		                                }
		                                function movePage(clickedInput) {
		                                    var pageNo = clickedInput.value;
		                                    
		                                    //movePageNormal(pageNo);
		                                } */
	                               	</script> -->
				                </div>
                            </c:if>
			                <div class="mb-3 text-right px-5">
			                	<div class="dropdown d-inline-block">
			                		<c:if test="${searchType != null}">
		                                <button type="button" class="btn btn-primary btn-custom dropdown-toggle dropdownSearchFilter" data-toggle="dropdown" aria-expanded="false">${searchType}  </button>
                                	</c:if>
                                	<c:if test="${searchType == null}">
		                                <button type="button" class="btn btn-primary btn-custom dropdown-toggle dropdownSearchFilter" data-toggle="dropdown" aria-expanded="false">게시글  </button>
                                	</c:if>
	                                <!-- <button type="button" class="btn btn-primary btn-custom dropdown-toggle dropdownSearchFilter" data-toggle="dropdown" aria-expanded="false">게시글  </button> -->
	                                <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 37px, 0px);">
	                                	<a class="dropdown-item" href="#" onclick="searchFilter(this)">게시글  </a> 
	                                	<a class="dropdown-item" href="#" onclick="searchFilter(this)">제목  </a> 
	                                	<a class="dropdown-item" href="#" onclick="searchFilter(this)">작성자  </a>
	                                	<a class="dropdown-item" href="#" onclick="searchFilter(this)">댓글  </a>
	                                	<a class="dropdown-item" href="#" onclick="searchFilter(this)">댓글 작성자  </a>
	                                </div>
	                                <script type="text/javascript">
		                                function searchFilter(selectedItem) {
		                                    /* $(".dropdownSearchFilter").innerHTML = selectedItem.innerHTML; */
		                                	var dropdownButton = document.querySelector(".dropdownSearchFilter");
		                                    var filterKeyword = selectedItem.innerHTML;
		                                    dropdownButton.innerHTML = filterKeyword;
		                                    
		                                    if(filterKeyword == '게시글  ') {
		                                    	filterKeyword = "게시글";
		                                	} else if(filterKeyword == '제목  ') {
		                                		filterKeyword = "제목";
		                                	} else if(filterKeyword == '작성자  ') {
		                                		filterKeyword = "작성자";
		                                	} else if(filterKeyword == '댓글  ') {
		                                		filterKeyword = "댓글";
		                                	} else if(filterKeyword == '댓글 작성자  ') {
		                                		filterKeyword = "댓글 작성자";
		                                	}
		                                    console.log("filterKeyword: " + filterKeyword);
		                                    var searchType = document.querySelector("#searchType");
		                                    searchType.value = filterKeyword;
		                                    //$("#searchType").val(filterkeyword);
		                                }
	                                </script>
	                            </div>
	                            <c:if test="${searchType == null}">
	                                <div class="input-group mb-3 input-group-custom">
										<form action="searchBoard" method="post" class="d-flex">
											<input type="hidden" id="searchType" name="searchType" value="게시글">
											<input type="text" class="form-control form-custom" name="searchKeyword" value="">
			                                <div class="input-group-append">
			                                    <button class="btn btn-primary" type="submit">검색</button>
			                                </div>
										</form>
		                            </div>
                               	</c:if>
                               	<c:if test="${searchType != null}">
	                                <div class="input-group mb-3 input-group-custom">
										<form action="searchBoard" method="post" class="d-flex">
											<input type="hidden" id="searchType" name="searchType" value="${searchType}">
											<input type="text" class="form-control form-custom" name="searchKeyword" value="${searchKeyword}">
			                                <div class="input-group-append">
			                                    <button class="btn btn-primary" type="submit">검색</button>
			                                </div>
										</form>
		                            </div>
                               	</c:if>
								<!-- <div class="input-group mb-3 input-group-custom">
									<form action="searchBoard" method="post" class="d-flex">
										<input type="hidden" id="searchType" name="searchType">
										<input type="text" class="form-control form-custom" name="searchKeyword" value="">
		                                <div class="input-group-append">
		                                    <button class="btn btn-primary" type="submit">검색</button>
		                                </div>
									</form>
	                            </div> -->
	                            <c:if test="${boardType eq '공지사항'}">
	                            	<div class="btn-write">
			                            <c:if test="${employee.role == 'ROLE_ADMIN'}">
			                            	<a href="${pageContext.request.contextPath}/writeBoard" type="button" class="btn btn-primary text-white">글쓰기</a>
			                            </c:if>
		                            </div>
	                            </c:if>
	                            <c:if test="${boardType ne '공지사항'}">
	                            	<div class="btn-write">
		                            	<a href="${pageContext.request.contextPath}/writeBoard" type="button" class="btn btn-primary text-white">글쓰기</a>
		                            </div>
	                            </c:if>
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
	<%-- <script src="${pageContext.request.contextPath}/resources/js/board.js"></script> --%>
	<script src="${pageContext.request.contextPath}/resources/js/board/board.js"></script>
</body>

</html>