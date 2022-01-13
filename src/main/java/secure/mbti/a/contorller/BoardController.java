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
	@RequestMapping(value = "board_ENFJ.do", method = RequestMethod.GET)
	public String board_ENFJ(){ 
		logger.info("BoardController ENFJ() " + new Date());
		return "board_ENFJ";
	}
	
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
		return "board_list";
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
