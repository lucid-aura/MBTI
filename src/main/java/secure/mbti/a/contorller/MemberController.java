package secure.mbti.a.contorller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping("home.do")
	public String home() {
		logger.info("MemberController home() " + new Date());
		return "home";
	}
}
