package com.otipms.controller;

import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.otipms.dto.Board;
import com.otipms.dto.BoardComment;
import com.otipms.dto.Pager;
import com.otipms.service.BoardService;

import lombok.extern.slf4j.Slf4j;

/**
 * 게시판 컨트롤러
 * @author 이은지
 *
 */
@Controller
@Slf4j
public class BoardController {
	private String boardType;
	
	private String inquiryType;

	@Autowired
	public BoardService boardService;
	
	@RequestMapping("/blank")
	public String blank() {
		log.info("빈페이지");
		return "blank";
	}
	
	@RequestMapping("/board")
	public String board(@RequestParam(value="pageNo", required=false, defaultValue="1") String pageNo
						, @RequestParam(value="boardType", required=false) String boardType
						, Model model
						, HttpSession session) {
		inquiryType = null;
		log.info("게시판 컨트롤러 통합");
		if(boardType == null || boardType.equals("")) {
			if(this.boardType == null) {
				this.boardType = "공지사항";
			}
		} else {
			this.boardType = boardType;
		}
		
		model.addAttribute("boardType", this.boardType);
		model.addAttribute("employee", LoginController.loginEmployee);
		
		log.info("pageNo가 뭐길래..." + pageNo);
		
		//게시글 목록 페이징
		//HashMap<String, Object> pageBoard(int rowNo, int pageNo, String inquiryType, HttpSession session)
		Map<String, Object> boardPagerMap = pageBoard(5, Integer.parseInt(pageNo), null, session);
		model.addAttribute("boardPagerMap", boardPagerMap);
		return "board/boardList";
	}
	
	@RequestMapping("/asncBoard")
	@ResponseBody
	public Map<String, Object> pageBoardList(@RequestParam(value="pageNo", required=false, defaultValue="1") String pageNo
											 , @RequestParam(value="inquiryType", required=false) String inquiryType
											 , HttpSession session) {
		
		log.info("자 3번째 과연 pageNo와 inquiryType은 어떻게 왔을 것인가?");
		log.info("pageNo: " + pageNo + "inquiryType: " + inquiryType);
		
		if(inquiryType == null || inquiryType.equals("")) {
			if(this.inquiryType == null) {
				this.inquiryType = "전체";
			}
		} else {
			this.inquiryType = inquiryType;
		
			// 정규식 패턴
	        String pattern = "전체|시스템 관리|아키텍처|DBA";
	        
	        // 정규식 검색
	        Pattern inquiryTypePattern = Pattern.compile(pattern);
	        Matcher matcher = inquiryTypePattern.matcher(inquiryType);
	        
	        if (matcher.find()) {
	        	this.inquiryType = matcher.group(); // 매칭된 부분 추출
	            log.info(inquiryType);
	        } else {
	        	//일치한 걸 찾지 못했을 경우
	        	this.inquiryType = null;
	        }
		}
		
		//게시글 목록 페이징
		//HashMap<String, Object> pageBoard(int rowNo, int pageNo, String inquiryType, HttpSession session)
		Map<String, Object> map = pageBoard(5, Integer.parseInt(pageNo), this.inquiryType, session);
		log.info("map이당 " + map);
		return map;
	}
	
	/**
	 * 후에 ajax로 이동할 때 정석과 다른지 참고하기
	 * 게시글 페이저
	 * @param pageNo
	 * @param session
	 * @return
	 */
	/*@GetMapping("/moveBoardPage")
	@ResponseBody
	public HashMap<String, Object> moveInquiryPage(String pageNo, HttpSession session) {
		int bno = Integer.parseInt(session.getAttribute("BoardNo").toString());
		int totalProductInquiryNum = detailViewService.getTotalProductInquiryNum(bno);
		
		Pager productInquiryPager = new Pager(5, 5, totalProductInquiryNum, Integer.parseInt(pageNo));
		List<ProductInquiry> productInquiryList = detailViewService.getProductInquiryList(productInquiryPager, bno);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("productInquiryPager", productInquiryPager);
		map.put("productInquiryList", productInquiryList);
		
		return map;
	}*/
	
	private HashMap<String, Object> pageBoard(int rowNo, int pageNo, String inquiryType, HttpSession session) {
		/* 이것이 정석!
		//브라우저에서 pageNo가 넘어오지 않았을 경우
		if(pageNo == null) {
			//세션에 저장되어 있는지 확인
			pageNo = (String) session.getAttribute("pageNo");
			//세선에 저장되어 있지 않다면 "1"로 초기화
			if(pageNo == null) {
				pageNo = "1";
			}
		}
		//문자열을 정수로 변환 후 세션에 pageNo 저장
		int intPageNo = Integer.parseInt(pageNo);
		session.setAttribute("pageNo", pageNo);
		*/
		
		//만약 세션을 다시 컨트롤러에 줘야 한다면 => 보내주기
		//만약 세션에 있느 값을 integer로 변환을 못한다면 => 위의 정석으로 
		//브라우저에서 pageNo가 넘어오지 않았을 경우
		if(pageNo == 0) {
			//세션에 저장되어 있는지 확인
			pageNo = (Integer) session.getAttribute("pageNo");
			//세선에 저장되어 있지 않다면 "1"로 초기화
			if(pageNo == 0) {
				pageNo = 1;
			}
		}
		session.setAttribute("pageNo", pageNo);
		
		// 게시글 총 개수
		int totalBoardNum = boardService.getTotalBoardNum(boardType, inquiryType);
		
		// Pager 객체 생성 (게시글 행 수, 페이지 개수, 총 페이지 개수, 페이지 시작 번호) 후 select
		Pager boardPager = new Pager(rowNo, 5, totalBoardNum, pageNo);
		List<Board> boardList = boardService.getBoardList(boardPager, boardType, inquiryType);
		
		//pagination에 필요한 pager와 boardList를 map에 담아서 return 
		HashMap<String, Object> boardPagerMap = new HashMap<String, Object>();
		boardPagerMap.put("boardPager", boardPager);
		boardPagerMap.put("boardList", boardList);
		
		return boardPagerMap;
	}
	
	/*@RequestMapping("/writeBoard")
	public String writeBoard(String boardType, Model model) {
		log.info("글쓰기");
		log.info("글쓰기 게시판 타입: " + boardType);
		this.boardType = boardType;
		model.addAttribute("boardType", boardType);
		model.addAttribute("employee", LoginController.loginEmployee);
		return "board/writeBoard";
	}*/
	
	/**
	 * 게시글 작성 폼으로 이동
	 * @param model
	 * @return
	 */
	@RequestMapping("/writeBoard")
	public String writeBoard(Model model) {
		log.info("글쓰기");
		model.addAttribute("boardType", boardType);
		model.addAttribute("employee", LoginController.loginEmployee);
		return "board/writeBoard";
	}
	
	/**
	 * 게시글 작성
	 * @param boardTitle
	 * @param myEditor
	 * @param model
	 * @return
	 */
	@RequestMapping("/submitBoard") 
	public String submitBoard(String inquiryType, String boardTitle, String myEditor, Model model) {
		log.info("에디터 제목: " + boardTitle);
		log.info("에디터 내용: " + myEditor);
		
		//board 삽입
		Board board = new Board();
		board.setEmpId(LoginController.loginEmployee.getEmpId());
		board.setBoardTitle(boardTitle);
		board.setBoardContent(myEditor);
		board.setBoardTypeName(boardType);
		board.setInquiryBoardType(inquiryType);
		
		boardService.writeBoard(board);
		
		return "redirect:/board";
	}
	
	/*@RequestMapping("/detailBoard")
	public String detailBoard(String boardType, Model model) {
		log.info("상세글");
		model.addAttribute("boardType", boardType);
		model.addAttribute("employee", LoginController.loginEmployee);
		return "board/detailBoard";
	}*/
	
	/**
	 * 게시글로 이동
	 * @param model
	 * @return
	 */
	@RequestMapping("/detailBoard")
	public String detailBoard(String boardNo, Model model) {
		
		//로그인 정보
		model.addAttribute("employee", LoginController.loginEmployee);
		
		//게시글 조회
		Board board = boardService.detailBoard(boardNo);
		board.setBase64Img(Base64.getEncoder().encodeToString(board.getMediaFileData()));
		model.addAttribute("board", board);
		
		//댓글 조회
		List<BoardComment> boardCommentList = boardService.boardCommentList(boardNo);
		for(BoardComment comment : boardCommentList) {
			comment.setBase64Img(Base64.getEncoder().encodeToString(comment.getMediaFileData()));
		}
		model.addAttribute("commentList", boardCommentList);
		return "board/detailBoard";
	}
	
	@RequestMapping("/writeComment")
	//@ResponseBody
	public String writeComment(String boardNo, String comment, String newComment) {
		log.info(comment);
		log.info(newComment);
		
		BoardComment boardComment = new BoardComment();
		boardComment.setBoardNo(Integer.parseInt(boardNo));
		boardComment.setEmpId(LoginController.loginEmployee.getEmpId());
		boardComment.setCommentContent(comment);
		
		boardService.writeComment(boardComment);
		
		//리다이렉트하면 조회수가 늘어나네.....
		return "redirect:/detailBoard?boardNo=" + boardNo;
	}

}
