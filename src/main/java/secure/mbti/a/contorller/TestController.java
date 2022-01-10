package secure.mbti.a.contorller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import secure.mbti.a.dto.WorldCupDto;
import secure.mbti.a.service.WorldCupService;


@Controller
public class TestController {

	private static Logger logger = LoggerFactory.getLogger(TestController.class);

	@Autowired
	WorldCupService service;
	
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(){ 
		logger.info("TestController home() " + new Date());
		return "home";
	}

	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login(){ 
		logger.info("TestController login() " + new Date());
		return "login";
	}

	@RequestMapping(value = "enfp.do", method = RequestMethod.GET)
	public String enfp(){ 
		logger.info("TestController enfp() " + new Date());
		return "enfp";
	}

	@RequestMapping(value = "worldcup.do", method = RequestMethod.GET)
	public String worldcup(Model model){ 
		logger.info("TestController worldcup() " + new Date());
		List<WorldCupDto> list = service.worldcuplist("food");
		model.addAttribute("worldcuplist", list);
		return "worldcup";
	}
	
	@ResponseBody
	@RequestMapping(value = "worldcup.do", method = RequestMethod.POST)
	public String choice() {
		logger.info("TestController choice() " + new Date());		
		return "menu";
	}
	
}
