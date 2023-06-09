package pdfbox_sample.test;

import java.io.*;
import java.util.Scanner;
import org.apache.pdfbox.pdmodel.*;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.text.*;

public class PDFBox_Scanner2 {	

	public static void main(String[] args) throws IOException {
		Scanner scanner = new Scanner(System.in); 
        System.out.print("PDF 파일명을 입력하세요: ");
        String fileName = scanner.nextLine(); 
        System.out.print("입력할 내용: ");
        String text = scanner.nextLine(); 

        try (PDDocument document2 = new PDDocument()) {
            PDPage page = new PDPage();
            document2.addPage(page);
            PDPageContentStream contentStream = new PDPageContentStream(document2, page);
            contentStream.beginText();
            contentStream.setFont(PDType1Font.TIMES_ROMAN, 12);
            contentStream.newLineAtOffset(100, 700);
            contentStream.showText(text);
            contentStream.endText();
            contentStream.close();
            document2.save("//192.168.0.55/자바프로그래밍/조별과제_라이브러리매뉴얼(20230516)/발표자료" + fileName + ".pdf"); 
            
            // PDF 파일이 저장되면 다음 문장이 실행됩니다.
            System.out.println("PDF 파일이 성공적으로 저장되었습니다.");
            System.out.println("만든이 : 김민기");
        } catch (IOException e) {
            System.err.println("PDF 파일을 저장하지 못했습니다.");
            e.printStackTrace();
        }
        
    }
}
