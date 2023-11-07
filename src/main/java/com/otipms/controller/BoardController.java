package com.otipms.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.otipms.dto.Board;
import com.otipms.dto.BoardComment;
import com.otipms.dto.MediaFile;
import com.otipms.dto.Pager;
import com.otipms.dto.Team;
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
	private Team team = new Team();
	
	@Autowired
	public BoardService boardService;
	
	/**
	 * 게시판 이동
	 * @param boardType
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/board")
	public String board(@RequestParam(value="boardType", required=false, defaultValue="") String boardType
						, Model model
						, HttpSession session) {
		log.info("게시판 컨트롤러 통합");
		
		//처음 들어올 때와 상세를 눌렀다가 뒤로 왔을 때 실행이 된단 말이지?
		//근데 이게 상세를 눌렀다가 뒤로 왔을 때 알고 있어야 하는 게 뭐냐면? 1. 질의게시판이라면 카테고리 2. pageNo 3. 검색어 타입과 검색어  => 싹다 세션에 넣어버려??????
		//그럼 세션에 저장하는 때와 날리는 때를 알아야 한단 말이지
		//1. 질의 카테고리: 저장) 질의 카테고리를 선택했을 때 / 삭제) 다른 게시판으로 넘어갔을 때
		//2. pageNo: 저장) 페이지를 선택했을 때 / 삭제) 다른 게시판으로 넘어갔을 때, 질의 카테고리를 선택했을 때, 검색어를 검색했을 때
		//3. 검색어: 저장) 검색했을 때 / 삭제) 다른 게시판으로 넘어갔을 때, board 메소드를 요청했을 때
		//자 내 코드가 스파게티가 된 이유에는 1이랑 2 기능을 한 메소드로 같이 하려고 한 게 문제야. 그러니까 1 2 3 다 따로따로 만들자구
		//this.boardType = boardType;
		
		//Step1. 게시판 유형이 있는지 확인
		//Step1-1. 만약 없다면, 새로 추가 후 pageNo = 1
		//Step1-2. 만약 있고 이미 있는 유형과 지금 들어온 유형이 다르다면, 새롭게 메뉴를 선택해서 들어온 것이므로 pageNo는 무조건 1이 되어야 함
		//Step1-2. 만약 있고 이미 있는 유형과 지금 들어온 유형이 같다면, pageNo는 세션에서 꺼내야 함 But, 질의 게시판일 경우 inquiryType도 세션에 있는지 여부와 있다면 세션에서 꺼내야 함 (어차피 inquiryType 선택 시 pageNo는 1로 해줄거거든)
		//근데... 만약에 공지사항 3번페이지 들어갔다가 다른 뭐 인력관리 들어갔다가 다시 공지사항으로 들어오면 어떡하징..? 아 이래서 boardType을 BoardController에 귀속되게 만들어야 겠다... 초기화를 ""으로 해주고.. 근데 그렇게 되나....?????? 
		session.removeAttribute("searchType");
		session.removeAttribute("searchKeyword");
		
		String pageNo = "";
		String inquiryType = "";
		//세션에 저장되어 있는지 확인
		String boardTypeSession = (String) session.getAttribute("boardType");
		//세선에 저장되어 있지 않다면 현재 들어온 boardType으로 저장
		/*if(boardTypeSession == null) {
			session.setAttribute("boardType", boardType);
		} else {
			if(boardType.equals(boardTypeSession)) {
				
			} else {
				session.setAttribute("boardType", boardType);
			}
		} 근데 이게 결국 밑에 아니냐*/
		if(boardType.equals(boardTypeSession)) {
			pageNo = (String) session.getAttribute("pageNo");
			inquiryType = (String) session.getAttribute("inquiryType");
		} else {
			if(boardType.equals("")) {
				boardType = boardTypeSession;
			} else {
				session.setAttribute("boardType", boardType);
			}
			pageNo = "1";
			session.setAttribute("pageNo", pageNo);
			inquiryType = "전체";
			session.setAttribute("inquiryType", inquiryType);
		}
		
		if(boardType.equals("팀 게시판")) {
			team = boardService.getTeamName(LoginController.loginEmployee.getEmpId());
		}
		
		//게시글 목록 페이징
		//HashMap<String, Object> pageBoard(String pageNo, String boardType, String inquiryType, String searchType, String searchKeyword)
		Map<String, Object> boardPagerMap = pageBoard(pageNo, boardType, inquiryType, team.getTeamNo(), null, null);
		log.info("map이당 " + boardPagerMap);
		model.addAttribute("boardPagerMap", boardPagerMap);
		
		if(boardType.equals("질의 게시판")) {
			model.addAttribute("inquiryType", inquiryType);
		} else if(boardType.equals("팀 게시판")) {
			model.addAttribute("teamName", team.getTeamName());
		}
		
		model.addAttribute("employee", LoginController.loginEmployee);
	    model.addAttribute("base64Img", LoginController.profileImg);
	    model.addAttribute("mf", LoginController.multipartFile);
		return "board/boardList";
	}
	
	/**
	 * 질의유형 선택
	 * @param inquiryType
	 * @param session
	 * @return
	 */
	@RequestMapping("/chooseInquiryCategory")
	@ResponseBody
	public Map<String, Object> chooseInquiryCategory(String inquiryType, HttpSession session) {
		String pageNo = "1";
		String inquiryTypeSession = (String) session.getAttribute("inquiryType");
		
		if(inquiryType.equals(inquiryTypeSession)) {
			pageNo = (String) session.getAttribute("pageNo");
		} else {
			session.setAttribute("inquiryType", inquiryType);
			session.setAttribute("pageNo", pageNo);
		}
		
		//여기서 생각해야 할 점은 검색어를 검색한 후 카테고리를 선택했을의 경우입니다...
		String searchType = (String) session.getAttribute("searchType");
		String searchKeyword = "";
		if(searchType != null) {
			searchKeyword = (String) session.getAttribute("searchKeyword");
		} else {
			searchKeyword = null;
		}
	    
		//게시글 목록 페이징
		//HashMap<String, Object> pageBoardpageBoard(String pageNo, String boardType, String inquiryType, String searchType, String searchKeyword)
		Map<String, Object> map = pageBoard(pageNo, "질의 게시판", inquiryType, team.getTeamNo(), searchType, searchKeyword);
		log.info("map이당 " + map);
		return map;
	}
	
	/**
	 * 페이지 이동
	 * @param pageNo
	 * @param session
	 * @return
	 */
	@RequestMapping("/movePage")
	@ResponseBody
	public Map<String, Object> movePage(String pageNo, HttpSession session) {
		//여기는 단순 페이지 이동이기 때문에 뭐든 세션에 다 있을 거임!
		String boardType = (String) session.getAttribute("boardType");
		session.setAttribute("pageNo", pageNo);
		String inquiryType = (String) session.getAttribute("inquiryType");
		String searchType = (String) session.getAttribute("searchType");
		String searchKeyword = (String) session.getAttribute("searchKeyword");
		
		//게시글 목록 페이징
		//HashMap<String, Object> pageBoardpageBoard(String pageNo, String boardType, String inquiryType, String searchType, String searchKeyword)
		Map<String, Object> map = pageBoard(pageNo, boardType, inquiryType, team.getTeamNo(), searchType, searchKeyword);
		log.info("map이당 " + map);
		return map;
	}
	
	/**
	 * 검색
	 * @param searchType
	 * @param searchKeyword
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/searchBoard")
	public String searchBoard(String searchType, String searchKeyword, Model model, HttpSession session) {
		if(searchKeyword == "") {
			//searchType = null;
			String boardType = (String) session.getAttribute("boardType");
			//return "redirect:/board?boardType=" + boardType;
			session.removeAttribute("searchType");
			session.removeAttribute("searchKeyword");
		}
		
		String pageNo = "1";
		session.setAttribute("pageNo", pageNo);
		String boardType = (String) session.getAttribute("boardType");
		String inquiryType = (String) session.getAttribute("inquiryType");
		session.setAttribute("searchType", searchType);
		session.setAttribute("searchKeyword", searchKeyword);
		
		//게시글 목록 페이징
		//HashMap<String, Object> pageBoard(String pageNo, String boardType, String inquiryType, String searchType, String searchKeyword)
		Map<String, Object> boardPagerMap = pageBoard(pageNo, boardType, inquiryType, team.getTeamNo(), searchType, searchKeyword);
		log.info("map이당 " + boardPagerMap);
		model.addAttribute("boardPagerMap", boardPagerMap);
		
		if(boardType.equals("질의 게시판")) {
			model.addAttribute("inquiryType", inquiryType);
		} else if(boardType.equals("팀 게시판")) {
			model.addAttribute("teamName", team.getTeamName());
		}
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchKeyword", searchKeyword);
		
		model.addAttribute("employee", LoginController.loginEmployee);
	    model.addAttribute("base64Img", LoginController.profileImg);
	    model.addAttribute("mf", LoginController.multipartFile);
		return "board/boardList";
	}
	
	/**
	 * 페이저 및 게시판 리스트 생성
	 * @param pageNo
	 * @param boardType
	 * @param inquiryType
	 * @param searchType
	 * @param searchKeyword
	 * @return
	 */
	//자 이 메소드가 할 건 무엇이냐.
	//일단 페이지번호와 게시판 유형과 질의 게시판 카테고리와 검색어 타입과 검색어를 받아서 필요한 페이지를 전달만 해주는 역할!
	private HashMap<String, Object> pageBoard(String pageNo, String boardType, String inquiryType, int teamNo, String searchType, String searchKeyword) {
		
		// 게시글 총 개수 (searchType은 null이라도 들어가야 함)
		int totalBoardNum = boardService.getTotalBoardNum(boardType, inquiryType, teamNo, searchType, searchKeyword);
		
		// Pager 객체 생성 (게시글 행 수, 페이지 개수, 총 페이지 개수, 페이지 시작 번호) 후 select
		Pager boardPager = new Pager(5, 5, totalBoardNum, Integer.parseInt(pageNo));
		List<Board> boardList = boardService.getBoardList(boardPager, boardType, inquiryType, teamNo, searchType, searchKeyword);
		
		//pagination에 필요한 pager와 boardList를 map에 담아서 return 
		HashMap<String, Object> boardPagerMap = new HashMap<String, Object>();
		boardPagerMap.put("boardPager", boardPager);
		boardPagerMap.put("boardList", boardList);
		
		return boardPagerMap;
	}
	
	
	/**
	 * 게시글 작성 폼으로 이동
	 * @param model
	 * @return
	 */
	@RequestMapping("/writeBoard")
	public String writeBoard(@RequestParam(value="boardNo", required=false) String boardNo
							, Model model, HttpSession session) {
		log.info("글쓰기");
		
		if(boardNo == null || boardNo.equals("")) {
			String boardType = (String) session.getAttribute("boardType");
			model.addAttribute("boardType", boardType);
		} else {
			Board board = boardService.detailBoard(boardNo);
			model.addAttribute("board", board);
		}
		
		model.addAttribute("employee", LoginController.loginEmployee);
	    model.addAttribute("base64Img", LoginController.profileImg);
	    model.addAttribute("mf", LoginController.multipartFile);
		model.addAttribute("teamName", team.getTeamName());
		return "board/writeBoard";
	}
	
	/**
	 * 게시글 작성
	 * @param boardTitle
	 * @param myEditor
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/submitBoard") 
	public String submitBoard(@RequestParam(value="boardNo", required=false) String boardNo
							 , String inquiryType
							 , String boardTitle
							 , String myEditor
							 , @RequestParam(value="files", required=false) List<MultipartFile> files
							 , Model model
							 , HttpSession session) throws IOException {
		log.info("boardNo: " + boardNo);
		log.info("에디터 제목: " + boardTitle);
		log.info("에디터 내용: " + myEditor);
		log.info("파일 내용: " + files);
		
		if(boardNo == null || boardNo.equals("")) {
			//board 삽입
			Board board = new Board();
			board.setEmpId(LoginController.loginEmployee.getEmpId());
			board.setBoardTitle(boardTitle);
			board.setBoardContent(myEditor);
			String boardType = (String) session.getAttribute("boardType");
			board.setBoardTypeName(boardType);
			board.setInquiryBoardType(inquiryType);
			board.setTeamNo(team.getTeamNo());
			 
			int boardNoInserted = boardService.writeBoard(board);
			
			if(files.get(0).getBytes().length != 0) {
				for(MultipartFile mf : files) {
					MediaFile mediaFile = new MediaFile();
					mediaFile.setBoardNo(boardNoInserted);
					mediaFile.setMediaFileName(mf.getOriginalFilename());
					mediaFile.setMediaFileType(mf.getContentType());
					mediaFile.setMediaFileData(mf.getBytes());
					
					boardService.addBoardMediaFile(mediaFile);
				}
			}
			
			return "redirect:/board";
		} else {
			//board 수정
			Board board = new Board();
			board.setBoardNo(Integer.parseInt(boardNo));
			board.setBoardTitle(boardTitle);
			board.setBoardContent(myEditor);
			board.setInquiryBoardType(inquiryType);
			board.setTeamNo(team.getTeamNo());
			
			boardService.modifyBoard(board);
			
			MediaFile mediaFile = new MediaFile();
			mediaFile.setBoardNo(Integer.parseInt(boardNo));
			boardService.deleteBoardMediaFile(mediaFile);
			
			if(files.get(0).getBytes().length != 0) {
				for(MultipartFile mf : files) {
					mediaFile = new MediaFile();
					mediaFile.setBoardNo(Integer.parseInt(boardNo));
					mediaFile.setMediaFileName(mf.getOriginalFilename());
					mediaFile.setMediaFileType(mf.getContentType());
					mediaFile.setMediaFileData(mf.getBytes());
					
					boardService.addBoardMediaFile(mediaFile);
				}
			}
			
			return "redirect:/detailBoard?boardNo=" + boardNo;
		}
		
	}
	
	@RequestMapping("/insertBoardFileData")
	@ResponseBody
	/*public ResponseEntity<Map<String, Object>> insertBoardFileData(@RequestBody Map<String, Object> request) {
		List<Map<String, Object>> uploadedFiles =  (List<Map<String, Object>>) request.get("uploadedFiles");
		
		log.info("혹시 두번 출력되나..?" + request.get("uploadedFiled"));
		
		List<MediaFile> mediaFiles = new ArrayList<>();
        for (Map<String, Object> fileData : uploadedFiles) {
            MediaFile mediaFile = new MediaFile();
            mediaFile.setMediaFileName((String) fileData.get("name"));
            log.info("name..? " + (String) fileData.get("name"));
            mediaFile.setMediaFileType((String) fileData.get("type"));
            
            // Base64로 인코딩된 데이터를 디코딩하여 바이트 배열로 변환
            String base64Data = (String) fileData.get("data");
            byte[] mediaFileData = Base64.getDecoder().decode(base64Data);
            mediaFile.setMediaFileData(mediaFileData);
            
            log.info("mediaFile: " + mediaFile);
            mediaFiles.add(mediaFile);
        }
        

        Map<String, Object> response = new HashMap<>();
        response.put("messageId", "메롱");
           
        return new ResponseEntity<>(response, HttpStatus.OK);

	}*/
	public ResponseEntity<Map<String, Object>> insertBoardFileData(@RequestBody Map<String, Object> jsonData) {
		// JSON 데이터를 직접 처리
        List<Map<String, Object>> uploadedFiles = (List<Map<String, Object>>) jsonData.get("uploadedFiles");
		
		log.info("혹시 두번 출력되나..?" + jsonData.get("uploadedFiled"));
		
		List<MediaFile> mediaFiles = new ArrayList<>();
        for (Map<String, Object> fileData : uploadedFiles) {
            MediaFile mediaFile = new MediaFile();
            mediaFile.setMediaFileName((String) fileData.get("name"));
            log.info("name..? " + (String) fileData.get("name"));
            mediaFile.setMediaFileType((String) fileData.get("type"));
            
            // Base64로 인코딩된 데이터를 디코딩하여 바이트 배열로 변환
            String base64Data = (String) fileData.get("data");
            byte[] mediaFileData = Base64.getDecoder().decode(base64Data);
            mediaFile.setMediaFileData(mediaFileData);
            
            log.info("mediaFile: " + mediaFile);
            mediaFiles.add(mediaFile);
        }
        

        Map<String, Object> response = new HashMap<>();
        response.put("messageId", "메롱");
           
        return new ResponseEntity<>(response, HttpStatus.OK);

	}
	/**
	 * 게시글로 이동
	 * @param model
	 * @return
	 */
	@RequestMapping("/detailBoard")
	public String detailBoard(String boardNo, Model model) {
		
		//로그인 정보
		model.addAttribute("employee", LoginController.loginEmployee);
		model.addAttribute("base64Img", LoginController.profileImg);
		model.addAttribute("mf", LoginController.multipartFile);
		
		//게시글 조회
		Board board = boardService.detailBoard(boardNo);
		if(board.getMediaFileData() != null) {
			board.setBase64Img(Base64.getEncoder().encodeToString(board.getMediaFileData()));
		}
		model.addAttribute("board", board);
		
		//게시글 파일 조회
		List<MediaFile> mediaFiles = boardService.getBoardMediaList(boardNo);
		model.addAttribute("mediaList", mediaFiles);
		
		//댓글 조회
		List<BoardComment> boardCommentList = boardService.boardCommentList(boardNo);
		for(BoardComment comment : boardCommentList) {
			if(comment.getMediaFileData() != null) {
				comment.setBase64Img(Base64.getEncoder().encodeToString(comment.getMediaFileData()));
			}
			log.info(comment.getTeamName());
		}
		model.addAttribute("commentList", boardCommentList);
		model.addAttribute("teamName", team.getTeamName());
		return "board/detailBoard";
	}
	
	/**
	 * 댓글 작성
	 * @param boardNo
	 * @param comment
	 * @param newComment
	 * @return
	 */
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
	
	/**
	 * 게시글 삭제
	 * @param boardNo
	 * @return
	 */
	@RequestMapping("/deleteBoard")
	public String deleteBoard(String boardNo) {
		boardService.deleteBoard(boardNo);
		return "redirect:/board";
	}
	
	/**
	 * 댓글 삭제
	 * @param boardNo
	 * @param commentNo
	 * @return
	 */
	@RequestMapping("/deleteComment")
	public String deleteComment(String boardNo, String commentNo) {
		boardService.deleteBoardComment(commentNo);
		return "redirect:/detailBoard?boardNo=" + boardNo;
	}
	
	@RequestMapping("/blank")
	public String blank() {
		log.info("빈페이지");
		return "blank";
	}
	
}
