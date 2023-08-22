package kr.or.dw.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.service.MemberService;

@Controller
public class CommonController {
	
	@Autowired
	private MemberService memberService;

//	@RequestMapping(value="/common/loginForm", method=RequestMethod.GET)
	@GetMapping("/common/loginForm")
//	@PostMapping("/common/loginForm")
	public String loginForm(HttpServletResponse res) throws Exception {
		String url = "/common/loginForm";
		
		return url;
	}
	
	@RequestMapping("/common/login")
	public String login(String id, String pwd, HttpSession session) throws SQLException{
		String url = "redirect:/index.do";
	
		memberService.login(id, pwd, session);
		
		return url;
	}
	
	@RequestMapping("/index")
	public ModelAndView index(ModelAndView mnv) {
		String url = "/common/main";
		
//		mnv.addAllObjects("menuList", menuList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
}
