package secure.mbti.a.contorller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
		
		//리스트부분 댓글 개수 상의
		/*
		int getcount=commentService.comment_getcount(boardseq);
		model.addAttribute("comment_count",getcount);*/
		
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
		
		int result = service.board_write(dto);// 결과 확인값
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
		
		//댓글 개수 표시
		int getcount=commentService.comment_getcount(boardseq);
		model.addAttribute("comment_count",getcount);  // 키값은 무조건 jsp에 넣을거니 꼭 기억해라
		
		
		return "board_detail";
		
	}
	
	@RequestMapping(value = "board_update.do", method = RequestMethod.GET)
	public String board_update(Model model, int boardseq) {
		logger.info("BoardController board_update() " + new Date());
		BoardDto board = service.get_board(boardseq);
		
		model.addAttribute("board", board);
		return "board_update";
		
		
	}
	
	@RequestMapping(value = "board_updateAf.do", method = RequestMethod.POST)
	public String board_updateAf(Model model, BoardDto dto) {
		logger.info("BoardController board_updateAf() " + new Date());
		service.board_update(dto);
		
		model.addAttribute("result");
		return "redirect:/board_detail.do?boardseq="+dto.getBoardseq();   // 강의때 bbslist.do였음 상수+문자열
		
		
	}
	@RequestMapping(value = "board_delete.do", method = RequestMethod.GET)
	public String board_delete(Model model, int boardseq) {
		logger.info("BoardController board_delete() " + new Date());
		service.board_delete(boardseq);
		
		return "redirect:/board_free.do";
	}
	
	//댓글 리스트등록 가능
	@RequestMapping(value = "comment.do", method = RequestMethod.POST)
	public String comment(CommentDto dto) {
		logger.info("BoardController comment() " + new Date());
		
		commentService.comment_write(dto);
		
		List<CommentDto> commentdto = commentService.comment_list(dto.getBoardseq());
		
		return "redirect:/board_detail.do?boardseq="+dto.getBoardseq();
	}
	
	
	

	//댓글수정
	// 22-01-16 오전 1시 지워도됨
	@RequestMapping(value = "comment_update.do", method = RequestMethod.GET)
	public String comment_update(Model model, int commentseq) {
		logger.info("BoardController comment_update() " + new Date());
		
		CommentDto commentDto = commentService.get_comment(commentseq); //클릭한 댓글을 가져올수있다
		service.get_board(commentDto.getBoardseq()); 

		model.addAttribute("board", service.get_board(commentDto.getBoardseq()));  // 게시글 가져온다
		model.addAttribute("comment_update", commentDto);  //모델 : jsp에게 넘겨주기위한 class,  dto정보담음
		
		return "comment_update"; 
	}
	
	//댓글 수정 후
	@RequestMapping(value = "comment_updateAf.do", method = RequestMethod.POST)
	public String comment_updateAf(CommentDto dto) {
		logger.info("BoardController comment_updateAf() " + new Date());
		System.out.println(dto.toString());
		commentService.comment_update(dto);
		
		return "redirect:/board_detail.do?boardseq="+dto.getBoardseq();
	}
	
	
	@RequestMapping(value = "comment_delete.do", method = RequestMethod.GET) // jsp파일에서 컨트롤러 찾을때 쓰임 requestmapping
	public String comment_delete(int commentseq) {
		logger.info("BoardController comment_delete() " + new Date());
		
		int comment_delete = commentService.get_comment(commentseq).getBoardseq();  //삭제하고자하는 댓글 가져와라 > 보드시퀀스와 함께
		
		commentService.comment_delete(commentseq);//get방식으로 시퀀스 넘겨줌
		
		return "redirect:/board_detail.do?boardseq="+comment_delete;
	}

	
	
}
