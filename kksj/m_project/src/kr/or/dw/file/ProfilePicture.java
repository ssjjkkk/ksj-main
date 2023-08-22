package kr.or.dw.file;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import kr.or.dw.user.service.IUserService;
import kr.or.dw.user.service.UserServiceImpl;
import kr.or.dw.user.vo.UserVO;
import kr.or.dw.web.IAction;

public class ProfilePicture implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		IUserService service = UserServiceImpl.getInstance();
		HttpSession session = req.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");
		int user_no = vo.getUser_no();
		String picFoldName = "" + user_no;
		String realPath = "C:/upload/userProfile/" + picFoldName;
		
		String fileName = "";
		
		File fileUploadDirectory = new File(realPath);
		if(!fileUploadDirectory.exists()) {
			fileUploadDirectory.mkdirs();
		}
		
		MultipartRequest multi = new MultipartRequest(req, realPath, 100*1024*1024, "utf-8");
//		fileName = multi.getFilesystemName("selfie");
		
		Enumeration fileNames = multi.getFileNames();
		while(fileNames.hasMoreElements()) {
			fileName = multi.getFilesystemName((String) fileNames.nextElement());
			vo.setPic_path(picFoldName + "/" + fileName);
			
			service.updateUserPicPath(vo);
		}
		
		
		req.setAttribute("vo", vo);
		
		return "/user/myPageModResJson.jsp";
	}

}
