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
public class WorldCupController {

	private static Logger logger = LoggerFactory.getLogger(WorldCupController.class);

	@Autowired
	WorldCupService service;
	/* 임시 controller */
	
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(){ 
		logger.info("WorldCupController home() " + new Date());
		return "home";
	}
	
	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login(){ 
		logger.info("WorldCupController login() " + new Date());
		return "login";
	}

	@RequestMapping(value = "enfp.do", method = RequestMethod.GET)
	public String enfp(){ 
		logger.info("WorldCupController enfp() " + new Date());
		return "enfp";
	}
	/* 임시 controller  끝*/
	
	@RequestMapping(value = "worldcup_choice.do", method = RequestMethod.GET)
	public String worldcup_choice(){ 
		logger.info("WorldCupController worldcup_choice() " + new Date());
		return "worldcup_choice";
	}

	@RequestMapping(value = "worldcup.do", method = RequestMethod.GET)
	public String worldcup(Model model){ 
		logger.info("WorldCupController worldcup() " + new Date());
		List<WorldCupDto> list = service.worldcuplist("food");
		model.addAttribute("worldcuplist", list);
		return "worldcup";
	}
	
	@RequestMapping(value = "worldcup_result.do", method = RequestMethod.GET)
	public String worldcup_result(Model model, int worldcupseq){ 
		logger.info("WorldCupController worldcup_result() " + new Date());
		System.out.println(worldcupseq);
		WorldCupDto result =  service.worldcupresult(worldcupseq);
		model.addAttribute("worldcupresult", result);
		return "worldcup_result";
	}
	
	@ResponseBody
	@RequestMapping(value = "worldcup.do", method = RequestMethod.POST)
	public String choice() {
		logger.info("TestController choice() " + new Date());		
		return "menu";
	}
	
}
