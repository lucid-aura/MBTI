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
import secure.mbti.a.dto.CommentDto;
import secure.mbti.a.service.BoardService;
import secure.mbti.a.service.CommentService;

@Controller
public class BoardController {
	private static Logger logger = LoggerFactory.getLogger(BoardController.class);
	

//	+board_update
//	+comment

	@Autowired
	BoardService service;
	@Autowired
	CommentService commentService;
	
	@RequestMapping(value = "board_free.do", method = RequestMethod.GET)
	public String board_list(Model model, BoardParam param) {
		logger.info("BoardController board_list()" + new Date());
		
		List<BoardDto> list = service.board_list(param);
		model.addAttribute("board_list", list); // board_list에 list를 넘겨주자
		
		return "board_free";
	}
	
	@RequestMapping(value = "board_write.do", method = RequestMethod.GET)
	public String board_write() {
		logger.info("BoardController board_write()" + new Date());
		
		return "board_write";
	}
	
	//글쓰기 후 다시 자유게시판 시작점으로
	@RequestMapping(value = "board_writeAf.do", method = RequestMethod.POST)
	public String board_writeAf(Model model, BoardDto dto) {
		logger.info("BoardController board_write()" + new Date());
		System.out.println(dto.toString());
		
		int result = service.board_write(dto);
		model.addAttribute("result",result);
		
		return "redirect:/board_free.do";

	}
	@RequestMapping(value = "board_detail.do", method = RequestMethod.GET)
	public String board_detail(Model model, int boardseq) {
		logger.info("BoardController board_detail()" + new Date());
		System.out.println(boardseq);
		int readup = service.board_countUp(boardseq);
		
		BoardDto board = service.get_board(boardseq);
		List<CommentDto> commments = commentService.comment_list(boardseq);
		
		model.addAttribute("board", board);
		model.addAttribute("comments", commments);
		
		return "board_detail";
	}
	
	@RequestMapping(value = "board_update.do", method = RequestMethod.GET)
	public String board_update(Model model, int boardseq) {
		logger.info("BbsController board_update() " + new Date());
		BoardDto board = service.get_board(boardseq);
		
		model.addAttribute("board", board);
		return "board_update";
		
		
	}
	
	@RequestMapping(value = "board_updateAf.do", method = RequestMethod.POST)
	public String board_updateAf(Model model, BoardDto dto) {
		logger.info("BbsController board_updateAf() " + new Date());
		service.board_update(dto);
		
		model.addAttribute("result");
		return "redirect:/board_free.do";   // 강의때 bbslist.do였음
		
		
	}
	@RequestMapping(value = "board_delete.do", method = RequestMethod.GET)
	public String board_delete(Model model, int boardseq) {
		logger.info("BbsController board_delete() " + new Date());
		service.board_delete(boardseq);
		
		model.addAttribute("result");
		return "redirect:/board_free.do";
	}
	
	@RequestMapping(value = "comment.do", method = RequestMethod.GET)
	public String comment(Model model, int boardseq) {
		logger.info("BbsController comment() " + new Date());
		
		List<CommentDto> commentdto = CommentService.comment_list(comment.getBoardseq());
		
		model.addAttribute("board", board);
		model.addAttribute("comments", commentdto);
		return "board_detail";
		
		
	}
	
	
	
	
}
