package secure.mbti.a.contorller;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	

	@Autowired
	BoardService service;
	@Autowired
	CommentService commentService;
			
	/* 각자의 MBTI게시판으로 이동 */
	@RequestMapping(value = "board_ISTJ.do", method = RequestMethod.GET)
	public String board_ISTJ(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		/* 검색 관련 */
		param.setBoardtype(0);
		/* 페이지 관련 */
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(0); 
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		
		//list 가져오기
		model.addAttribute("board_list", list); 
		//int 가져오기
		model.addAttribute("board_size", list_size);
		//페이지 가져오기
		model.addAttribute("board_page", page); 
		return "board_ISTJ"; 
	}
	@RequestMapping(value = "board_ISFJ.do", method = RequestMethod.GET)
	public String board_ISFJ(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(1);
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(1); 
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); 
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); 
		return "board_ISFJ"; 
	}
	@RequestMapping(value = "board_ISTP.do", method = RequestMethod.GET)
	public String board_ISTP(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(2);
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(2); 
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); 
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); 
		return "board_ISTP"; 
	}
	@RequestMapping(value = "board_ISFP.do", method = RequestMethod.GET)
	public String board_ISFP(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(3);
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(3); 
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list);
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page);
		return "board_ISFP"; 
	}
	@RequestMapping(value = "board_INFJ.do", method = RequestMethod.GET)
	public String board_INFJ(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(4);
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(4); 
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); 
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); 
		return "board_INFJ"; 
	}
	@RequestMapping(value = "board_INTJ.do", method = RequestMethod.GET)
	public String board_INTJ(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(5);
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(5); 
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); 
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); 
		return "board_INTJ"; 
	}
	@RequestMapping(value = "board_INFP.do", method = RequestMethod.GET)
	public String board_INFP(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(6);
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(6); 
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); 
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); 
		return "board_INFP"; 
	}
	@RequestMapping(value = "board_INTP.do", method = RequestMethod.GET)
	public String board_INTP(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(7); 
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(7); 
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); 
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); 
		return "board_INTP"; 
	}
	@RequestMapping(value = "board_ESTP.do", method = RequestMethod.GET)
	public String board_ESTP(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(8); 
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(8); 
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list);
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); 
		return "board_ESTP";
	}
	@RequestMapping(value = "board_ESFP.do", method = RequestMethod.GET)
	public String board_ESFP(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(9); 
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(9); 
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); 
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); 
		return "board_ESFP"; 
	}
	@RequestMapping(value = "board_ESTJ.do", method = RequestMethod.GET)
	public String board_ESTJ(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(10); 
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(10); 
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); 
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); 
		return "board_ESTJ"; 
	}
	@RequestMapping(value = "board_ESFJ.do", method = RequestMethod.GET)
	public String board_ESFJ(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(11); 
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(11); 
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); 
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); 
		return "board_ESFJ"; 
	}
	@RequestMapping(value = "board_ENFP.do", method = RequestMethod.GET)
	public String board_ENFP(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(12); 
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(12); 
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); 
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); 
		return "board_ENFP"; 
	}
	@RequestMapping(value = "board_ENTP.do", method = RequestMethod.GET)
	public String board_ENTP(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(13); 
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(13); 
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); 
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); 
		return "board_ENTP"; 
	}
	@RequestMapping(value = "board_ENFJ.do", method = RequestMethod.GET)
	public String board_ENFJ(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(14); 
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(14); 
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list);
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); 
		return "board_ENFJ";
	}
	@RequestMapping(value = "board_ENTJ.do", method = RequestMethod.GET)
	public String board_ENTJ(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_ENFJ() " + new Date());
		param.setBoardtype(15);
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(15); 
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);

		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); 
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); 
		return "board_ENTJ"; 
	}
	/*자유게시판 이동*/
	@RequestMapping(value = "board_FREE.do", method = RequestMethod.GET)
	public String board_FREE(Model model,BoardParam param, int page){ 
		logger.info("BoardController board_FREE() " + new Date());
		param.setBoardtype(16);
		if(param.getCriteria()==null) {
			Criteria criteria =new Criteria(16);
			param.setCriteria(criteria);
			}
		if(page == 0 ) {
			page = 1;
		}
		param.getCriteria().setPage(page);
		List<BoardDto> list = service.board_list(param);
		int list_size = list.size();
		list=service.board_list_page(param);
		model.addAttribute("board_list", list); 
		model.addAttribute("board_size", list_size);
		model.addAttribute("board_page", page); 
		return "board_FREE"; 
	}
	
	//자유게시판 글쓰기
	@RequestMapping(value = "board_write.do", method = RequestMethod.GET)
	public String board_write(Model model,int boardtype) {
		logger.info("BoardController board_write()" + new Date());
		model.addAttribute("boardtype",boardtype);	
		
							//키        밸류 
		return "board_write";
	}
	
	//글쓰기 후 자유게시판 리스트
	@RequestMapping(value = "board_writeAf.do", method = RequestMethod.POST)
	public String board_writeAf(Model model, BoardDto dto ,HttpServletRequest request) {
		logger.info("BoardController board_writeAf()" + new Date());
		
		//로그인 컨트롤에서 회원을 변수로 담는과정
		MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
		String mbtiType[] = {
				"istj", "isfj", "istp", "isfp",
				"infj", "intj", "infp", "intp",
				"estp", "esfp", "estj", "esfj",
				"enfp", "entp", "enfj", "entj",
				"free",
				}; 
		String Type = mbtiType[dto.getBoardtype()].toLowerCase();
		
		//관리자"admin"이 공지를 쓸 수 있게 만드는 과정
		if(mem.getId().equals("admin")) {
			dto.setBoardtype(18);
		}
		service.board_write(dto);
//		model.addAttribute("result",result);		

		
		 //mem.getMbti().toLowerCase();
		
		int index = -1;
		for (int i=0;i<mbtiType.length;i++) {
		    if (mbtiType[i].equals(Type)) {
		        index = i;
		        break;
		    }
		}	
		dto.setBoardtype(index);
//		System.out.println(dto.toString());
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
	
	//목록 클릭시 해당 게시판리스트로
	@RequestMapping(value = "board_backlist.do", method = RequestMethod.GET)
	public String board_backlist(int boardtype){ 
		logger.info("BoardController board_backlist() " + new Date());
		String mbtiType[] = {
				"istj", "isfj", "istp", "isfp",
				"infj", "intj", "infp", "intp",
				"estp", "esfp", "estj", "esfj",
				"enfp", "entp", "enfj", "entj",
				"free"
				}; 
		
		return "redirect:/board_"+mbtiType[boardtype].toUpperCase()+".do?page=1";
	}
	
	
	
	// 자유게시판 상세페이지
	@RequestMapping(value = "board_detail.do", method = RequestMethod.GET)
	public String board_detail(Model model, int boardseq) {
		logger.info("BoardController board_detail()" + new Date());
//		System.out.println(boardseq);
		int readup = service.board_countUp(boardseq);
		
		
		//게시물 번호 담아서 가져오고, 해당 게시물 댓글 정보 담기
		BoardDto board = service.get_board(boardseq);
		List<CommentDto> commments = commentService.comment_list(boardseq);
		
		//db 속 게시판정보 + 댓글 정보 담아서 다른곳으로 이동준비 = model
		model.addAttribute("board", board);
		model.addAttribute("comments", commments);
		
		//댓글 개수 표시
		int getcount=commentService.comment_getcount(boardseq);
		model.addAttribute("comment_count",getcount);  
		
		
		return "board_detail";
		
	}
	
	// 게시물 수정페이지
	@RequestMapping(value = "board_update.do", method = RequestMethod.GET)
	public String board_update(Model model, int boardseq) {
		logger.info("BoardController board_update() " + new Date());
		BoardDto board = service.get_board(boardseq);
		
		// 해당게시물 번호를 보고 db정보 담아서 수정페이지로 이동 
		model.addAttribute("board", board);
		return "board_update";
		
		
	}
	
	// 게시물 수정 버튼 누른 후
	@RequestMapping(value = "board_updateAf.do", method = RequestMethod.POST)
	public String board_updateAf(Model model, BoardDto dto) {
		logger.info("BoardController board_updateAf() " + new Date());
		
		//서비스에서 dto 정보가 담긴 게시물 수정을 호출 
		service.board_update(dto);
		
		
		//수정 후 해당 게시물 번호에 상세페이지로 이동
		return "redirect:/board_detail.do?boardseq="+dto.getBoardseq();
		
		
	}
	//게시물 삭제
	@RequestMapping(value = "board_delete.do", method = RequestMethod.GET)
	public String board_delete(Model model, int boardseq) {
		logger.info("BoardController board_delete() " + new Date());
		
		//서비스에서 해당 게시물 삭제 정보 호출
		service.board_delete(boardseq);
		//mbti 배열(각각 게시판들) 변수로 담고
		String mbtiType[] = {
				"istj", "isfj", "istp", "isfp",
				"infj", "intj", "infp", "intp",
				"estp", "esfp", "estj", "esfj",
				"enfp", "entp", "enfj", "entj",
				"free"
				}; 
		
		// mbti타입 게시판의 게시물을 담은 모든 mbti 게시판 정보 배열로 담기
		                                  //char[]=문자배열(문자열) String
		String boardtype = mbtiType[service.get_board(boardseq).getBoardtype()];
		model.addAttribute("result");
		return "redirect:/board_"+boardtype.toUpperCase()+".do?page=1";
	}
	
	//댓글을 댓글 리스트로 등록 가능
	@RequestMapping(value = "comment.do", method = RequestMethod.POST)
	public String comment(CommentDto dto) {
		logger.info("BoardController comment() " + new Date());
		
		//댓글서비스에 담긴 정보가져오기
		commentService.comment_write(dto);
		
		service.board_commentcountup(dto.getBoardseq()); //게시판 댓글개수 하나 늘린것
	
		return "redirect:/board_detail.do?boardseq="+dto.getBoardseq();
	}
	
	
	

	// 댓글수정
	@RequestMapping(value = "comment_update.do", method = RequestMethod.GET)
	public String comment_update(Model model, int commentseq) {
		logger.info("BoardController comment_update() " + new Date());
		
		CommentDto commentDto = commentService.get_comment(commentseq); //클릭한 댓글(해당 댓글번호를 체크함)을 가져올수있다
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
	
	// 댓글 삭제
	@RequestMapping(value = "comment_delete.do", method = RequestMethod.GET) // jsp파일에서 컨트롤러 찾을때 쓰임 requestmapping
	public String comment_delete(int commentseq) {
		logger.info("BoardController comment_delete() " + new Date());
	
		int comment_delete = commentService.get_comment(commentseq).getBoardseq();  //삭제하고자하는 댓글 가져와라 > 보드시퀀스와 함께
		
		service.board_commentcountdown(comment_delete); // del==1로바꿈
		commentService.comment_delete(commentseq);	//get방식으로 시퀀스 넘겨줌
		
		
		return "redirect:/board_detail.do?boardseq="+comment_delete;
	}
	
	// 댓글의 대댓글 등록
	@RequestMapping(value = "comment_replycontent.do", method = RequestMethod.GET) // jsp파일에서 컨트롤러 찾을때 쓰임 requestmapping
	public String comment_replycontent(Model model,  int commentseq) {
		logger.info("BoardController comment_replycontent() " + new Date());

		// 댓글 정보를 댓글 시퀀스 번호에 담는다
		CommentDto commentdto= commentService.get_comment(commentseq);
		model.addAttribute("comment",commentdto);
		
		return "comment_replydetail";
	}
	
	
	//대댓글을 단 후
	@ResponseBody
	@RequestMapping(value = "comment_replydetailAf.do", method = RequestMethod.POST)
	public String comment_replydetailAf(CommentDto dto) {
		logger.info("BoardController comment_replydetailAf() " + new Date());

		commentService.comment_reply_update(dto);
		commentService.comment_reply(dto);
		
		service.board_commentcountup(dto.getBoardseq()); //db의 게시판 대댓글로 단 댓글을 개수 하나 늘린것으로 db에 알려줌
		

		return "commit";
	}
	

	
}
