package secure.mbti.a.contorller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
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
	
	@Autowired
	private static BCrypt bcrypt;
	
	/*home.jsp로 이동*/
	@RequestMapping("home.do")
	public String home() {
		logger.info("MemberController home() " + new Date());
		return "home";
	}
	
	/*login.jsp로 이동*/
	@RequestMapping("login.do")
	public String login(MemberDto mem) {
		logger.info("MemberController login() " + new Date());
		return "login";
	}
	/*regi.jsp로 이동*/
	@RequestMapping("regi.do")
	public String regi(MemberDto mem) {
		logger.info("MemberController regi() " + new Date());
		return "regi";
	}
	/*login.jsp에서 로그인시 ID,PWD 검사*/
	@RequestMapping(value = "loginAf.do", method = RequestMethod.POST)
	public String loginAf(MemberDto dto, HttpServletRequest req) { 
		logger.info("MemberController loginAf() " + new Date());	
		/*입력한 ID의 SALT값 불러옴*/
		String salt=service.getSalt(dto.getId());
		String playpwd = dto.getPwd();
		
		/*가져온 SALT와 입력받은 PWD를 암호화*/
		String crypt = BCrypt.hashpw(playpwd, salt);
		
		/*암호화된 PWD를 DTO에 셋팅*/
		dto.setPwd(crypt);
		/*DB에 ID,PWD 일치하는지 비교 후 로그인 진입*/
		MemberDto mem = service.login(dto);
		System.out.println(mem.toString());
		if(mem != null) {	// 정상적인 로그인
			
			// login 정보를 저장 -> session 
			req.getSession().setAttribute("login", mem);			
			
			return "redirect:/introMBTI.do";   
		}
		else {	// 회원정보에 없음
			
			return "redirect:/login.do";
		}		
	}
	//regi.jsp에서 정보 입력 후 회원가입
	@RequestMapping(value = "regiAf.do", method = RequestMethod.POST)
	public String regiAf(MemberDto dto) {
		logger.info("MemberController regiAf() " + new Date());
		//salt를 생성
		String salt = BCrypt.gensalt();
		
		//설정한 pwd에 salting해서 해시 암호화
		String crypt = BCrypt.hashpw(dto.getPwd(), salt);

		//salt와 암호화된 pwd를 dto에 셋팅
		dto.setSalt(salt);
		dto.setPwd(crypt);
		
		//입력받은 정보들을 DB에 저장 후 확인
		int b = service.addmember(dto);
		if(b != 0) {
			System.out.println("가입되었음");
		}
		
		return "redirect:/login.do";
	}
	
	//회원가입시 ID중복 체크 
	@ResponseBody
	@RequestMapping(value = "idcheck.do", method = RequestMethod.POST)
	public String idcheck(String id) {
		logger.info("MemberController idcheck() " + new Date());
		
		//ID받아와서 중복된 아이디 있는지 확인 후 return
		int count = service.getId(id);	
		if(count > 0) {	// 아이디가 있음
			return "NO";
		}else {			// 아이디가 없음
			return "YES";
		}		
	}
	
	//회원가입시 email 중복 확인	
	@ResponseBody
	@RequestMapping(value = "emailcheck.do", method = RequestMethod.POST)
	public String emailcheck(String email) {
		logger.info("MemberController emailcheck() " + new Date());	
		
		//중복된 email 있는지 확인 후 return
		int count = service.getEmail(email);		
		if(count > 0) {	//email이 있음
			return "NO";
		}
		else {			//email이 없음
			return "YES";
		}
		
	}
	
	//회원가입시 닉네임 중복 확인
	@ResponseBody
	@RequestMapping(value = "aliascheck.do", method = RequestMethod.POST)
	public String aliascheck(String alias) {
		logger.info("MemberController aliascheck() " + new Date());	

		//중복된 alias가 있는지 확인 후 return
		int count = service.getAlias(alias);
		
		if(count > 0) {	//alias가 있음
			return "NO";
		}
		else {			//alias가 없음
			return "YES";
		}
		
	}
	
	//로그아웃
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {

		//세션 무효화 후 login페이지로 이동
		req.getSession().invalidate();
		req.getSession(true);
		return  "redirect:/login.do";
	}
	//로그인 실패시 알림을 위해 ajax통신
	@ResponseBody
	@RequestMapping(value = "idpwdcheck.do", method = RequestMethod.POST)
	public String idpwdcheck(MemberDto dto) {

		//입력받은 ID의 SALT를 불러옴
		String salt=service.getSalt(dto.getId());
		//ID가 존재하지 않아 SALT가 NULL이면 "NO" return
		if(salt == null) {
			return "NO";
		}
		//ID가 존재, ID의 SALT를 불러와서 PWD와 암호화
		String crypt = BCrypt.hashpw(dto.getPwd(), salt);
		//암호화된 PWD를 dto에 셋팅
		dto.setPwd(crypt);
		//ID와 PWD가 맞는지 확인
		int count = service.getIdpwdcheck(dto);
		
		if(count > 0) {
			return "YES";	//ID와 PWD가 일치
		}
		else {
			return "NO";	//ID와 PWD가 일치하지 않음
		}
		
	}
	
}
