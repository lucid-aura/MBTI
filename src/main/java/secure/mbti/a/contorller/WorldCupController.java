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
	
	@RequestMapping(value = "worldcup_choice.do", method = RequestMethod.GET)
	public String worldcup_choice(){ 
		logger.info("WorldCupController worldcup_choice() " + new Date());
		return "worldcup_choice";
	}

	@RequestMapping(value = "worldcup.do", method = RequestMethod.GET)
	public String worldcup(Model model , String topic){ 
		logger.info("WorldCupController worldcup() " + new Date());
		List<WorldCupDto> list = worldcupservice.worldcuplist(topic);
		model.addAttribute("worldcuplist", list);
		return "worldcup";
	}
	
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

	@ResponseBody
	@RequestMapping(value = "worldcup_delete_comment.do", method = RequestMethod.POST)
	public List<CommentDto> worldcup_delete_comment(Model model, int commentseq, int boardseq){ 
		logger.info("WorldCupController worldcup_delete_comment() " + new Date());
		commentservice.comment_delete(commentseq);
		List<CommentDto> comments =  commentservice.comment_list(boardseq);
		model.addAttribute("comments", comments);
		return comments;
	}
	
	@ResponseBody
	@RequestMapping(value = "worldcup_update_comment.do", method = RequestMethod.POST)
	public List<CommentDto> worldcup_update_comment(Model model, CommentDto comment){ 
		logger.info("WorldCupController worldcup_update_comment() " + new Date());
		commentservice.comment_update(comment);
		List<CommentDto> comments =  commentservice.comment_list(comment.getBoardseq());
		model.addAttribute("comments", comments);
		return comments;
	}
	
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
	
	@ResponseBody
	@RequestMapping(value = "worldcup.do", method = RequestMethod.POST)
	public String choice() {
		logger.info("TestController choice() " + new Date());		
		return "menu";
	}
	
}
