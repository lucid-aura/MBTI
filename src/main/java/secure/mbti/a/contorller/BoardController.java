	
	/* 임시 controller  끝*/
	/*
	+board_list
	+board_detail
	+board_write
	+board_writeAf
	+board_update
	+comment
	*/
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
		return "redirect:/board_detail.do";   // 강의때 bbslist.do였음
		
		
	}
	@RequestMapping(value = "board_delete.do", method = RequestMethod.GET)
	public String board_delete(Model model, int boardseq) {
		logger.info("BbsController board_delete() " + new Date());
		service.board_delete(boardseq);
		
		model.addAttribute("result");
		return "redirect:/board_free.do";
	}
	
	/*  댓글부분
	@RequestMapping(value = "comment.do", method = RequestMethod.GET)
	public String comment(Model model, int boardseq) {
		logger.info("BbsController comment() " + new Date());
		
		List<CommentDto> commentdto = CommentService.comment_list(comment.getBoardseq());
		
		model.addAttribute("board", board);
		model.addAttribute("comments", commentdto);
		return "board_detail";
		
		
	}*/
	
	
	
	
}
