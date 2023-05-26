package kr.or.dw.user.action;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.dw.user.service.IUserService;
import kr.or.dw.user.service.UserServiceImpl;
import kr.or.dw.user.vo.UserVO;
import kr.or.dw.util.CryptoUtil;
import kr.or.dw.web.IAction;

public class InsertUserAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		IUserService service = UserServiceImpl.getInstance();

		UserVO userVo = new UserVO();
		String userId = req.getParameter("userid");
		String nick = req.getParameter("nick");
				
		// 비밀번호 암호화
		String user_pass = req.getParameter("password");
		try {
			user_pass = CryptoUtil.sha512(user_pass);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		userVo.setId(userId);
		userVo.setNick(nick);
		userVo.setPass(user_pass);
		
		int user_no = service.insertUser(userVo);
		req.setAttribute("user_no", user_no);
		
		return "/main.jsp";
	}

}
