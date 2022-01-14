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

import secure.mbti.a.dto.BoardDto;
import secure.mbti.a.dto.BoardParam;
import secure.mbti.a.service.BoardService;

@Controller
public class BoardController {

	private static Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardService service;
	
	/* 임시 controller */
	@RequestMapping(value = "board_ISTJ.do", method = RequestMethod.GET)
	public String board_ISTJ(){ 
		logger.info("BoardController board_ISTJ()" + new Date());
		return "board_ISTJ";
	}
	@RequestMapping(value = "board_ISFJ.do", method = RequestMethod.GET)
	public String board_ISFJ(){ 
		logger.info("BoardController board_ISFJ()" + new Date());
		return "board_ISFJ";
	}
	@RequestMapping(value = "board_ISTP.do", method = RequestMethod.GET)
	public String board_ISTP(){ 
		logger.info("BoardController board_ISTP() " + new Date());
		return "board_ISTP";
	}
	@RequestMapping(value = "board_ISFP.do", method = RequestMethod.GET)
	public String board_ISFP(){ 
		logger.info("BoardController board_ISFP() " + new Date());
		return "board_ISFP";
	}
	@RequestMapping(value = "board_INFJ.do", method = RequestMethod.GET)
	public String board_INFJ(){ 
		logger.info("BoardController board_INFJ() " + new Date());
		return "board_INFJ";
	}
	@RequestMapping(value = "board_INTJ.do", method = RequestMethod.GET)
	public String board_INTJ(){ 
		logger.info("BoardController board_INTJ() " + new Date());
		return "board_INTJ";
	}
	@RequestMapping(value = "board_INFP.do", method = RequestMethod.GET)
	public String board_INFP(){ 
		logger.info("BoardController board_INFP() " + new Date());
		return "board_INFP";
	}
	@RequestMapping(value = "board_INTP.do", method = RequestMethod.GET)
	public String board_INTP(){ 
		logger.info("BoardController board_INTP() " + new Date());
		return "board_INTP";
	}
	@RequestMapping(value = "board_ESTP.do", method = RequestMethod.GET)
	public String board_ESTP(){ 
		logger.info("BoardController board_ESTP() " + new Date());
		return "board_ESTP";
	}
	@RequestMapping(value = "board_ESFP.do", method = RequestMethod.GET)
	public String board_ESFP(){ 
		logger.info("BoardController board_ESFP() " + new Date());
		return "board_ESFP";
	}
	@RequestMapping(value = "board_ESTJ.do", method = RequestMethod.GET)
	public String board_ESTJ(){ 
		logger.info("BoardController board_ESTJ() " + new Date());
		return "board_ESTJ";
	}
	@RequestMapping(value = "board_ESFJ.do", method = RequestMethod.GET)
	public String board_ESFJ(){ 
		logger.info("BoardController board_ESFJ() " + new Date());
		return "board_ESFJ";
	}
	@RequestMapping(value = "board_ENFP.do", method = RequestMethod.GET)
	public String board_ENFP(){ 
		logger.info("BoardController board_ENFP() " + new Date());
		return "board_ENFP";
	}
	@RequestMapping(value = "board_ENTP.do", method = RequestMethod.GET)
	public String board_ENTP(){ 
		logger.info("BoardController board_ENTP() " + new Date());
		return "board_ENTP";
	}
	@RequestMapping(value = "board_ENFJ.do", method = RequestMethod.GET)
	public String board_ENFJ(){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		return "board_ENFJ";
	}
	@RequestMapping(value = "board_ENTJ.do", method = RequestMethod.GET)
	public String board_ENTJ(){ 
		logger.info("BoardController board_ENTJ() " + new Date());
		return "board_ENTJ";
	}
	//임시임!
	@RequestMapping(value = "board_free.do", method = RequestMethod.GET)
	public String board_free(){ 
		logger.info("BoardController board_free() " + new Date());
		return "board_free";
	}
	@RequestMapping(value = "board_list.do", method = RequestMethod.GET)
	public String board_list(Model model, BoardParam param){ 
		logger.info("BoardController board_list() " + new Date());
		
		List<BoardDto> list = service.board_list(param);
		model.addAttribute("board_list",list);
		return "board_free";
	}
	
	@RequestMapping(value = "board_detail.do", method = RequestMethod.GET)
	public String board_detail(){ 
		logger.info("BoardController board_detail() " + new Date());
		return "board_detail";
	}
	@RequestMapping(value = "board_write.do", method = RequestMethod.GET)
	public String board_write(){ 
		logger.info("BoardController board_write() " + new Date());
		return "board_write";
	}
	@RequestMapping(value = "board_writeAf.do", method = RequestMethod.GET)
	public String board_writeAf(){ 
		logger.info("BoardController logboard_writeAfin() " + new Date());
		return "board_writeAf";
	}

	@RequestMapping(value = "board_update.do", method = RequestMethod.GET)
	public String board_update(){ 
		logger.info("BoardController board_update() " + new Date());
		return "board_update";
	}	
	@RequestMapping(value = "comment.do", method = RequestMethod.GET)
	public String comment(){ 
		logger.info("BoardController comment() " + new Date());
		return "comment";
	}	
	
	
	/* 임시 controller  끝*/
	/*
	+board_list
	+board_detail
	+board_write
	+board_writeAf
	+board_update
	+comment
	*/
	
}
