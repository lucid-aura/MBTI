package secure.mbti.a.contorller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import secure.mbti.a.dto.MemberDto;

@Controller
public class IntroController {
	@RequestMapping(value = "introMBTI.do", method = RequestMethod.GET)
	public String introMBTI(Model model,HttpServletRequest request){ 
	  //session에서 사용자 정보를 산출
	  MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
		System.out.println(mem.toString());	
		return "introMBTI";
	}
	
	@RequestMapping(value = "detailMBTI.do", method = RequestMethod.POST)
	public String detailMBTI(Model model, String filename){ 
		System.out.println("IntroController detailMBTI() " + new Date());
		model.addAttribute("filename", filename);
		return "detailMBTI";
	}
	
	@RequestMapping(value = "board_type.do", method = RequestMethod.GET)
	public String board_type(HttpServletRequest request){ 
		System.out.println("IntroController board_type() " + new Date());
		MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
		return "redirect:/board_"+mem.getMbti()+".do";
	}
	
	
	
}
