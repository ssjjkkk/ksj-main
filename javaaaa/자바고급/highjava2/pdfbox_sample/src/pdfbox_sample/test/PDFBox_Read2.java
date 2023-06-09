package pdfbox_sample.test;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.pdfbox.cos.COSName;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageTree;
import org.apache.pdfbox.pdmodel.graphics.image.PDImage;
import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject;
import org.apache.pdfbox.text.PDFTextStripper;

public class PDFBox_Read2 {

	public static void main(String[] args) throws IOException {
		
		File file = new File("//192.168.0.55/자바프로그래밍/조별과제_라이브러리매뉴얼(20230516)/발표자료/4조(김민기, 김민준, 김석준, 신철헌, 이지현)/PDFTest123.pdf");
		PDDocument testDocument = PDDocument.load(file);
		List<PDImageXObject> imageList = new ArrayList<>();
		PDPageTree pages = testDocument.getPages();
		PDPage page = pages.get(0);
		
		Iterable<COSName> objectNames = page.getResources().getXObjectNames();
		
		// PDF문서에서 텍스트 추출
		// PDFBOX의 주요 기능. PDFTextStripper 클래스의 getText()메서드를 이용하여 모든 텍스트 추출 가능
		
		PDFTextStripper pdfStriper = new PDFTextStripper();	// 인스턴스화
		String text = pdfStriper.getText(testDocument);		// PDF문서 페이지내용 검색, 텍스트를 String 객체형식으로 반환
		
		for (COSName imageObjectName : objectNames) {
			if (page.getResources().isImageXObject(imageObjectName)) {
			PDImageXObject imageInfo = (PDImageXObject) page.getResources().getXObject(imageObjectName);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageIO.write(imageInfo.getImage(), "jpg", baos);

			byte[] bytesimage = baos.toByteArray();
			String imageStr = Base64.getEncoder().encodeToString(bytesimage);
			imageList.add((PDImageXObject)imageStr);
			}
		}
		
		System.out.println(objectNames);
		System.out.println(text);
		
		testDocument.close();

	}

}
