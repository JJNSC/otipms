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
  
    <title>Quixlab - Bootstrap Admin Dashboard Template by Themefisher.com</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon.png">
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
        <div style="height:810px; margin-left: 15.1875rem; margin-top:100px;">
        <!-- <script>
        	var element = document.getElementById('contentBody');
        	element.style.setProperty('min-height', '800px', 'important');
        </script> -->
        <!-- <div class="content-body"> -->
            <!-- <div class="container-fluid mt-3" style="height 739px;"> -->
            <div style="width:100%;padding-right:15px;padding-left:15px;margin-left:auto;margin-right:auto;margin-top:1rem;height:810px;">
            	<div class="row">
	                <div class="col-lg-4">
                        <div class="card" style="height:48%;">
                            <div class="card-body">
                                <h4 class="card-title mb-4" style="color:#616161; font-weight: bolder;">${me.empName } 님 작업 진척률</h4>
                                <c:if test="${employeeTaskCount.undoneTaskCnt==0&&employeeTaskCount.proceedingTaskCnt==0&&employeeTaskCount.finishedTaskCnt==0 }">
                                	<div class="text-center"><h4 style="color:#9097c4; font-weight: 400; margin-top:30%;">할당된 작업이 없습니다.</h4></div>
                                </c:if>
                                <c:if test="${employeeTaskCount.undoneTaskCnt!=0||employeeTaskCount.proceedingTaskCnt!=0||employeeTaskCount.finishedTaskCnt!=0 }">
	                                <canvas id="myChart" style="width:100%;max-width:600px"></canvas>
	                                <script>
	                                	var beforeCnt = ${employeeTaskCount.undoneTaskCnt};	
	                                	var nowCnt = ${employeeTaskCount.proceedingTaskCnt};	
	                                	var finishCnt = ${employeeTaskCount.finishedTaskCnt};	
	                                	var beforeRate = ${employeeTaskCount.undoneTaskRate};	
	                                	var nowRate = ${employeeTaskCount.proceedingTaskRate};	
	                                	var finishRate = ${employeeTaskCount.finishedTaskRate};	
	                                
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
								</c:if>
                                <!-- <canvas id="doughutChart" width="500" height="250"></canvas> -->
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
					<div class="card " style="height:48%; ">
						<h4 class="card-title ml-5" style="font-weight: bolder;color:#616161;margin-top:30px;">업무 별 진척도</h4>
						<div class="card-body pt-0" style="width:100%; overflow-y: auto;">
							<table class="table table-custom">
								<thead>
								    <tr>
								        <th style="width:10%" class="text-center">번호</th>
								        <th style="width:3%"></th>
								        <th style="width:30%" >업무이름</th>
								        <th style="width:20%">업무 시작일</th>
								        <th style="width:20%">업무 종료일</th>
								        <th style="width:15%">진행상태</th>
								    </tr>
								</thead>
								<tbody style="overflow: scroll; width:100px;">
									<c:forEach var="task" items="${taskList}" varStatus="a">
										<tr class="reviewTitle table-hover" >
											<td class="text-center">${a.index+1}</td>
											<td></td>
											<td >
												${task.taskName }
											</td>
                                   			<td>
                                   				<fmt:formatDate pattern="yyyy-MM-dd" value="${task.taskStartDate}"/>
                                   			</td>
											<td>
												<c:if test="${task.taskEndDate==null }">
													<div style="padding-left :30% ;">--</div>
												</c:if>
												<c:if test="${task.taskEndDate!=null }">
													<fmt:formatDate pattern="yyyy-MM-dd" value="${task.taskEndDate }"/>
												</c:if>
											</td>
											<td >
												<c:if test="${task.taskStatus=='진행완료'}">
													<span style="color:#00aba9;font-weight: bold;">${task.taskStatus}</span>
												</c:if>
												<c:if test="${task.taskStatus=='진행중'}">
													<span style="color:#2b5797;font-weight: bold;">${task.taskStatus}</span>
												</c:if>
												<c:if test="${task.taskStatus=='진행전'}">
													<span style="color:#b5b5b5; font-weight: bold;">${task.taskStatus}</span>
												</c:if>
											</td>
										</tr>
									</c:forEach>
							    </tbody>
							</table>
						</div>
					</div>
                   </div>
					<div class="col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4 style="color:#616161; font-weight: bolder;">개인 일정</h4>
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
                                    <div class="row mb-3">
                                        <div class="col-md-12">
                                            <label class="control-label">일정 번호 (히든 처리할 예정)</label>
                                            <input id="scheduleNoInput" class="form-control form-white" type="text" name="category-name">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-12">
                                            <label class="control-label">일정 이름</label>
                                            <input id="scheduleNameInput" class="form-control form-white" value="ㅇㅅㅇ 회의" type="text" name="category-name">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-12">
                                            <label class="control-label">일정 상세</label>
                                            <input id="scheduleCommentInput" class="form-control form-white" value="토즈모임센터 서울대입구역에서 9시 회의" type="text" name="category-name">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-12">
                                            <label class="control-label">사용자 추가</label>
                                            <input class="form-control form-white" value="김종진 대리" type="text" name="category-name">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-12">
                                            <label for="example-datetime-local-input" class="control-label">시작일</label>
                                            <input id="scheduleStartDateInput" class="form-control form-white" type="date" name="category-name">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-12">
                                            <label for="example-datetime-local-input" class="control-label">종료일</label>
                                            <input id="scheduleEndDateInput" class="form-control form-white" type="date" name="category-name">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-12">
                                            <label class="control-label">색상</label>
                                            <select id="scheduleColorSelect" class="form-control form-white" data-placeholder="표시 색상을 고르세여" name="category-color">
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
                <div class="row" style="position:relative; bottom: 385px; height:28%;">
                    <!-- /# column -->
                    <div class="col-lg-9" style=" padding-right:10px;">
                        <div class="card card-custom">
                            <div class="card-body" style="height:304px;]">
                                <div class="card-title">
                                    <h4 style="font-weight: bolder;color:#616161;">공지사항</h4>
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
                        <!-- /# card -->
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



    <script src="${pageContext.request.contextPath}/resources/js/index/dashboardPE.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/index/indexPM.js"></script>

</body>

</html>
