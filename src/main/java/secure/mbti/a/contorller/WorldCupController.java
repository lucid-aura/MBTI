package secure.mbti.a.contorller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import secure.mbti.a.dto.CommentDto;
import secure.mbti.a.dto.WorldCupDto;
import secure.mbti.a.service.CommentService;
import secure.mbti.a.service.WorldCupService;

@Controller
public class WorldCupController {

	private static Logger logger = LoggerFactory.getLogger(WorldCupController.class);
	@Autowired
	WorldCupService worldcupservice;
	
	@Autowired
	CommentService commentservice;
	
	/* 네이게이션에서 월드컵 클릭시 주제를 선탁하는 창으로 넘겨주는 컨트롤러 */
	@RequestMapping(value = "worldcup_choice.do", method = RequestMethod.GET)
	public String worldcup_choice(){ 
		logger.info("WorldCupController worldcup_choice() " + new Date());
		return "worldcup_choice";
	}

	/* 선택한 주제(topic)에 따라 WorldCup DB에서 조회를 하고 리스트와 함께 WorldCup을 진행하는 창으로 넘겨주는 컨트롤러  */
	@RequestMapping(value = "worldcup.do", method = RequestMethod.GET)
	public String worldcup(Model model , String topic){ 
		logger.info("WorldCupController worldcup() " + new Date());
		List<WorldCupDto> list = worldcupservice.worldcuplist(topic);
		model.addAttribute("worldcuplist", list);
		return "worldcup";
	}
	
	/* 선택 결과에 따라 결과 이미지와 댓글을 모아 보여주는 결과창으로 넘겨주는 컨트롤러 */
	@RequestMapping(value = "worldcup_result.do", method = RequestMethod.GET)
	public String worldcup_result(Model model, int worldcupseq){ 
		logger.info("WorldCupController worldcup_result() " + new Date());
		WorldCupDto result =  worldcupservice.worldcupresult(worldcupseq);		
		List<CommentDto> commentdto = commentservice.comment_list(result.getBoardseq());
		model.addAttribute("worldcupresult", result);
		model.addAttribute("comments", commentdto);
		result.getBoardseq();
		return "worldcup_result";
	}
	
	/* 댓글과 대댓글을 구분하여 Comment DB에 Insert를 해주고 갱신된 댓글 리스트를 넘겨주는 컨트롤러(Ajax) */
	@ResponseBody
	@RequestMapping(value = "worldcup_result.do", method = RequestMethod.POST)
	public List<CommentDto> worldcup_comment(CommentDto comment){ 
		logger.info("WorldCupController worldcup_comment() " + new Date());
		if (comment.getStep() > 0) {
			commentservice.comment_reply(comment);
		}
		else {
			commentservice.comment_write(comment);
		}
		return commentservice.comment_list(comment.getBoardseq());
	}
	
	/* 삭제 요청이 들어왔을 시 Comment DB의 Del값을 1로 변경하고 갱신된 댓글 리스트를 넘겨주는 컨트롤러(Ajax) */
	@ResponseBody
	@RequestMapping(value = "worldcup_delete_comment.do", method = RequestMethod.POST)
	public List<CommentDto> worldcup_delete_comment(Model model, int commentseq, int boardseq){ 
		logger.info("WorldCupController worldcup_delete_comment() " + new Date());
		commentservice.comment_delete(commentseq);
		List<CommentDto> comments =  commentservice.comment_list(boardseq);
		model.addAttribute("comments", comments);
		return comments;
	}
	
	/* 갱신 요청이 들어왔을 시 Comment DB의 Content를 변경하고 갱신된 댓글 리스트를 넘겨주는 컨트롤러(Ajax) */
	@ResponseBody
	@RequestMapping(value = "worldcup_update_comment.do", method = RequestMethod.POST)
	public List<CommentDto> worldcup_update_comment(Model model, CommentDto comment){ 
		logger.info("WorldCupController worldcup_update_comment() " + new Date());
		commentservice.comment_update(comment);
		List<CommentDto> comments =  commentservice.comment_list(comment.getBoardseq());
		model.addAttribute("comments", comments);
		return comments;
	}
	
	/* 대댓글 작성 요청이 들어왔을 시 Comment DB에 해당 댓글을 위한 Update와 Insert를 해주고 갱신된 리스트를 넘겨주는 컨트롤러(Ajax) */
	@ResponseBody
	@RequestMapping(value = "worldcup_reply_comment.do", method = RequestMethod.POST)
	public List<CommentDto> worldcup_reply_comment(Model model, @ModelAttribute("CommentDto") CommentDto comment){ 
		System.out.println(comment.toString());
		logger.info("WorldCupController worldcup_reply_comment() " + new Date());
		commentservice.comment_reply_update(comment);
		commentservice.comment_reply(comment);

		List<CommentDto> comments =  commentservice.comment_list(comment.getBoardseq());
		model.addAttribute("comments", comments);
		return comments;
	}
}
