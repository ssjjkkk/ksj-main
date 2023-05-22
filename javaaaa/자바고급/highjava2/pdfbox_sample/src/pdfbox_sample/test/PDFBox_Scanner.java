package pdfbox_sample.test;

import java.io.*;
import java.util.Scanner; // 추가
import org.apache.pdfbox.pdmodel.*;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.text.*;

public class PDFBox_Scanner {	

	public static void main(String[] args) throws IOException {
		Scanner scanner = new Scanner(System.in);
		 System.out.print("PDF 파일이 있는 경로를 입력하세요: ");
		 String path = scanner.nextLine(); // 사용자 입력 받기
		 scanner.close();

		 // PDF 파일 읽기
		 PDDocument document = PDDocument.load(new File(path));
		 PDFTextStripper stripper = new PDFTextStripper();
		 String text = stripper.getText(document);
		 System.out.println(text);
		 System.out.println("PDF 파일 읽기가 완료되었습니다.");
		 System.out.println("만든이 : 김민기");
		 document.close();
	}
}