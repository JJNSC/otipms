package com.otipms.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.otipms.dto.CC;
import com.otipms.dto.Message;
import com.otipms.interceptor.Login;
import com.otipms.security.EmpDetails;
import com.otipms.service.EmployeeService;
import com.otipms.service.MessageService;
import com.otipms.service.ProjectService;
import com.otipms.service.TeamService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/mail")
public class MailController {
	
	@Autowired
	private TeamService teamService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private MessageService messageService;
	//쪽지 수신함
	@Login
	@RequestMapping("/receivedMail")
	public String receivedMail(Model model, Authentication authentication) {
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		int empId = empDetails.getEmployee().getEmpId();
		
		List<Message> messages = messageService.getMyReceivedMessage(empId);
	    model.addAttribute("messages", messages);
		
		return "mail/receivedMail";
	}
	
	@PostMapping("/updateMessageImportant")
    @ResponseBody
    public String updateMessageImportant(@RequestParam("messageNo") int messageNo, Authentication authentication) {
		try {
			
			EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
			int empId = empDetails.getEmployee().getEmpId();
			
			Message message = new Message();
	        message.setMessageNo(messageNo);
	        message.setEmpId(empId);
	        
	        messageService.toggleMessageImportance(message);
        
        // 성공적으로 업데이트되었음을 클라이언트에 알립니다.
        return "success";
        } catch (Exception e) {
        	e.printStackTrace();
        	return "error";
        }
    }
	
	@PostMapping("/updateMessageTrash")
    @ResponseBody
    public String updateMessageTrash(@RequestParam("messageNo") int messageNo, Authentication authentication) {
		try {
			EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
			int empId = empDetails.getEmployee().getEmpId();
			
			Message message = new Message();
	        message.setMessageNo(messageNo);
	        message.setEmpId(empId);
	        
	        messageService.updateMessageTrash(message);
        
        // 성공적으로 업데이트되었음을 클라이언트에 알립니다.
        return "success";
        } catch (Exception e) {
        	e.printStackTrace();
        	return "error";
        }
    }
	
	@PostMapping("/updateCheckedDate")
    @ResponseBody
    public String updateCheckedDate(@RequestParam("ccNo") int ccNo, Authentication authentication) {
		try {
			EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
			int empId = empDetails.getEmployee().getEmpId();
			
			Message message = new Message();
	        message.setCcNo(ccNo);
	        message.setEmpId(empId);
	        
	        messageService.updateMessageChecked(message);
        
        // 성공적으로 업데이트되었음을 클라이언트에 알립니다.
        return "success";
        } catch (Exception e) {
        	e.printStackTrace();
        	return "error";
        }
    }
	
	//쪽지 발신함
	@Login
	@RequestMapping("/sentMail")
	public String sentMail(Model model, Authentication authentication) {
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		int empId = empDetails.getEmployee().getEmpId();
		
		List<Message> messages = messageService.getMySentMessage(empId);
	    model.addAttribute("messages", messages);
		return "mail/sentMail";
	}
	
	//중요 쪽지함
	@Login
	@RequestMapping("/importantMail")
	public String importantMail(Model model, Authentication authentication) {
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		int empId = empDetails.getEmployee().getEmpId();
		
		List<Message> messages = messageService.getMyImportantMessage(empId);
	    model.addAttribute("messages", messages);
		return "mail/importantMail";
	}
	
	//임시 보관함
	@Login
	@RequestMapping("/temporaryMail")
	public String temporaryMail(Model model, Authentication authentication) {
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		int empId = empDetails.getEmployee().getEmpId();
		
		List<Message> messages = messageService.getMyTemporaryMessage(empId);
	    model.addAttribute("messages", messages);
		return "mail/temporaryMail";
	}
	
	//쪽지 휴지통
	@Login
	@RequestMapping("/trashMail")
	public String trashMail(Model model, Authentication authentication) {
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		int empId = empDetails.getEmployee().getEmpId();
		
		List<Message> messages = messageService.getMyTrashMessage(empId);
	    model.addAttribute("messages", messages);
		return "mail/trashMail";
	}
	
	//쪽지 상세 내용
	@Login
	@RequestMapping("/detailMail")
	public String detailMail(@RequestParam("messageNo") int messageNo, Model model,Authentication authentication) {
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
	    model.addAttribute("employee", empDetails.getEmployee());
		
		List<Message> messageEmployee = messageService.detailMessageEmployee(messageNo);
		Message messageContent = messageService.detailMessageContent(messageNo);
		List<Message> messageMedia = messageService.detailMessageMediaFile(messageNo);
		
		model.addAttribute("messageEmployee", messageEmployee);
		model.addAttribute("messageContent", messageContent);
		model.addAttribute("messageMedia", messageMedia);
		
		return "mail/detailMail";
	}
	
	//쪽지 쓰기
	@Login
	@RequestMapping("/writeMail")
	public String writeMail(Model model,Authentication authentication) {
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		int empId = empDetails.getEmployee().getEmpId();
		
	    return "mail/writeMail";
	}
	
	@PostMapping("/sendMail")
	@ResponseBody
    public ResponseEntity<String> sendMail(@RequestBody Map<String, Object> request, Authentication authentication) {
		 	String title = (String) request.get("title");
		    String content = (String) request.get("content");
		    List<Map<String, Object>> recipients = (List<Map<String, Object>>) request.get("recipients");
		    List<Map<String, Object>> references = (List<Map<String, Object>>) request.get("references");
		    List<Map<String, Object>> blindCopies = (List<Map<String, Object>>) request.get("blindCopies");

			EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
			int mempId = empDetails.getEmployee().getEmpId();
			
		try {
			Date currentDate = new Date();
            // 쪽지 데이터 작성 및 저장
            Message message = new Message();
            message.setMessageTitle(title);
            message.setEmpId(mempId);
            message.setMessageContent(content);
            message.setMessageStatus(1); // Send 버튼 클릭 시 1로 설정
            message.setMessageReservedDate(currentDate);

            int messageId = messageService.writeMessage(message);

            // CC 데이터 작성 및 저장
            List<CC> ccList = new ArrayList<>();
            ccList.addAll(buildCCList(recipients, message.getMessageNo(), 1));
            ccList.addAll(buildCCList(references, message.getMessageNo(), 3));
            ccList.addAll(buildCCList(blindCopies, message.getMessageNo(), 4));
            
            CC newCC = new CC();
            newCC.setMessageNo(message.getMessageNo());
            newCC.setEmpId(mempId);
            newCC.setCcType(2);
            newCC.setMessageStatus(1);
            newCC.setCcCheckedDate(null);
            ccList.add(newCC);
            
            messageService.writeCC(ccList);

            // 첨부 파일 데이터 작성 및 저장
            /*List<MediaFile> mailMediaList = buildMailMediaList(attachmentFiles, messageId);
            messageService.writeMailMedia(mailMediaList);*/

            return new ResponseEntity<>("Mail sent successfully", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("Error sending mail", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
	
	private List<CC> buildCCList(List<Map<String, Object>> recipients, int messageNo, int ccType) {
	    List<CC> ccList = new ArrayList<>();
	    
	    for (Map<String, Object> recipient : recipients) {
	    	if (recipient.containsKey("employeeId")) {
	            Object empIdObject = recipient.get("employeeId");
	            try {
	                int employeeId = Integer.parseInt(empIdObject.toString());
	                
	                CC cc = new CC();
	                cc.setMessageNo(messageNo);
	                cc.setEmpId(employeeId);
	                cc.setCcType(ccType);
	                cc.setMessageStatus(1);
	                cc.setCcCheckedDate(null);

	                ccList.add(cc);
	            } catch (NumberFormatException e) {
	                log.info("올바른 정수가 아님: " + empIdObject);
	            }
	        } else {
	            log.info("employeeId라는 key가 없음");
	        }
	    }
	    return ccList;
	}

	/*private List<MediaFile> buildMailMediaList(List<MultipartFile> attachmentFiles, int messageNo) {
	    List<MediaFile> mailMediaList = new ArrayList<>();

	    for (MultipartFile attachmentFile : attachmentFiles) {
	        if (!attachmentFile.isEmpty()) {
	            MediaFile mediaFile = new MediaFile();
	            
	            mediaFile.setMessageNo(messageNo);
	            mediaFile.setMediaFileName(attachmentFile.getOriginalFilename());
	            mediaFile.setMediaFileType(attachmentFile.getContentType());
	            try {
	                // 파일 데이터를 바이트 배열로 변환하여 저장
	                mediaFile.setMediaFileData(attachmentFile.getBytes());
	            } catch (IOException e) {
	                
	                e.printStackTrace();
	            }
	            mailMediaList.add(mediaFile);
	        }
	    }
	    return mailMediaList;
	}*/
	
	//쪽지 사원 찾기
	@Login
	@RequestMapping("/findEmployee")
	public String findEmployee() {
	    
	    return "mail/findEmployee";
	}
}
