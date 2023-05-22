package kr.or.dw.user.action;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.dw.user.service.IUserService;
import kr.or.dw.user.service.UserServiceImpl;
import kr.or.dw.user.vo.UserVO;
import kr.or.dw.util.CryptoUtil;
import kr.or.dw.web.IAction;

public class UserInsertAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		IUserService service = UserServiceImpl.getInstance();
		
//		String email = req.getParameter("email");
//		String pass = req.getParameter("pass");
//		String nick = req.getParameter("nick");
//		String name = req.getParameter("name");
//		String birS = req.getParameter("bir");
//		String gender = req.getParameter("gender");
//		
		UserVO userVo = new UserVO();
//		
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//		Date bir;
//		try {
//			bir = format.parse(birS);
//			userVo.setBir(bir);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		userVo.setEmail(email);
//		userVo.setPass(pass);
//		userVo.setNick(nick);
//		userVo.setName(name);
//		userVo.setGender(gender);
		
		BeanUtils bean = new BeanUtils();
		
		try {
			bean.populate(userVo, req.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		// 비밀번호 암호화
		String user_pass = req.getParameter("pass");
		try {
			user_pass = CryptoUtil.sha512(user_pass);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		userVo.setPass(user_pass);
		
		int user_no = service.insertUser(userVo);
		req.setAttribute("user_no", user_no);
		
		return "/user/joinSuccess.jsp";
	}

}
