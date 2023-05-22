package pdfbox_sample.test;

import java.awt.Color;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDFont;
import org.apache.pdfbox.pdmodel.font.PDType0Font;
import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject;

public class PDFTest {

   public static void main(String[] args) throws IOException {
      
      // 문서 객체 생성 
      PDDocument doc = new PDDocument();
      
      // 페이지 만들기
      PDPage page = new PDPage();
      doc.addPage(page);
      doc.save("//192.168.0.55/자바프로그래밍/조별과제_라이브러리매뉴얼(20230516)/발표자료/4조(김민기, 김민준, 김석준, 신철헌, 이지현)/PDFTest123.pdf");
      System.out.println("PDF created / PDF 생성됨");
      
      File file = new File("//192.168.0.55/자바프로그래밍/조별과제_라이브러리매뉴얼(20230516)/발표자료/4조(김민기, 김민준, 김석준, 신철헌, 이지현)/PDFTest123.pdf");
      if(!file.exists()) {
         file.mkdir();
      }
      
      // 문서, 페이지 불러오기
      doc = PDDocument.load(file);
      page = doc.getPage(0);
      
      // 텍스트 넣기
      InputStream fontStream = new FileInputStream("//192.168.0.55/자바프로그래밍/조별과제_라이브러리매뉴얼(20230516)/발표자료/4조(김민기, 김민준, 김석준, 신철헌, 이지현)/NanumGothic.ttf");
      
      // 폰트 불러오기
      PDFont font = PDType0Font.load(doc, fontStream);   
      PDPageContentStream cs = new PDPageContentStream(doc, page);
      
      String text1 = "PDF테스트 파일입니다";
      String text2 = " ";
      String text3 = "다음줄에 텍스트를 입력합니다.";
      
      cs.beginText();
      cs.setFont(font, 15);
      // 텍스트 줄 간격, 위치 설정
      cs.setLeading(15);
      cs.newLineAtOffset(25, 700);
      cs.showText(text1);
      cs.newLine();
      cs.showText(text2);
      cs.newLine();
      cs.showText(text3);
      cs.endText();
      System.out.println("text 입력완료");   
      
      // 이미지 넣기
      PDImageXObject pdImage = PDImageXObject.createFromFile("//192.168.0.55/자바프로그래밍/조별과제_라이브러리매뉴얼(20230516)/발표자료/4조(김민기, 김민준, 김석준, 신철헌, 이지현)/test1.jpg", doc); 
      
      cs.drawImage(pdImage, 350, 550, 200, 200);
      System.out.println("Image inserted");
      
      cs.moveTo(PDRectangle.A4.getWidth()/2, PDRectangle.A4.getHeight());
      cs.lineTo(PDRectangle.A4.getWidth()/2, 0);
      cs.stroke();
      System.out.println("줄긋기 완료");
      cs.close();
      
      doc.save(new File("//192.168.0.55/자바프로그래밍/조별과제_라이브러리매뉴얼(20230516)/발표자료/4조(김민기, 김민준, 김석준, 신철헌, 이지현)/PDFTest123.pdf"));
      
      doc.close();

   }
   
}