package secure.mbti.a.contorller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import secure.mbti.a.dto.MemberDto;
import secure.mbti.a.service.MemberService;




@Controller
public class MemberController {
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	SqlSession session;
	
	@Autowired
	MemberService service;
	
	@RequestMapping("home.do")
	public String home() {
		logger.info("MemberController home() " + new Date());
		return "home";
	}
	
	@RequestMapping("login.do")
	public String login(MemberDto mem) {
		logger.info("MemberController login() " + new Date());
		return "login";
	}
	
	@RequestMapping("regi.do")
	public String regi(MemberDto mem) {
		logger.info("MemberController regi() " + new Date());
		return "regi";
	}
	
	@RequestMapping(value = "loginAf.do", method = RequestMethod.POST)
	public String loginAf(MemberDto dto, HttpServletRequest req) { // request == HttpServletRequest
		logger.info("MemberController loginAf() " + new Date());		
		
		MemberDto mem = service.login(dto);
		if(mem != null) {	// 정상적인 로그인
			
			// login 정보를 저장 -> session 
			req.getSession().setAttribute("login", mem);			
			
			return "redirect:/introMBTI.do";
		}
		else {		// 회원정보에 없음
			
			return "redirect:/login.do";
		}		
	}
	@RequestMapping(value = "regiAf.do", method = RequestMethod.POST)
	public String regiAf(MemberDto dto) {
		logger.info("MemberController regiAf() " + new Date());
		System.out.println(dto.toString());
		int b = service.addmember(dto);
		if(b != 0) {
			System.out.println("가입되었음");
		}
		
	//	return "login"; // login.jsp
	//	return "login.do"; // login.do.jsp
		
		return "redirect:/login.do";
	}
	
	@ResponseBody
	@RequestMapping(value = "idcheck.do", method = RequestMethod.POST)
	public String idcheck(String id) {
		logger.info("MemberController idcheck() " + new Date());		
		System.out.println("id:" + id);
		
		int count = service.getId(id);
		System.out.println("count:" + count);		
		if(count > 0) {	// 아이디가 있음
			return "NO";
		}else {			// 아이디가 없음
			return "YES";
		}		
	}
	
	@ResponseBody
	@RequestMapping(value = "emailcheck.do", method = RequestMethod.POST)
	public String emailcheck(String email) {
		logger.info("MemberController emailcheck() " + new Date());	
		System.out.println("email : "+email);
		
		int count = service.getEmail(email);
		
		if(count > 0) {
			return "NO";
		}
		else {
			return "YES";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "aliascheck.do", method = RequestMethod.POST)
	public String aliascheck(String alias) {
		logger.info("MemberController aliascheck() " + new Date());	
		System.out.println("alias : "+alias);
		
		int count = service.getAlias(alias);
		
		if(count > 0) {
			return "NO";
		}
		else {
			return "YES";
		}
		
	}
	
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		System.out.println("도착");
		req.getSession().invalidate();
		req.getSession(true);
		return  "redirect:/login.do";
	}
	
}
