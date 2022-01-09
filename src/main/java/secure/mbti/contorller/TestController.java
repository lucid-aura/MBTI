package secure.mbti.contorller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class TestController {

	private static Logger logger = LoggerFactory.getLogger(TestController.class);

	
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

}
