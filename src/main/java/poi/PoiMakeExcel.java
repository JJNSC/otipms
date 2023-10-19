package poi;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class PoiMakeExcel {
	
	public static String filePath = "C:\\FileStore";
    public static String fileNm = "poi_making_file_test.xlsx";

    public static void main(String[] args) {

        // 빈 Workbook 생성
        XSSFWorkbook workbook = new XSSFWorkbook();

        // 빈 Sheet를 생성
        XSSFSheet sheet = workbook.createSheet("employee data");

        // Sheet를 채우기 위한 데이터들을 Map에 저장
        Map<String, Object[]> data = new TreeMap<>();
        data.put("1", new Object[]{"사원번호", "사원명", "직책", "연락처", "프로젝트", "팀", "권한"});
        data.put("2", new Object[]{"1000001", "김진성", "부장", "010-1111-1111","프로젝트 2번째", "개발2팀","팀장"});
        data.put("3", new Object[]{"1010001", "김진성", "사원", "010-1111-2222","PMS 제작 프로젝트", "개발2팀","팀원"});
        data.put("4", new Object[]{"1000002", "김종진", "부장", "010-2222-3333","프로젝트 2번째", "개발1팀","팀장"});
        data.put("5", new Object[]{"1010002", "김종진", "선임", "010-3333-4444","본격 취업 프로젝트", "개발1팀","팀원"});
        data.put("6", new Object[]{"1000000", "이은지", "부장", "010-0000-0000", "PMS 제작 프로젝트","개발3팀","팀장"});
        data.put("7", new Object[]{"1010000", "이은지", "사원", "010-9999-9999","본격 취업 프로젝트", "개발3팀","팀원"});
        data.put("8", new Object[]{"1020000", "오티아이", "고객사", "010-5555-5555","PMS 제작 프로젝트", "",""});
        

        // data에서 keySet를 가져온다. 이 Set 값들을 조회하면서 데이터들을 sheet에 입력한다.
        Set<String> keyset = data.keySet();
        int rownum = 0;

        // 알아야할 점, TreeMap을 통해 생성된 keySet는 for를 조회시, 키값이 오름차순으로 조회된다.
        for (String key : keyset) {
            Row row = sheet.createRow(rownum++);
            Object[] objArr = data.get(key);
            int cellnum = 0;
            for (Object obj : objArr) {
                Cell cell = row.createCell(cellnum++);
                if (obj instanceof String) {
                    cell.setCellValue((String)obj);
                } else if (obj instanceof Integer) {
                    cell.setCellValue((Integer)obj);
                }
            }
        }

        try {
            FileOutputStream out = new FileOutputStream(new File(filePath, fileNm));
            workbook.write(out);
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
