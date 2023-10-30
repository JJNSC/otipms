/*function filter(selectedItem) {
    var dropdownButton = document.querySelector(".btn-custom");
    dropdownButton.innerHTML = selectedItem.innerHTML;
}
*/
/*
$(init);

function init() {
	$("page-link").click(movePage);
}*/

function chooseInquiryType(option, pageNo) {
	console.log("두번째 option과 pageNo가 잘 오는지");
	console.log("option: " + option + "pageNo: " + pageNo);
	
	$.ajax({
		url: "/otipms/asncBoard",
		method: "GET",
		data: {
			inquiryType:option,
			pageNo:pageNo
		},
		success: function(data) {
			console.log(data);
			console.log(data.boardPager);
			console.log(data.boardList);
			
			//게시글 출력
			var htmlBoard = '';
			
			if(data.boardList.length != 0) {
				data.boardList.forEach(function(board, index) {
				/*$.each(data.boardList, function(index, board) {*/
					/*htmlBoard += '<tr>';*/
					htmlBoard += '<tr onclick="window.location.href=' + "'detailBoard?boardNo=" + board.boardNo + "'" + ';">';
					htmlBoard += '<td>' + board.boardNo + '</td>';
					htmlBoard += '<td>' + board.inquiryBoardType + '</td>';
					htmlBoard += '<td>';
					htmlBoard += '	' + board.boardTitle;
					if(board.mediaFileName != null) {
    					htmlBoard += '&nbsp;';
    					htmlBoard += '<i class="icon-copy fa fa-paperclip" aria-hidden="true" style="transform: rotate(445deg);"></i>';
					}
					if(board.commentCount != 0) {
    					htmlBoard += '&nbsp;';
    					htmlBoard += '<span class="text-red">[' + board.commentCount + ']</span>';
					}
					htmlBoard += '</td>';
					htmlBoard += '<td>' + board.empName + '</td>';

					var now = new Date();
					var writeDate = new Date(board.boardWriteDate);
					
					if(dateFormat(writeDate, 1) == dateFormat(now, 1)) {
    					htmlBoard += '<td>';
    					htmlBoard += '	' + dateFormat(writeDate, 2);
    					htmlBoard += '</td>';
					} else {
    					htmlBoard += '<td>';
    					htmlBoard += '	' + dateFormat(writeDate, 1);
    					htmlBoard += '</td>';
					}
					htmlBoard += '<td>' + board.boardHitcount + '</td>';
					htmlBoard += '</tr>';
				});
				
				$("tbody").html(htmlBoard);
				
				//페이저 출력
				var htmlPager = '';
				
				//동기식
				/*if(data.boardPager.groupNo > 1) {
					htmlPager += '<li class="page-item"><a class="page-link" href="board?pageNo=' + (data.boardPager.startPageNo-1) + '" tabindex="-1">이전</a></li>'
				}

				for(let i=data.boardPager.startPageNo; i<=data.boardPager.endPageNo; i++) {
					if(data.boardPager.pageNo == i) {
						htmlPager += '<input type="hidden" value="' + i + '">';
						htmlPager += '<li class="page-item active"><a class="page-link" href="board?pageNo=' + i + '">' + i + '</a></li>';
					} else {
						htmlPager += '<input type="hidden" value="' + i + '">';
						htmlPager += '<li class="page-item"><a class="page-link" href="board?pageNo=' + i + '">' + i + '</a></li>';
					}
				}
				
				if(data.boardPager.groupNo < data.boardPager.totalGroupNo) {
					htmlPager += '<input type="hidden" value="' + (data.boardPager.endPageNo+1) + '">';
					htmlPager += '<li class="page-item"><a class="page-link" href="board?pageNo=' + (data.boardPager.endPageNo+1) + '">다음</a></li>';
				}
				
				$(".pagination").html(htmlPager);*/
				
				if(data.boardPager.groupNo > 1) {
					htmlPager += '<input type="button" class="page-link" tabindex="-1" value="' + (data.boardPager.startPageNo-1) + '" onclick="movePageInquiry(this)">이전</input>'
				}

				for(let i=data.boardPager.startPageNo; i<=data.boardPager.endPageNo; i++) {
					if(data.boardPager.pageNo == i) {
						htmlPager += '<input type="button" class="page-link selected" value="' + i + '" onclick="movePageInquiry(this)">';
					} else {
						htmlPager += '<input type="button" class="page-link" value="' + i + '" onclick="movePageInquiry(this)">';
					}
				}
				
				if(data.boardPager.groupNo < data.boardPager.totalGroupNo) {
					htmlPager += '<input type="button" class="page-link" value="' + (data.boardPager.endPageNo+1) + '" onclick="movePageInquiry(this)">다음</input>';
				}
				
				$("nav").html(htmlPager);
				
				//페이저 버튼
				//$(".page-item").click(chooseInquiryType);
				
			}
		},
		error: function(error) {
			console.log(error);
		}
	});
	
}

function movePageNormal(pageNo) {
	
	$.ajax({
		url: "/otipms/asncBoard",
		method: "GET",
		data: {
			pageNo:pageNo
		},
		success: function(data) {
			console.log(data);
			console.log(data.boardPager);
			console.log(data.boardList);
			
			//게시글 출력
			var htmlBoard = '';
			
			if(data.boardList.length != 0) {
				data.boardList.forEach(function(board, index) {
				/*$.each(data.boardList, function(index, board) {*/
					/*htmlBoard += '<tr>';*/
					htmlBoard += '<tr onclick="window.location.href=' + "'detailBoard?boardNo=" + board.boardNo + "'" + ';">';
					htmlBoard += '<td>' + board.boardNo + '</td>';
					htmlBoard += '<td>';
					htmlBoard += '	' + board.boardTitle;
					if(board.mediaFileName != null) {
    					htmlBoard += '&nbsp;';
    					htmlBoard += '<i class="icon-copy fa fa-paperclip" aria-hidden="true" style="transform: rotate(445deg);"></i>';
					}
					if(board.commentCount != 0) {
    					htmlBoard += '&nbsp;';
    					htmlBoard += '<span class="text-red">[' + board.commentCount + ']</span>';
					}
					htmlBoard += '</td>';
					htmlBoard += '<td>' + board.empName + '</td>';

					var now = new Date();
					var writeDate = new Date(board.boardWriteDate);
					
					if(dateFormat(writeDate, 1) == dateFormat(now, 1)) {
    					htmlBoard += '<td>';
    					htmlBoard += '	' + dateFormat(writeDate, 2);
    					htmlBoard += '</td>';
					} else {
    					htmlBoard += '<td>';
    					htmlBoard += '	' + dateFormat(writeDate, 1);
    					htmlBoard += '</td>';
					}
					htmlBoard += '<td>' + board.boardHitcount + '</td>';
					htmlBoard += '</tr>';
				});
				
				$("tbody").html(htmlBoard);
				
				//페이저 출력
				var htmlPager = '';
				
				if(data.boardPager.groupNo > 1) {
					htmlPager += '<input class="page-link" tabindex="-1" value="' + (data.boardPager.startPageNo-1) + '" onclick="movePage(this)">이전</input>'
				}

				for(let i=data.boardPager.startPageNo; i<=data.boardPager.endPageNo; i++) {
					if(data.boardPager.pageNo == i) {
						htmlPager += '<input type="button" class="page-link selected" value="' + i + '" onclick="movePage(this)">';
					} else {
						htmlPager += '<input type="button" class="page-link" value="' + i + '" onclick="movePage(this)">';
					}
				}
				
				if(data.boardPager.groupNo < data.boardPager.totalGroupNo) {
					htmlPager += '<input type="button" class="page-link" value="' + (data.boardPager.endPageNo+1) + '" onclick="movePage(this)">다음</input>';
				}
				
				$("nav").html(htmlPager);
				
				//페이저 버튼
				//$(".page-item").click(chooseInquiryType);
				
			}
		},
		error: function(error) {
			console.log(error);
		}
	});
	
}

function dateFormat(date, type) {
    let month = date.getMonth() + 1;
    let day = date.getDate();
    let hour = date.getHours();
    let minute = date.getMinutes();
    let second = date.getSeconds();

    month = month >= 10 ? month : '0' + month;
    day = day >= 10 ? day : '0' + day;
    hour = hour >= 10 ? hour : '0' + hour;
    minute = minute >= 10 ? minute : '0' + minute;
    second = second >= 10 ? second : '0' + second;
    
    switch(type) {
    case 1: return date.getFullYear() + '-' + month + '-' + day;
    case 2: return hour + ':' + minute;
    default: return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute;
    }

    return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute;
}