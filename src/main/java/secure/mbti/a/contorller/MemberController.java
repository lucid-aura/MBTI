package secure.mbti.a.contorller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import secure.mbti.a.dto.MemberDto;
import secure.mbti.a.service.MemberService;




@Controller
public class MemberController {
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
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
			
			return "redirect:/board_free.do?page=1";   // intro로 교체해야됩니다 22 01 14
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
	
}
