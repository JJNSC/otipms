<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    
    <!-- theme meta -->
    <meta name="theme-name" content="quixlab" />
  
    <title>OTIPMS</title>
    <!-- Favicon icon -->
    <%-- <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png"> --%>
    <link rel="icon" type="image/jpeg" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/otipms_fav.jpg">
    <!-- Pignose Calender -->
    <link href="${pageContext.request.contextPath}/resources/plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
    <!-- Chartist -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/chartist/css/chartist.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
    
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/customStyle.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/index/mySchedule.js"></script>
	<style>
		.nk-sidebar{
			 height : 96%;
		}
		
		.tdl-holder-custom .labelCustom {
		    /* cursor: pointer; */
		    display: block;
		    line-height: 52px;
		    padding-left: 0;
		    position: relative;
		    margin: 0 !important;
		    color: #464a53;
		}
		
		.tdl-holder-custom input[type=checkbox] {
		    cursor: pointer;
		    opacity: 0;
		    position: absolute;
		}
		
		.tdl-holder-custom input[type=checkbox] + i {
		    background-color: #ddd;
		    display: block;
		    height: 20px;
		    position: absolute;
		    top: 15px;
		    width: 20px;
		    z-index: 1;
		}
		
		.tdl-holder-custom input[type=checkbox]:checked + i::after {
		    content: "\f00c";
		    font-family: 'fontAwesome';
		    display: block;
		    left: 1px;
		    position: absolute;
		    top: -17px;
		    z-index: 2;
		    color: #162336;
		}
		
		/* .tdl-holder-custom input[type=checkbox]:checked ~ span {
		    text-decoration: line-through;
		    position: relative;
		} */
		.tdl-holder-custom input[type=checkbox]:checked + label + span {
		    text-decoration: line-through;
		    position: relative;
		}
		
		.tdl-holder-custom li span {
		    margin-left: 35px;
		    font-weight: 500;
		    vertical-align: middle;
		    -webkit-transition: all .2s linear;
		    /* -moz-transition: all .2s linear;
		    -o-transition: all .2s linear; */
		    transition: all 0.2s linear;
		    
		    cursor:pointer;
		}
		
		/* .tdl-holder-custom label a {
		    color: #464a53;
		    line-height: normal;
		    height: 100%;
		    text-align: center;
		    text-decoration: none;
		    width: 50px;
		    transition: all 0.2s linear;
		    padding: 18px 0px;
		    font-size: 18px;
		    display: flex;
		    position: absolute;
		    right: 0;
		    display: inline-block;
		} */
		.tdl-holder-custom .labelCustom a {
		    color: #464a53;
		    line-height: normal;
		    height: 100%;
		    text-align: center;
		    text-decoration: none;
		    width: 50px;
		    transition: all 0.2s linear;
		    padding: 18px 0px;
		    font-size: 18px;
		    display: flex;
		    position: absolute;
		    right: 0;
		    display: inline-block;
		}
		
		[class^="ti-"], [class*=" ti-"] {
		    font-family: 'themify';
		    speak: none;
		    font-style: normal;
		    font-weight: normal;
		    font-variant: normal;
		    text-transform: none;
		    line-height: 1;
		    -webkit-font-smoothing: antialiased;
		    -moz-osx-font-smoothing: grayscale;
		    
		    cursor: pointer;
		}
		
		.ti-trash:before {
		    content: "\e605";
		}
		
		/* 수직 스크롤바 숨김 */
      ::-webkit-scrollbar {
          width: 0;
      }
      
      /* 수평 스크롤바 숨김 */
      ::-webkit-scrollbar-thumb {
          background: transparent;
      }
	</style>
	
</head>

<body>
	<jsp:include page="headernsidebar.jsp">
		<jsp:param name="employee" value="${employee}" />
		<jsp:param name="mf" value="${mf}" />
		<jsp:param name="base64Img" value="${base64Img}" />
	</jsp:include>
        <!--**********************************
            Content body start
        ***********************************-->
        <!-- <div style="min-height:764px; margin-left: 15.1875rem;"> -->
         <div style="height:810px; margin-left: 15.1875rem; margin-top:100px;">
        <!-- <script>
        	var element = document.getElementById('contentBody');
        	element.style.setProperty('min-height', '800px', 'important');
        </script> -->
            <div style="width:100%;padding-right:15px;padding-left:15px;margin-left:auto;margin-right:auto;margin-top:1rem;height:810px;">
            	<div class="row">
            		<div class="col-lg-9" style="padding-right: 0px;">
            			<div class="row" style="height: 52%;">
            				<!-- 프로젝트 진척률 -->
            				<div class="col-5" style="padding-right: 0px;">
            					<div class="card" style="height:48%; height: 26rem;">
		                            <div class="card-body">
		                                <h4 class="card-title mb-5" style="font-weight: bolder;">${project.projectName } 진척률</h4>
		                                <canvas id="myChart" style="width:100%;max-width:800px; height:270px;"></canvas>
		                                <script>
		                                	var beforeCnt = ${projectTaskCount.undoneTaskCnt};	
		                                	var nowCnt = ${projectTaskCount.proceedingTaskCnt};	
		                                	var finishCnt = ${projectTaskCount.finishedTaskCnt};	
		                                	var beforeRate = ${projectTaskCount.undoneTaskRate};	
		                                	var nowRate = ${projectTaskCount.proceedingTaskRate};	
		                                	var finishRate = ${projectTaskCount.finishedTaskRate};	
		                                
											var xValues = ["진행전 "+beforeRate+"%" ,"진행중 "+nowRate+"%", "완료 "+finishRate+"%"];
											var yValues = [beforeCnt, nowCnt, finishCnt];
											var barColors = [
												,
											  "#2b5797",
											  "#00aba9"
											];
											
											new Chart("myChart", {
											  type: "doughnut",
											  data: {
											    labels: xValues,
											    datasets: [{
											      backgroundColor: barColors,
											      data: yValues
											    }]
											  },
											  options: {
												    title: {
												      display: false,
												      text: "48.7% 진행중",
												      position: "bottom"
												    }
												  }
											});
										</script>
		                                <!-- <canvas id="doughutChart" width="500" height="250"></canvas> -->
		                            </div>
		                        </div>
            				</div>
            				<!-- 팀별 진척도 -->
            				<div class="col-7">
            					<div class="card " style="height:26rem;">
									<h4 class="card-title ml-4" style="font-weight: bolder; margin-top:30px;">팀별 진척도</h4>
									<div class="card-body pt-0" style="width:100%; overflow-y: auto;">
										<table class="table table-custom">
											<thead>
											    <tr>
											        <th style="width:8%" class="text-center">번호</th>
											        <th style="width:20%" class="text-center">팀명</th>
											        <th style="width:10%">팀장</th>
											        <th style="width:25%">진척률</th>
											        <th style="width:10%"></th>
											    </tr>
											</thead>
											<tbody style="overflow: scroll; width:100px;">
												<c:forEach var="team" items="${teamList}" varStatus="a">
													<c:forEach var="progressRate" items="${progressRateList}" varStatus="b">
														<c:if test="${a.index==b.index}">
															<tr class="reviewTitle table-hover" id="projectNo${project.projectNo }" >
																<td class="text-center">${team.teamNo }</td>
																<td class="text-center">
																	${team.teamName }
																</td>
				                                    			<td>${team.empName }</td>
																<td class="progressTd">
																	<c:if test="${progressRate < 20}">
																		<div class="progress" style="height: 9px">
																			<div class="progress-bar wow  progress-" style="width: ${progressRate}%; background-color:#dd2c00;" role="progressbar">
																				<span class="sr-only">60% Complete</span>
																			</div>
																		</div>
																	</c:if>
																	<c:if test="${20 <= progressRate and progressRate < 80}">
																		<div class="progress" style="height: 9px">
																			<div class="progress-bar wow  progress-" style="width: ${progressRate}%; background-color:#2b5797;" role="progressbar">
																				<span class="sr-only">60% Complete</span>
																			</div>
																		</div>
																	</c:if>
																	<c:if test="${80 <= progressRate}">
																		<div class="progress" style="height: 9px">
																			<div class="progress-bar wow  progress-" style="width: ${progressRate}%; background-color:#00aba9;" role="progressbar">
																				<span class="sr-only">60% Complete</span>
																			</div>
																		</div>
																	</c:if>
																</td>
																<td>
																	<h5 > <span class="float-right">${progressRate}%</span></h5>
																</td>
															</tr>
														</c:if>
													</c:forEach>
												</c:forEach>
										    </tbody>
										</table>
									</div>
								</div>
            				</div>
            			</div>
            			<!-- 공지사항 -->
            			<div class="row">
            				<div class="col-12">
            					<div class="card card-custom">
		                            <div class="card-body" style="height:304px;">
		                                <div class="card-title">
		                                    <h4 style="font-weight: bolder;">공지사항</h4>
		                                </div>
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
		                                        <tbody id="boardTbody">
		                                        	<c:if test="${fn:length(boardPagerMap.boardList) == 0}">
		                                        		<tr>
		                                        			<td></td>
		                                        			<td></td>
		                                        			<td colspan="2">게시글이 존재하지 않습니다.<td>
		                                        		</tr>
		                                        	</c:if>
		                                        	<c:if test="${fn:length(boardPagerMap.boardList) != 0}">
			                                        	<c:forEach var="board" items="${boardPagerMap.boardList}">
				                                       		<tr onclick="window.location.href='detailBoard?boardNo=${board.boardNo}';">
				                                                <td>${board.rnum}</td>
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
						                </div>
		                            </c:if>
		                        </div>
            				</div>
            			</div>
            		</div>
            		<!-- 일정 -->
            		<div class="col-lg-3">
            			<div class="card" style="height: 37.34rem; margin-bottom: 16px;">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4 style="font-weight: bolder;">개인 일정</h4>
                                    <input type="hidden" id="mainPageRole" value="${employee.role }">
                                </div>
                                <div class="row">
                                	<div class="col-lg-12">
                                        <a href="#" data-toggle="modal" data-target="#add-category" class="btn btn-primary btn-block" onclick="addScheduleBtn()"><i class="ti-plus f-s-12 m-r-5"></i> 일정 추가</a>
                                        <script type="text/javascript">
                                        	function addScheduleBtn() {
                                        		$("#addBtn").removeClass("d-none");
                                        		$("#updateBtn").addClass("d-none");
                                        	}
                                        </script>
                                        <div class="tdl-holder-custom m-t-20">
                                            <!-- <p>Drag and drop your event or click in the calendar</p> -->
                                            <ul id="todo_list" style="height: 723px; overflow: scroll; width: auto; margin-top: 20px;">
                                            	<c:forEach var="schedule" items="${scheduleList}">
						                            <li>
						                            	<strong class="labelCustom">
						                            		<label>
						                            			<c:if test="${schedule.scheduleChecked == true}">
							                            			<input type="checkbox" checked value="${schedule.scheduleNo}" onchange="applyStyle(this)">
						                            			</c:if>
						                            			<c:if test="${schedule.scheduleChecked == false}">
							                            			<input type="checkbox" value="${schedule.scheduleNo}" onchange="applyStyle(this)">
						                            			</c:if>
						                            			<i></i>
						                            		</label>
						                            		<c:if test="${schedule.scheduleChecked == true}">
						                            			<span onclick="openScheduleDetail(this)" data-toggle="modal" data-target="#add-category" style="text-decoration: line-through;">${schedule.scheduleName}</span>
					                            			</c:if>
					                            			<c:if test="${schedule.scheduleChecked == false}">
						                            			<span onclick="openScheduleDetail(this)" data-toggle="modal" data-target="#add-category">${schedule.scheduleName}</span>
					                            			</c:if>
					                            			<c:set var="now" value="<%= new java.util.Date() %>" />
					                            			<c:choose>
						                            			<c:when test="${fn:substring(schedule.scheduleStartDate, 0, 10) == fn:substring(now, 0, 10) and fn:substring(schedule.scheduleEndDate, 0, 10) == fn:substring(now, 0, 10)}">
							                            			<em style="position: absolute; right: 60px; font-style: normal; font-weight: normal;">
							                            				<fmt:formatDate value="${schedule.scheduleStartDate}" pattern="HH시"/> 
							                            				-
							                            				<fmt:formatDate value="${schedule.scheduleEndDate}" pattern="HH시"/> 
							                            			</em>
						                            			</c:when>
															    <c:otherwise>
							                            			<em style="position: absolute; right: 60px; font-style: normal; font-weight: normal;">
							                            				<fmt:formatDate value="${schedule.scheduleStartDate}" pattern="MM/dd"/> 
							                            				-
							                            				<fmt:formatDate value="${schedule.scheduleEndDate}" pattern="MM/dd"/> 
							                            			</em>
							                            		</c:otherwise>
															</c:choose>
						                            		<%-- <span onclick="openScheduleDetail(this)" data-toggle="modal" data-target="#add-category">${schedule.scheduleName}</span> --%>
						                            		<a role="button" class="ti-trash" onclick="deleteSchedule(this)"></a>
						                            	</strong>
						                            </li>
                                            	</c:forEach>
					                            <!-- <li><strong class="labelCustom"><label><input type="checkbox" onchange="applyStyle(this)"><i></i></label><span>Get up</span><a href="#" class="ti-trash"></a></strong></li> -->
					                        </ul>
                                            <!-- <div class="external-event bg-primary text-white" data-class="bg-primary"><i class="fa fa-move"></i>New Theme Release</div>
                                            <div class="external-event bg-success text-white" data-class="bg-success"><i class="fa fa-move"></i>My Event</div>
                                            <div class="external-event bg-warning text-white" data-class="bg-warning"><i class="fa fa-move"></i>Meet manager</div>
                                            <div class="external-event bg-dark text-white" data-class="bg-dark"><i class="fa fa-move"></i>Create New theme</div> -->
                                            <script>
										        function applyStyle(checkbox) {
										            var span = checkbox.parentElement.parentElement.querySelector("span");
										            if (checkbox.checked) {
										                span.style.textDecoration = "line-through";
										            } else {
										                span.style.textDecoration = "none";
										            }
										            
										            checkSchedule(checkbox.checked, checkbox.value);
										        }
										        function openScheduleDetail(span) {
										        	var checkbox = span.parentElement.querySelector("input");
										        	console.log("span: " + checkbox.value);
										        	var scheduleNo = checkbox.value;
										        	
										        	openDetailModal(scheduleNo);
										        	//$("#add-category").show();
										        }
										        function openDetail(strong) {
										        	var value = $(strong).find("input").val();
										        	console.log("strong: " + value)
										        }
										    </script>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 고객 정보 -->
            			<div class="card">
			                    <div class="card-body">
			                    	 <h4 class="card-title" style="font-weight: bolder;">고객 정보</h4>
			                    	 <table>
			                    	 	<thead>
			                    	 		<tr>
			                    	 			<th>고객 명</th>
			                    	 			<td style="width:32px;"></td>
			                    	 			<td>${client.empName}</td>
			                    	 		</tr>
			                    	 		<tr>
			                    	 			<th>고객 사</th>
			                    	 			<td ></td>
			                    	 			<td>${client.projectCompanyName}</td>
			                    	 		</tr>
			                    	 		<tr>
			                    	 			<th>연락처</th>
			                    	 			<td ></td>
			                    	 			<td>${client.empTel}</td>
			                    	 		</tr>
			                    	 		<tr>
			                    	 			<th>이메일</th>
			                    	 			<td ></td>
			                    	 			<td>${client.empEmail}</td>
			                    	 		</tr>
			                    	 	</thead>
			                    	 </table>
		                    	 </div>
		                    </div>
            		</div>
            	</div>
            	
            	<div class="row">
	                <div class="col-lg-4">
                        
                    </div>
                    <div class="col-lg-5">
					
                   </div>
                   <div class="col-lg-3">
                        
                        <!-- /# card -->
                    </div>
                </div>
                 <!-- Modal Add Category -->
                <div class="modal fade none-border" id="add-category">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title"><strong>일정 추가</strong></h4>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="row mb-3 d-none">
                                        <div class="col-md-12">
                                            <label class="control-label">일정 번호 (히든 처리할 예정)</label>
                                            <input id="scheduleNoInput" class="form-control form-white" type="text" name="category-name">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-12">
                                            <label class="control-label">일정 이름</label>
                                            <input id="scheduleNameInput" class="form-control form-white" type="text" name="category-name">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-12">
                                            <label class="control-label">일정 상세</label>
                                            <input id="scheduleCommentInput" class="form-control form-white" type="text" name="category-name">
                                        </div>
                                    </div>
                                    <!-- <div class="row mb-3">
                                        <div class="col-md-12">
                                            <label class="control-label">사용자 추가</label>
                                            <input class="form-control form-white" value="김종진 대리" type="text" name="category-name">
                                        </div>
                                    </div> -->
                                    <div class="row mb-3">
                                        <div class="col-md-12">
                                            <label for="example-datetime-local-input" class="control-label">시작일</label>
                                            <input id="scheduleStartDateInput" class="form-control form-white" type="datetime-local" name="category-name">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-12">
                                            <label for="example-datetime-local-input" class="control-label">종료일</label>
                                            <input id="scheduleEndDateInput" class="form-control form-white" type="datetime-local" name="category-name">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-12">
                                            <label class="control-label">색상</label>
                                            <select id="scheduleColorSelect" class="form-control form-white" name="category-color">
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
                                <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">취소</button>
                                <button id="addBtn" type="button" class="btn btn-danger waves-effect waves-light save-category" data-dismiss="modal" onclick="createSchedule()">저장</button>
                                <button id="updateBtn" type="button" class="btn btn-danger waves-effect waves-light save-category d-none" data-dismiss="modal" onclick="updateSchedule()">수정</button>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                <div class="row d-none" style="position:relative; bottom: 380px; height:28%;">
                    <!-- /# column -->
                    <div class="col-lg-9" style="padding-left:30px; padding-right:20px;">
                        
                        <!-- /# card -->
                    </div>
                    <div class="col-lg-3 col-md-3" style="height: 190px;position: relative;top:180px; ">
	                    <div >
		                    
	                	</div>
                	</div>
                <div class="d-none">
                    <div class="col-lg-6 col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Order Summary</h4>
                                <div id="morris-bar-chart"></div>
                            </div>
                        </div>
                        
                    </div>    
                </div>
                <div class="d-none">
                    <div class="col-xl-6 col-lg-12 col-sm-12 col-xxl-12">
                        <div class="card">
                            <div class="card-body">
                                    <!-- <h4 class="card-title mb-0">Store Location</h4> -->
                                <div id="world-map" style="height: 470px;"></div>
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
            <!-- <div class="copyright">
                <p>Copyright &copy; Designed & Developed by OTIPMS 2023</p>
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

    <!-- Chartjs -->
    <script src="${pageContext.request.contextPath}/resources/plugins/chart.js/Chart.bundle.min.js"></script>
    <!-- Circle progress -->
    <script src="${pageContext.request.contextPath}/resources/plugins/circle-progress/circle-progress.min.js"></script>
    <!-- Datamap -->
    <script src="${pageContext.request.contextPath}/resources/plugins/d3v3/index.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/topojson/topojson.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/datamaps/datamaps.world.min.js"></script>
    <!-- Morrisjs -->
    <script src="${pageContext.request.contextPath}/resources/plugins/raphael/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/morris/morris.min.js"></script>
    <!-- Pignose Calender -->
    <script src="${pageContext.request.contextPath}/resources/plugins/moment/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/pg-calendar/js/pignose.calendar.min.js"></script>
    <!-- ChartistJS -->
    <script src="${pageContext.request.contextPath}/resources/plugins/chartist/js/chartist.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>



    <script src="${pageContext.request.contextPath}/resources/js/index/dashboardPM.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/index/indexPM.js"></script>

</body>

</html>
