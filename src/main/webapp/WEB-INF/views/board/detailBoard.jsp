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
    <title>OTIPMS</title>
    <!-- Favicon icon -->
    <%-- <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png"> --%>
    <link rel="icon" type="image/jpeg" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/otipmsFavicon.png">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/customStyle.css" rel="stylesheet">
    
	<%-- <link href="${pageContext.request.contextPath}/resources/css/mail/dropzone.css" rel="stylesheet" type="text/css"> --%>

	<script>
	    function showEmpInfo(empId) {
	    	$.ajax({
	            url: 'http://localhost:8080/otipms/employeeManagement/employeeInfoJson', // 해당 URL은 실제로 사용하는 URL로 변경해야 합니다.
	            type: 'GET',
	            data: { empId: empId },
	            success: function (data) {
	                // 요청이 성공하면 모달 내용을 업데이트
	                updateModalContent(data);
	            },
	            error: function () {
	                // 요청 실패 시 예외 처리
	                alert('사원 정보를 불러오는 중 문제가 발생했습니다.');
	            }
	        });
		}
	    function updateModalContent(employeeData) {
	    	var profileImage = $('#profileImageEmp');
	        profileImage.attr('src', 'data:' + employeeData.mediaFileData + ';base64, ' + employeeData.base64Img);
	        profileImage.attr('alt', ''); // alt 속성도 업데이트

	        // 나머지 필드 업데이트
	        $('#profileEmpName').val(employeeData.empName);
	        $('#profileEmpName').text(employeeData.empName);
	        $('#profileEmpTel').val(employeeData.empTel);
	        $('#profileEmpTel').text(employeeData.empTel);
	        $('#profileEmpEmail').val(employeeData.empEmail);
	        $('#profileEmpEmail').text(employeeData.empEmail);
	        $('#profileEmpRank').val(employeeData.empRank);
	        $('#profileEmpRank').text(employeeData.empRank);
	        $('#profileEmpTeamName').val(employeeData.teamNo);
	        $('#profileEmpTeamName').text(employeeData.teamName);

	        // 모달 열기
	        $('#writerInfoModal').modal('show');
	    }
	</script>
	
	<script>
		var toWriter = document.getElementById('openWriterMail');
		toWriter.addEventListener('click', function() {
			openMailWindow('${board.empId}');
		});
	
		function openMailWindow(employeeId) {
			var url = '${pageContext.request.contextPath}/mail/writeMail?empId=' + employeeId;
			var options = 'width=920, height=680, left=800, top=30';
			window.open(url, '_blank', options);
		}
	</script>
	<style>
       .popover {
           position: relative;
           top: 10%;
           left: 94.38%;
           transform: translateX(-150%);
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
        <!-- <div class="content-body" style="min-height: 1000px;"> -->
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
                            	<div class="card-title mb-1">
                                    <!-- <h4>공지사항</h4> -->
                                    <%-- <h4>${boardType}</h4> --%>
                                    <c:if test="${board.boardTypeName ne '팀 게시판'}">
	                                    <h4 class="d-inline-block" style="font-weight: bolder;"><a href="board" style="color: #222222;">${board.boardTypeName}</a></h4><c:if test="${board.boardTypeName eq '질의 게시판'}"> <h5 class="d-inline-block">&nbsp;/&nbsp;  ${board.inquiryBoardType}</h5></c:if>
                                    </c:if>
                                    <c:if test="${board.boardTypeName eq '팀 게시판'}">
	                                    <h4 style="font-weight: bolder;">${teamName} 게시판</h4>
                                    </c:if>
                                </div>
                            	<div class="mt-4 pl-3 row" style="margin-bottom: 0.8rem;">
                                    <h3 style="padding-top: 10px;">${board.boardTitle}</h3>
                                    <!-- <span class="col-10 text-right">
			                            <button type="button" class="btn btn-primary">등록</button>
                                    </span> -->
                                </div>
                                <div class="row">
                                	<div class="col-6 mb-3">
                                		<div class="d-flex align-items-center">
                                			<c:if test="${board.mediaFileData != null}">
			                                   <%--  <div style="margin-right: 0.8rem !important;" 
			                                    data-toggle="modal" data-target="#writerInfoModal" data-whatever="@mdo" 
			                                    onclick="showEmpInfo(${board.empId})"> --%>
											     <div style="margin-right: 0.8rem !important;" >
											        <img
											            data-container="body"
											            data-toggle="popover"
											            data-placement="top"
											            data-html="true"
											            data-content="이메일: ${writer.empEmail }<br>전화번호: ${writer.empTel }<br><span id='openWriterMail' onclick='openMailWindow(${board.empId })'>쪽지보내기 : <i class='icon-copy ion-paper-airplane'></i></span>"
											            src="data:${board.mediaFileData};base64, ${board.base64Img}"
											            class="rounded-circle"
											            width="40"
											            height="40"
											        />
											    </div>
                               				</c:if>
		                                   <!--  <div class="mr-3"><img src="/otipms/resources/images/testHuman.jpg" alt="user" class="rounded-circle" width="40" height="40"></div> -->
		                                    <div class="">
		                                        <h6 class="text-dark mb-0 font-16 font-weight-medium pb-1">
		                                        	<c:if test="${board.teamName == null or board.teamName == '미배정'}">
		                                        		${board.empName} <span style="font-weight: 300; font-size: 0.8rem; color: #9097c4;"> ${board.empRank}</span>
		                                        	</c:if>
		                                        	<c:if test="${board.teamName != null and board.teamName != '미배정'}">
		                                        		${board.empName} <span style="font-weight: 300; font-size: 0.8rem; color: #9097c4;"> ${board.empRank} | ${board.teamName}</span>
		                                        	</c:if>
		                                        </h6>
		                                        <c:set var="now" value="<%= new java.util.Date() %>" />
			                                    <c:choose>
												    <c:when test="${fn:substring(board.boardWriteDate, 0, 10) == fn:substring(now, 0, 10)}">
												        <span class="text-muted font-14">  <fmt:formatDate value="${board.boardWriteDate}" pattern="HH:mm"/></span>
												    </c:when>
												    <c:otherwise>
												        <span class="text-muted font-14">  <fmt:formatDate value="${board.boardWriteDate}" pattern="yyyy.MM.dd"/></span>
												    </c:otherwise>
												</c:choose>
		                                        <!-- <span class="text-muted font-14">  2023.10.18 16:13</span> -->
		                                        &nbsp; <span class="text-muted font-14">조회 ${board.boardHitcount}</span>
		                                    </div>
		                                </div>
                                	</div>
                                	<div class="col-6 text-right pt=4" style=" padding-top: 30px; padding-right: 29px;">
		                                <!-- <button type="button" class="btn mb-1 btn-light-custom">수정</button> -->
		                                <c:if test="${board.empId == employee.empId or employee.role == 'ROLE_ADMIN'}">
		                                    <a href="writeBoard?boardNo=${board.boardNo}" type="button" class="text-secondary" style=" margin-right: 7px;">수정</a>                                                                	
		                                    <a href="#" type="button" class="text-danger" data-toggle="modal" data-target="#deleteBoard">샥제</a>
		                                </c:if>
                                	</div>
                                </div>
                                <div class="compose-content pt-3" style="min-height: 86px; border-top: 1px solid #ebecef; padding-left: 1.5rem !important; padding-top: 2.5rem !important; padding-bottom: 2.5rem !important;">
                                   	${board.boardContent}
                                </div>
                                <c:forEach var="mediaFile" items="${mediaList}">
	                                <div>
	                                <a href="${pageContext.request.contextPath}/mail/download/${mediaFile.mediaFileNo}" class="text-muted" download="${mediaFile.mediaFileName}">
	                                   ${mediaFile.mediaFileName}
	                                </a>
	                                </div>
                                </c:forEach>
                                <!-- 댓글 -->
                                <c:forEach var="comment" items="${commentList}">
                                	<div class="compose-content" style="border-top: 1px solid #ebecef; padding-top: 1.5rem; padding-bottom: 1.1rem;">
	                                	<div class="row">
	                                		<div class="col-6">
	                                			<div class="d-flex align-items-center">
	                                				<c:if test="${comment.mediaFileData != null}">
	                                					<%-- <div style="margin-right: 0.8rem !important;"><img src="data:${comment.mediaFileData};base64, ${comment.base64Img}" class="rounded-circle" width="40" height="40"></div> --%>
	                                					<div style="margin-right: 0.8rem !important; position: relative;">
														    <img
														        data-container="body"
														        data-toggle="popover"
														        data-html="true"
														        data-placement="top"
														        data-content="이메일: ${comment.empEmail }<br>전화번호: ${comment.empTel }<br><span id='openWriterMail' onclick='openMailWindow(${comment.empId })'>쪽지보내기 : <i class='icon-copy ion-paper-airplane'></i></span>"
														        src="data:${comment.mediaFileData};base64, ${comment.base64Img}"
														        class="rounded-circle"
														        width="40"
														        height="40"
														    />
														    <script>
														        $('[data-toggle="popover"]').popover({
														            trigger: 'manual',
														        }).on('click', function (e) {
														            e.preventDefault();
														            e.stopPropagation();
														            $(this).popover('show');
														        });
														
														        $(document).on('click', function (e) {
														            $('[data-toggle="popover"]').each(function () {
														                if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
														                    $(this).popover('hide');
														                }
														            });
														        });
														    </script>
														</div>
<%-- 	                                					<div style="margin-right: 0.8rem !important;" class="bootstrap-popover">
													        <img
													            data-container="body"
													            data-toggle="popover"
													            data-placement="top"
													            data-html="true"
													            data-content="이메일: ${comment.empEmail }<br>전화번호: ${comment.empTel }<br><span id='openWriterMail' onclick='openMailWindow(${comment.empId })'>쪽지보내기 : <i class='icon-copy ion-paper-airplane'></i></span>"
													            src="data:${comment.mediaFileData};base64, ${comment.base64Img}"
													            class="rounded-circle"
													            width="40"
													            height="40"
													        />
													    </div> --%>
	                                				</c:if>
				                                    <div class="">
				                                        <h6 class="text-dark mb-0 font-16 font-weight-medium pb-1">
				                                        	<c:if test="${comment.teamName == null or comment.teamName == '미배정'}">
					                                        	${comment.empName} <span style="font-weight: 300; font-size: 0.8rem; color: #9097c4;">${comment.empRank}</span>
				                                        	</c:if>
				                                        	<c:if test="${comment.teamName != null and comment.teamName != '미배정'}">
					                                        	${comment.empName} <span style="font-weight: 300; font-size: 0.8rem; color: #9097c4;">${comment.empRank} | ${comment.teamName}</span>
				                                        	</c:if>
				                                        	
				                                        	<c:if test="${board.empId == comment.empId}">
					                                        	<span class="badge badge-pill badge-writer-custom">작성자</span>
				                                        	</c:if>
				                                        </h6>
				                                        <c:set var="now" value="<%= new java.util.Date() %>" />
		                                                <c:choose>
														    <c:when test="${fn:substring(comment.commentWriteDate, 0, 10) == fn:substring(now, 0, 10)}">
														        <td>
														            <span class="text-muted font-14">  <fmt:formatDate value="${comment.commentWriteDate}" pattern="HH:mm"/></span>
														        </td>
														    </c:when>
														    <c:otherwise>
														        <td>
														        	<span class="text-muted font-14">  <fmt:formatDate value="${comment.commentWriteDate}" pattern="yyyy.MM.dd"/></span>
														        </td>
														    </c:otherwise>
														</c:choose>
				                                    </div>
				                                </div>
	                                		</div>
	                                		<c:if test="${comment.empId == employee.empId}">
		                                		<div class="col-6 text-right">
		                                			<!-- <div class="dropdown custom-dropdown" style="flex: 1; text-align: right;">
				                                        <div data-toggle="dropdown" aria-expanded="false" class="px-3">
				                                        	<i class="fa fa-ellipsis-v"></i>
				                                        </div>
				                                        <div class="dropdown-menu dropdown-menu-right" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(-81px, 21px, 0px);">
				                                        	<a class="dropdown-item" href="#">수정</a>
				                                        	<a class="dropdown-item" href="#">삭제</a>
				                                        </div>
				                                    </div> -->
				                                    <button type="button" class="btn fa fa-trash-o text-danger" data-toggle="modal" data-target="#deleteComment" onclick="transferCommentNo(${comment.commentNo})"></button>
				                                    <script type="text/javascript">
				                                    	function transferCommentNo(commentNo) {
				                                    		$("#commentNoInput").val(commentNo);
				                                    	}
				                                    </script>             		
		                                		</div>
                                        	</c:if>
	                                	</div>
	                                	<div class="row pt-3 pl-5 ml-1" style="color: #222222;">
	                                		<%-- <pre>${comment.commentContent}</pre> --%>
	                                		${comment.commentContent}
	                                	</div>
	                                </div>
                                </c:forEach>
                                
                                <div class="modal fade" id="deleteBoard">
			                        <div class="modal-dialog" role="document">
			                            <div class="modal-content">
			                                <div class="modal-header">
			                                    <h5 class="modal-title">게시글 삭제</h5>
			                                </div>
			                                <div class="modal-body">
			                                    <div class="container-fluid">
			                                        <div class="row">
			                                        	해당 게시글을 삭제하시겠습니까?
			                                        </div>
			                                    </div>
			                                </div>
			                                <div class="modal-footer">
			                                    <!-- <button type="button" class="btn btn-primary">삭제</button> -->
			                                    <a href="deleteBoard?boardNo=${board.boardNo}" role="button" class="btn btn-primary">삭제</a>
			                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			                                </div>
			                            </div>
			                        </div>
		                		</div>
		                		
		                		<!-- 댓글 작성자 클릭시 정보 나오는 모달  -->
                                 <div class="modal fade" id="writerInfoModal" tabindex="-1" role="dialog" aria-labelledby="nameExcelFileLabel" aria-hidden="true">
								    <div class="modal-dialog" role="document">
								        <div class="modal-content">
								            <div class="modal-header">
								                <h5 class="modal-title" id="nameExcelFileLabel">작성자 정보</h5>
								            </div>
								            <div class="modal-body">
								                <div class="card" style="padding: 20px;">
													<div class="profile-photo">
														<!-- <a href="modal" data-toggle="modal" data-target="#modal" class="edit-avatar"><i class="fa fa-pencil"></i></a> -->
														<c:if test="${profileEmployee.mediaFileData != null}">
															<img id="profileImageEmp" src="data:${profileEmployee.mediaFileData};base64, ${base64Img}" alt="" class="avatar-photo" width="160px" height="160px"/>
														</c:if>
													</div>
													<h5 class="text-center h5 mb-0" id="profileEmpName">${profileEmployee.empName}</h5>
													<p class="text-center text-muted font-14" ><span id="profileEmpRank">${profileEmployee.empRank}</span> <c:if test="${profileEmployee.teamName != '미배정'}"> | <span id="profileEmpTeamName">${profileEmployee.teamName}</span></c:if></p>
													<div class="profile-info">
														<h5 class="mb-20 h5 text-blue">사원 정보</h5>
														<ul>
															<li class="mb-1">
																<span>이메일:</span>
																<span id="profileEmpEmail">${profileEmployee.empEmail}</span>
															</li>
															<li class="mb-1">
																<span>연락처:</span>
																<span id="profileEmpTel">${profileEmployee.empTel}</span>
															</li>
														</ul>
													</div>
								                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
												</div>
								            </div>
								        </div>
								    </div> 	
								</div>
                                <!-- <div class="modal fade" id="deleteComment">
			                        <div class="modal-dialog" role="document">
			                            <div class="modal-content">
			                                <div class="modal-header">
			                                    <h5 class="modal-title">댓글 삭제</h5>
			                                </div>
			                                <div class="modal-body">
			                                    <div class="container-fluid">
			                                        <div class="row">
			                                        	댓글을 정말 삭제하시겠습니까?
			                                        </div>
			                                    </div>
			                                </div>
			                                <div class="modal-footer">
			                                    <button type="button" class="btn btn-primary">삭제</button>
			                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			                                </div>
			                            </div>
			                        </div>
		                		</div> -->
		                		
		                		<div class="modal fade" id="deleteComment">
			                        <div class="modal-dialog" role="document">
			                            <div class="modal-content">
			                                <div class="modal-header">
			                                    <h5 class="modal-title">댓글 삭제</h5>
			                                </div>
			                                <form action="deleteComment" method="post">
				                                <div class="modal-body">
				                                    <div class="container-fluid">
				                                        <div class="row">
				                                        	댓글을 정말 삭제하시겠습니까?
				                                        	<input type="hidden" id="boardNo" name="boardNo" value="${board.boardNo}">
				                                        	<input type="hidden" id="commentNoInput" name="commentNo">
				                                        </div>
				                                    </div>
				                                </div>
				                                <div class="modal-footer">
				                                    <button type="submit" class="btn btn-primary">삭제</button>
				                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				                                </div>
				                            </form>
			                            </div>
			                        </div>
		                		</div>
                                
                                <!-- 댓글 작성 -->
                                <%-- <div class="box-footer" style="">
                                	<img class="img-responsive img-circle img-sm" src="${pageContext.request.contextPath}/resources/images/testHuman.jpg" alt="Alt Text" width="40px" height="40px">
									<form action="#" method="post">
										<input type="text" class="form-control input-sm" placeholder="Press enter to post comment">
									</form>
								</div> --%>
								<div class="CommentWriter">
									<div class="comment_inbox">
										<span class="comment_inbox_name">
											<strong style="font-weight: 700; font-size: 0.875rem;">${employee.empName} </strong> 
											<c:if test="${employee.teamName == null or employee.teamName == '미배정'}">
												<span style="font-weight: 300; font-size: 0.8rem; color: #9097c4;">${employee.empRank}</span>
	                                       	</c:if>
	                                       	<c:if test="${employee.teamName != null and employee.teamName != '미배정'}">
												<span style="font-weight: 300; font-size: 0.8rem; color: #9097c4;">${employee.empRank} | ${employee.teamName}</span>
	                                       	</c:if>
											<%-- <span style="font-weight: 300; font-size: 0.8rem; color: #9097c4;">${employee.empRank} | ${employee.teamName}</span></span> --%>
                                       	</span>
                                       	<input type="hidden" id="boardNumber" value="${board.boardNo}">
										<textarea placeholder="댓글을 남겨보세요" 
												  id="commentText" 
												  rows="15" 
												  class="comment_inbox_text" 
												  onkeyup="setCommentInboaxStyle(this)"
												  ></textarea>
										<!-- <text placeholder="댓글을 남겨보세요" rows="1" class="comment_inbox_text" style="overflow: hidden; overflow-wrap: break-word; height: 17px; border: none;"></text> -->
										<!----><!---->
									</div>
									<div data-v-afadf0bc="" class="comment_attach">
										<div data-v-afadf0bc="" class="attach_box">
											<!-- <form action="#" class="dropzone">
	                                            <div class="form-group mb-0">
	                                                <div class="fallback">
	                                                    <input class="l-border-1" name="file" type="file" multiple="multiple">
	                                                </div>
	                                            </div>
	                                        </form> -->
	                                        <form action="#" class="dropzone">
											    <div class="form-group mb-0">
											        <div class="fallback">
											            <label for="fileInput" class="file-label">
											                <i class="icon-copy fa fa-paperclip" aria-hidden="true" style="transform: rotate(445deg);"></i> <!-- 파일 아이콘 -->
											            </label>
											            <!-- <input id="fileInput" class="l-border-1" name="file" type="file" multiple="multiple" style="display: none;"> -->
											            <input id="fileInput" class="l-border-1" name="file" type="file" multiple="multiple" style="display: none;">
											        </div>
											    </div>
											</form>
											<!-- <div class="pd-20 card-box mb-30">
												<div class="clearfix mb-20">
													<div class="pull-left">
														<h4 class="text-blue h4">첨부파일</h4>
													</div>
												</div>
												<form class="dropzone dz-clickable" action="#" id="my-awesome-dropzone">
													<div class="dz-default dz-message">
														<span>파일을 드롭하거나, 클릭하여 업로드 하세요</span>
													</div>
												</form>
											</div> -->
											<script>
											Dropzone.autoDiscover = false;
											$(".dropzone").dropzone({
											addRemoveLinks: true,
											removedfile: function (file) {
											var name = file.name;
											var _ref;
											return (_ref = file.previewElement) != null
											? _ref.parentNode.removeChild(file.previewElement)
											: void 0;
											},
											});
											</script>
										</div>
										<div class="register_box">
											<!-- <a href="#" role="button" class="button btn_register" onclick="register()">등록</a> -->
											<button href="#" role="button" class="button btn_register" onclick="register(this)">등록</button>
											<!-- <button class="button btn_register">등록</button> -->
											<script type="text/javascript">
												function register(button) {
													var comment = $("#commentText").val();
													
													if(comment == null || comment == "") {
														/* alert("댓글을 입력해주세요."); */
														$(button).attr("disabled", true);
													} else {
														$(button).attr("disabled", false);
														registerComment();
													}
												}
											</script>
										</div>
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
    <script src="${pageContext.request.contextPath}/resources/js/board.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/js/mail/dropzone.js"></script>
</body>

</html>