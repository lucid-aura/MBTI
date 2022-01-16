package secure.mbti.a.contorller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IntroController {
	@RequestMapping(value = "introMBTI.do", method = RequestMethod.GET)
	public String introMBTI(){ 
		System.out.println("IntroController introMBTI() " + new Date());
		return "introMBTI";
	}
	
	@RequestMapping(value = "detailMBTI.do", method = RequestMethod.POST)
	public String detailMBTI(Model model, String filename){ 
		System.out.println("IntroController detailMBTI() " + new Date());
		model.addAttribute("filename", filename);
		return "detailMBTI";
	}
	
	@RequestMapping(value = "board_type.do", method = RequestMethod.GET)
	public String board_type(){ 
		System.out.println("IntroController board_type() " + new Date());
		return "board_type";
	}
	
	
}
