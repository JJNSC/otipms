package com.otipms.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.otipms.dto.Employee;
import com.otipms.interceptor.Login;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PoiController {
	
	@Login
	@PostMapping("/multiRegister")
	public String multiRegister(@RequestParam("file") MultipartFile excelFile, @RequestParam("excelSheetName") String excelSheetName) throws IOException { //파일 경로, 파일 명, 시트명 받아와야함.
		log.info("엑셀 파일 : "+excelFile.getOriginalFilename());
		log.info("시트 명 : "+excelSheetName);
		System.out.println(excelFile.getOriginalFilename());
		
		String filePath = "C:\\FileStore";
		String fileNm = excelFile.getOriginalFilename();
	
	    FileInputStream file = new FileInputStream(new File(filePath, fileNm));
	
	    // 엑셀 파일로 Workbook instance를 생성한다.
	    XSSFWorkbook workbook = new XSSFWorkbook(file);
	    
	    XSSFSheet sheet;
	    
	 
	    if(excelSheetName.equals("") || excelSheetName.equals(null)){
	    	// workbook의 첫번째 sheet를 가저온다.
	    	sheet = workbook.getSheetAt(0);
	    }else {
	    	 //만약 특정 이름의 시트를 찾는다면 
	    	sheet = workbook.getSheet(excelSheetName);
	    }
	    
	    
	    System.out.println(excelFile.getOriginalFilename());
	    
	    //XSSFSheet 
	
	    
	    
	    // 만약 모든 시트를 순회하고 싶으면
	    // for(Integer sheetNum : workbook.getNumberOfSheets()) {
	    //      XSSFSheet sheet = workbook.getSheetAt(i);
	    // }
	    // 아니면 Iterator<Sheet> s = workbook.iterator() 를 사용해서 조회해도 좋다.
	
	    // 모든 행(row)들을 조회한다.
	    Iterator<Row> rowIterator = sheet.iterator();
	    while (rowIterator.hasNext()) {
	        Row row = rowIterator.next();
	
	        // 각각의 행에 존재하는 모든 열(cell)을 순회한다.
	        Iterator<Cell> cellIterator = row.cellIterator();
	        for (int i = 0; i < 1; i++) { // 첫 번째 행은 건너뜀
                rowIterator.next();
            }
	        Employee employee = new Employee();
	        int i =0;
	
	        while (cellIterator.hasNext()) {
	            Cell cell = cellIterator.next();
	
	            // cell의 타입을 하고, 값을 가져온다.
	            switch (cell.getCellType()) {
	                case NUMERIC:
	                    System.out.print((int) cell.getNumericCellValue() + "\t"); //getNumericCellValue 메서드는 기본으로 double형 반환
	                    break;
	                case STRING:
	                    System.out.print(cell.getStringCellValue() + "\t");
	                    if(i==0) {
	                    	employee.setEmpId(parseInt(cell.getStringCellValue()));
	                    }else if(i==1) {
	                    	employee.setEmpName(cell.getStringCellValue());
	                    }else if(i==2) {
	                    	employee.setEmpRank(cell.getStringCellValue());
	                    }else if(i==3) {
	                    	employee.setEmpTel(cell.getStringCellValue());
	                    }else if(i==4) {
	                    	/*employee.set(cell.getStringCellValue());*/
	                    }else if(i==5) {
	                    	employee.setEmpName(cell.getStringCellValue());
	                    }else if(i==6) {
	                    	employee.setEmpName(cell.getStringCellValue());
	                    }
	                    break;
	            }
	        }
	        System.out.println();
	    }
	    file.close();
		      
	    return "redirect:/employeeManagement/employeeList";
    }

	private int parseInt(String stringCellValue) {
		// TODO Auto-generated method stub
		return 0;
	}
}

