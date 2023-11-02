package com.otipms.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.otipms.service.EmployeeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PoiRestController {
	
	@Autowired
	private EmployeeService employeeService;
	
	// 업로드된 파일을 Excel 파일로 분석하는 메서드
	private boolean isExcelFile(byte[] fileBytes) {
	    try {
	        // 업로드된 파일을 워크북으로 읽어서 Excel 파일인지 확인
	        Workbook workbook = WorkbookFactory.create(new ByteArrayInputStream(fileBytes));
	        return workbook.getNumberOfSheets() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false; // Excel 파일이 아님
	    }
	}
	
	@PostMapping("/restMultiRegister")
    @ResponseBody
    public List<Map<String, String>> multiRegister(
            @RequestParam("file") MultipartFile excelFile,
            @RequestParam("excelSheetName") String excelSheetName
    ) throws IOException {
        List<Map<String, String>> dataList = new ArrayList<>();

        if (!excelFile.isEmpty()) {
            try {
                Workbook workbook = new XSSFWorkbook(excelFile.getInputStream());
                Sheet sheet = excelSheetName.isEmpty() ? workbook.getSheetAt(0) : workbook.getSheet(excelSheetName);

                Iterator<Row> rowIterator = sheet.iterator();
                int skipRows = 1; // Skip header row

                while (rowIterator.hasNext()) {
                    Row row = rowIterator.next();

                    if (skipRows > 0) {
                        skipRows--;
                        continue;
                    }

                    Iterator<Cell> cellIterator = row.cellIterator();
                    Map<String, String> rowData = new HashMap<>();

                    while (cellIterator.hasNext()) {
                        Cell cell = cellIterator.next();

                        // Convert cell value to string
                        cell.setCellType(CellType.STRING);
                        rowData.put(String.valueOf(cell.getColumnIndex()), cell.getStringCellValue());
                    }

                    dataList.add(rowData);
                }

                workbook.close();
            } catch (IOException e) {
                e.printStackTrace();
                return null;
            }
        }

        return dataList;
    }
}

