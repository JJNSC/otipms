package com.otipms.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.otipms.dto.Alarm;
import com.otipms.dto.CC;
import com.otipms.dto.MediaFile;
import com.otipms.dto.Message;
import com.otipms.interceptor.Login;
import com.otipms.security.EmpDetails;
import com.otipms.service.AlarmService;
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
	private MessageService messageService;
	
	//쪽지 수신함
	@Login
	@RequestMapping("/receivedMail")
	public String receivedMail(Model model, Authentication authentication) {
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		int empId = empDetails.getEmployee().getEmpId();
		
		List<Message> messages = messageService.getMyReceivedMessage(empId);
	    int cnt = messageService.getMyReceivedMessage(empId).size();
	    
		model.addAttribute("messages", messages);
		model.addAttribute("cnt", cnt);
	    model.addAttribute("employee", empDetails.getEmployee());
		
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
	        
	        Map<String, Object> parameters = new HashMap<>();
	        parameters.put("ccNo", ccNo);
	        parameters.put("empId", empId);
	        
	        Message messageCC = messageService.getMessageNoByCCNo(parameters);
	        
	        log.info("messageCC" + messageCC);
	        
	        int messageNo = messageCC.getMessageNo();
	        
	        /*Map<String, Object> param = new HashMap<>();
	        param.put("messageNo", messageNo);
	        param.put("empId", empId);
	        Alarm alarm = alarmService.setAlarm(param);
	        
	        alarmService.updateAlarmChecked(alarm);*/
	        
        
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
	
	@GetMapping("/download/{fileId}")
    public ResponseEntity<Resource> downloadFile(@PathVariable int fileId) {
        // fileId에 해당하는 BLOB 데이터를 데이터베이스에서 가져옵니다.
        MediaFile mediaFile = messageService.getMediaFile(fileId);

        ByteArrayResource resource = new ByteArrayResource(mediaFile.getMediaFileData());
        // 클라이언트에게 BLOB 데이터를 응답으로 전달합니다.
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + mediaFile.getMediaFileName())
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(resource);
    }
	//쪽지 쓰기
	@Login
	@RequestMapping("/writeMail")
	public String writeMail(Model model,Authentication authentication) {
		
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		int empId = empDetails.getEmployee().getEmpId();
		
		model.addAttribute("employee", empDetails.getEmployee());
	    return "mail/writeMail";
	}
	
	@PostMapping("/upload")
    public ResponseEntity<String> handleUploadAndSave(@RequestParam("files") List<MultipartFile> files) {
		try {
			log.info("업로드 : " + files.toString());
            return new ResponseEntity<>("File upload successful", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("File upload failed", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
	
	@PostMapping("/sendMail")
	@ResponseBody
    public ResponseEntity<Map<String, Object>> sendMail(@RequestBody Map<String, Object> request, Authentication authentication) {
		 	String title = (String) request.get("title");
		    String content = (String) request.get("content");
		    List<Map<String, Object>> recipients = (List<Map<String, Object>>) request.get("recipients");
		    List<Map<String, Object>> references = (List<Map<String, Object>>) request.get("references");
		    List<Map<String, Object>> blindCopies = (List<Map<String, Object>>) request.get("blindCopies");
		    List<Map<String, Object>> uploadedFiles = (List<Map<String, Object>>) request.get("uploadedFiles");
		    
			EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
			int mempId = empDetails.getEmployee().getEmpId();
			
			Date currentDate = new Date();
            // 쪽지 데이터 작성 및 저장
            Message message = new Message();
            message.setMessageTitle(title);
            message.setEmpId(mempId);
            message.setMessageContent(content);
            message.setMessageStatus(1); // Send 버튼 클릭 시 1로 설정
            message.setMessageReservedDate(currentDate);

            messageService.writeMessage(message);
            
            int messageId = message.getMessageNo();
            
            log.info("messageId: " + messageId);
            
            List<Map<String, Object>> attachments = (List<Map<String, Object>>) request.get("attachments");
            if (attachments != null) {
                for (Map<String, Object> attachment : attachments) {
                    messageService.updateFile(messageId, mempId);
                }
            }
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
            newCC.setMessageChecked(0);
            newCC.setCcCheckedDate(null);
            ccList.add(newCC);
            
            log.info("ccList : " + ccList);
            
            messageService.writeCC(ccList);
            
            List<MediaFile> mediaFiles = new ArrayList<>();
            for (Map<String, Object> fileData : uploadedFiles) {
                MediaFile mediaFile = new MediaFile();
                mediaFile.setEmpId(mempId);
                mediaFile.setMessageNo(messageId);
                mediaFile.setMediaFileName((String) fileData.get("name"));
                mediaFile.setMediaFileType((String) fileData.get("type"));
                
                // Base64로 인코딩된 데이터를 디코딩하여 바이트 배열로 변환
                String base64Data = (String) fileData.get("data");
                byte[] mediaFileData = Base64.getDecoder().decode(base64Data);
                mediaFile.setMediaFileData(mediaFileData);
                mediaFiles.add(mediaFile);
            }
            
            messageService.uploadAndSave(mediaFiles);
            
            Map<String, Object> response = new HashMap<>();
            response.put("messageId", messageId);
            	
            return new ResponseEntity<>(response, HttpStatus.OK);
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
	                cc.setMessageChecked(1);
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
	
	//쪽지 사원 찾기
	@Login
	@RequestMapping("/findEmployee")
	public String findEmployee() {
	    
	    return "mail/findEmployee";
	}
}
