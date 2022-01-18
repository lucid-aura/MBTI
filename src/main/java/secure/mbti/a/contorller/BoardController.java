package secure.mbti.a.contorller;
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
import secure.mbti.a.dto.Criteria;
import secure.mbti.a.dto.MemberDto;
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
			
	/* 임시 controller */
	@RequestMapping(value = "board_ISTJ.do", method = RequestMethod.GET)
	public String board_ISTJ(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(0);
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(0); // 이것주의!
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		System.out.println(param.toString());
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); // board_list에 list를 넘겨주자
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); // 페이지넘길빼번호
		return "board_ISTJ"; //이것주의!
	}
	@RequestMapping(value = "board_ISFJ.do", method = RequestMethod.GET)
	public String board_ISFJ(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(1);
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(1); // 이것주의!
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		System.out.println(param.toString());
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); // board_list에 list를 넘겨주자
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); // 페이지넘길빼번호
		return "board_ISFJ"; //이것주의!
	}
	@RequestMapping(value = "board_ISTP.do", method = RequestMethod.GET)
	public String board_ISTP(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(2);
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(2); // 이것주의!
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		System.out.println(param.toString());
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); // board_list에 list를 넘겨주자
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); // 페이지넘길빼번호
		return "board_ISTP"; //이것주의!
	}
	@RequestMapping(value = "board_ISFP.do", method = RequestMethod.GET)
	public String board_ISFP(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(3);
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(3); // 이것주의!
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		System.out.println(param.toString());
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); // board_list에 list를 넘겨주자
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); // 페이지넘길빼번호
		return "board_ISFP"; //이것주의!
	}
	@RequestMapping(value = "board_INFJ.do", method = RequestMethod.GET)
	public String board_INFJ(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(4);
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(4); // 이것주의!
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		System.out.println(param.toString());
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); // board_list에 list를 넘겨주자
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); // 페이지넘길빼번호
		return "board_INFJ"; //이것주의!
	}
	@RequestMapping(value = "board_INTJ.do", method = RequestMethod.GET)
	public String board_INTJ(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(5);
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(5); // 이것주의!
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		System.out.println(param.toString());
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); // board_list에 list를 넘겨주자
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); // 페이지넘길빼번호
		return "board_INTJ"; //이것주의!
	}
	@RequestMapping(value = "board_INFP.do", method = RequestMethod.GET)
	public String board_INFP(Model model,BoardParam param, int page){ //이것주의
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(6); //이것 주의!
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(6); // 이것주의!
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		System.out.println(param.toString());
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); // board_list에 list를 넘겨주자
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); // 페이지넘길빼번호
		return "board_INFP"; //이것주의!
	}
	@RequestMapping(value = "board_INTP.do", method = RequestMethod.GET)
	public String board_INTP(Model model,BoardParam param, int page){ //이것주의
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(7); //이것 주의!
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(7); // 이것주의!
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		System.out.println(param.toString());
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); // board_list에 list를 넘겨주자
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); // 페이지넘길빼번호
		return "board_INTP"; //이것주의!
	}
	@RequestMapping(value = "board_ESTP.do", method = RequestMethod.GET)
	public String board_ESTP(Model model,BoardParam param, int page){ //이것주의
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(8); //이것 주의!
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(8); // 이것주의!
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		System.out.println(param.toString());
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); // board_list에 list를 넘겨주자
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); // 페이지넘길빼번호
		return "board_ESTP"; //이것주의!
	}
	@RequestMapping(value = "board_ESFP.do", method = RequestMethod.GET)
	public String board_ESFP(Model model,BoardParam param, int page){ //이것주의
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(9); //이것 주의!
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(9); // 이것주의!
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		System.out.println(param.toString());
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); // board_list에 list를 넘겨주자
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); // 페이지넘길빼번호
		return "board_ESFP"; //이것주의!
	}
	@RequestMapping(value = "board_ESTJ.do", method = RequestMethod.GET)
	public String board_ESTJ(Model model,BoardParam param, int page){ //이것주의
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(10); //이것 주의!
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(10); // 이것주의!
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		System.out.println(param.toString());
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); // board_list에 list를 넘겨주자
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); // 페이지넘길빼번호
		return "board_ESTJ"; //이것주의!
	}
	@RequestMapping(value = "board_ESFJ.do", method = RequestMethod.GET)
	public String board_ESFJ(Model model,BoardParam param, int page){ //이것주의
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(11); //이것 주의!
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(11); // 이것주의!
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		System.out.println(param.toString());
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); // board_list에 list를 넘겨주자
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); // 페이지넘길빼번호
		return "board_ESFJ"; //이것주의!
	}
	@RequestMapping(value = "board_ENFP.do", method = RequestMethod.GET)
	public String board_ENFP(Model model,BoardParam param, int page){ //이것주의
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(12); //이것 주의!
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(12); // 이것주의!
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		System.out.println(param.toString());
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); // board_list에 list를 넘겨주자
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); // 페이지넘길빼번호
		return "board_ENFP"; //이것주의!
	}
	@RequestMapping(value = "board_ENTP.do", method = RequestMethod.GET)
	public String board_ENTP(Model model,BoardParam param, int page){ //이것주의
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(13); //이것 주의!
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(13); // 이것주의!
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		System.out.println(param.toString());
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); // board_list에 list를 넘겨주자
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); // 페이지넘길빼번호
		return "board_ENTP"; //이것주의!
	}
	@RequestMapping(value = "board_ENFJ.do", method = RequestMethod.GET)
	public String board_ENFJ(Model model,BoardParam param, int page){ //이것주의
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(14); //이것 주의!
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(14); // 이것주의!
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		System.out.println(param.toString());
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); // board_list에 list를 넘겨주자
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); // 페이지넘길빼번호
		return "board_ENFJ"; //이것주의!
	}
	@RequestMapping(value = "board_ENTJ.do", method = RequestMethod.GET)
	public String board_ENTJ(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(15);
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(15); // 이것주의!
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		System.out.println(param.toString());
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); // board_list에 list를 넘겨주자
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); // 페이지넘길빼번호
		return "board_ENTJ"; //이것주의!
	}
	@RequestMapping(value = "board_FREE.do", method = RequestMethod.GET)
	public String board_FREE(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_FREE() " + new Date());
		param.setBoardtype(16);
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(16); // 이것주의!
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		System.out.println(param.toString());
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); // board_list에 list를 넘겨주자
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); // 페이지넘길빼번호
		return "board_FREE"; //이것주의!
	}
	@RequestMapping(value = "board_write.do", method = RequestMethod.GET)
	public String board_write(Model model,int boardtype) {
		logger.info("BoardController board_write()" + new Date());
		model.addAttribute("boardtype",boardtype);	
		System.out.println(boardtype+"ZXZXZXZ");
							//키        밸류 
		return "board_write";
	}
	
	//글쓰기 후 다시 자유게시판 시작점으로
	@RequestMapping(value = "board_writeAf.do", method = RequestMethod.POST)
	public String board_writeAf(Model model, BoardDto dto ,HttpServletRequest request) {
		logger.info("BoardController board_writeAf()" + new Date());
		System.out.println(dto.toString()+"ASASAXA");
		
		int result = service.board_write(dto);
		model.addAttribute("result",result);		
		String mbtiType[] = {
				"istj", "isfj", "istp", "isfp",
				"infj", "intj", "infp", "intp",
				"estp", "esfp", "estj", "esfj",
				"enfp", "entp", "enfj", "entj",
				"free",
				}; 
		MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
		String Type =mem.getMbti().toLowerCase();
		
		int index = -1;
		for (int i=0;i<mbtiType.length;i++) {
		    if (mbtiType[i].equals(Type)) {
		        index = i;
		        break;
		    }
		}	
		dto.setBoardtype(index);
		System.out.println(dto.toString());
		String type = mbtiType[dto.getBoardtype()].toUpperCase();
		return "redirect:/board_"+type+".do?page=1";
		
	}
	@RequestMapping(value = "board_cancle.do", method = RequestMethod.GET)
	public String board_cancle(int boardtype){ 
		logger.info("BoardController board_cancle() " + new Date());
		String mbtiType[] = {
				"istj", "isfj", "istp", "isfp",
				"infj", "intj", "infp", "intp",
				"estp", "esfp", "estj", "esfj",
				"enfp", "entp", "enfj", "entj",
				"free"
				}; 
		return "redirect:/board_"+mbtiType[boardtype].toUpperCase()+".do?page=1";
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
		String mbtiType[] = {
				"istj", "isfj", "istp", "isfp",
				"infj", "intj", "infp", "intp",
				"estp", "esfp", "estj", "esfj",
				"enfp", "entp", "enfj", "entj",
				"free"
				}; 
		                                  //char[]=문자배열(문자열) String
		String boardtype = mbtiType[service.get_board(boardseq).getBoardtype()];
		model.addAttribute("result");
		return "redirect:/board_"+boardtype.toUpperCase()+".do?page=1";
	}
	
	//댓글 리스트등록 가능
	@RequestMapping(value = "comment.do", method = RequestMethod.POST)
	public String comment(CommentDto dto) {
		logger.info("BoardController comment() " + new Date());
		
		commentService.comment_write(dto);
		
		List<CommentDto> commentdto = commentService.comment_list(dto.getBoardseq());
		
		return "redirect:/board_detail.do?boardseq="+dto.getBoardseq();
	}
	
	
	

	// 댓글수정
	@RequestMapping(value = "comment_update.do", method = RequestMethod.GET)
	public String comment_update(Model model, int commentseq) {
		logger.info("BoardController comment_update() " + new Date());
		
		CommentDto commentDto = commentService.get_comment(commentseq); //클릭한 댓글을 가져올수있다
		service.get_board(commentDto.getBoardseq()); 

		model.addAttribute("board", service.get_board(commentDto.getBoardseq()));  // 게시글 가져온다
		model.addAttribute("comment_update", commentDto);  //모델 : jsp에게 넘겨주기위한 class,  dto정보담음
		
		return "comment_update"; 
	}
	
	// 댓글 수정 후
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
