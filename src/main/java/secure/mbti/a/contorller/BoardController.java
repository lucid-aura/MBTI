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
	
	@RequestMapping(value = "Board_free.do", method = RequestMethod.GET)
	public String board_list(Model model, BoardParam param) {
		logger.info("BoardController board_list()" + new Date());
		
		List<BoardDto> list = service.board_list(param);
		model.addAttribute("board_list", list); // board_list에 list를 넘겨주자
		
		return "board_list";
	}
	
	@RequestMapping(value = "Board_write.do", method = RequestMethod.GET)
	public String board_write() {
		logger.info("BoardController board_write()" + new Date());
		
		
		return "board_write";
	}
	
	@RequestMapping(value = "Board_writeAf.do", method = RequestMethod.POST)
	public String board_writeAf(BoardDto dto) {
		logger.info("BoardController board_write()" + new Date());
		
		boolean b = service.board_write(dto); 	// 서비스에서도 만들어줘라
		if(b == true){// board_list에 list를 넘겨주자
			System.out.println("성공적으로 추가 되었습니다");
		}
		return "board_list";
	}
	
	
	
}
