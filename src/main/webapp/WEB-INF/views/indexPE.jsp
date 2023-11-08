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
                   <div class="col-lg-3" style="height:70%;">
					    <div class="card" >
					        <div class="card-body px-0">
					            <h4 class="card-title px-4 mb-3">Todo</h4>
					            <div class="todo-list">
					                <div class="tdl-holder">
					                    <div class="tdl-content">
					                        <ul id="todo_list" style="height: 337px;">
					                            <li><label><input type="checkbox"><i></i><span>Get up</span><a href='#' class="ti-trash"></a></label></li>
					                            <li><label><input type="checkbox" checked><i></i><span>Stand up</span><a href='#' class="ti-trash"></a></label></li>
					                            <li><label><input type="checkbox"><i></i><span>Don't give up the fight.</span><a href='#' class="ti-trash"></a></label></li>
					                            <li><label><input type="checkbox" checked><i></i><span>Do something else</span><a href='#' class="ti-trash"></a></label></li>
					                            <li><label><input type="checkbox" checked><i></i><span>Do something else</span><a href='#' class="ti-trash"></a></label></li>
					                            <li><label><input type="checkbox" checked><i></i><span>Do something else</span><a href='#' class="ti-trash"></a></label></li>
					                            <li><label><input type="checkbox" checked><i></i><span>Do something else</span><a href='#' class="ti-trash"></a></label></li>
					                            <li><label><input type="checkbox" checked><i></i><span>Do something else</span><a href='#' class="ti-trash"></a></label></li>
					                            <li><label><input type="checkbox" checked><i></i><span>Do something else</span><a href='#' class="ti-trash"></a></label></li>
					                            <li><label><input type="checkbox" checked><i></i><span>Do something else</span><a href='#' class="ti-trash"></a></label></li>
					                            <li><label><input type="checkbox" checked><i></i><span>Do something else</span><a href='#' class="ti-trash"></a></label></li>
					                            <li><label><input type="checkbox" checked><i></i><span>Do something else</span><a href='#' class="ti-trash"></a></label></li>
					                        </ul>
					                    </div>
					                    <div class="px-4">
					                        <input type="text" class="tdl-new form-control" placeholder="Write new item and hit 'Enter'...">
					                    </div>
					                </div>
					            </div>
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
		                                                <td>${board.boardNo}</td>
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
