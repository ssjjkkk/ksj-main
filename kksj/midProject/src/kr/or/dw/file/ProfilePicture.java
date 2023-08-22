package kr.or.dw.file;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;

import kr.or.dw.member.service.IMemberService;
import kr.or.dw.member.service.MemberServiceImpl;
import kr.or.dw.member.vo.MemberVO;
import kr.or.dw.web.IAction;

public class ProfilePicture implements IAction{

   @Override
   public boolean isRedirect() {
      // TODO Auto-generated method stub
      return true;
   }

   @Override
   public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
      
//      HttpSession session = req.getSession();
//      System.out.println("현재 세션 :" + session);
//      System.out.println("유저넘버 : " + session.getAttribute("user_no"));
	   
	  
      MemberVO memberVo = new MemberVO();
      memberVo.setUser_no(Integer.parseInt(req.getParameter("user_no")));
      System.out.println("멤버 vo 에 담긴 유저 넘버 : " + memberVo.getUser_no() );
      String picFoldName = "" + memberVo.getUser_no();
      String realPath = "C:/upload/userProfile/" + picFoldName;
      
      String fileName = "";
      
      File fileUploadDirectory = new File(realPath);
      if(!fileUploadDirectory.exists()) {
         fileUploadDirectory.mkdirs();
      }
      
      MultipartRequest multi = new MultipartRequest(req, realPath, 100*1024*1024, "utf-8");
      fileName = multi.getFilesystemName("image");
      
      
      memberVo.setProfile(picFoldName + "/" + fileName);
      System.out.println("프로필 경로 : " + memberVo.getProfile());
      IMemberService service = MemberServiceImpl.getInstance();
      service.updateMemberPicPath(memberVo);
      
//      req.setAttribute("memberVo", memberVo.getUser_no());
      
      return req.getContextPath() + "/member/myinfo.do";
   }

}