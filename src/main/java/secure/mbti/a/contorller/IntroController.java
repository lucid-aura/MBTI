package secure.mbti.a.contorller;

import java.time.Duration;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import secure.mbti.a.dto.MbtiDetailDto;
import secure.mbti.a.dto.MbtiReviewDto;
import secure.mbti.a.dto.MemberDto;
import secure.mbti.a.service.MbtiDetailService;
import secure.mbti.a.service.MbtiReviewService;


import secure.mbti.a.dto.MemberDto;

@Controller
public class IntroController {
	
	@Autowired
	MbtiDetailService service;
	
	@Autowired
	MbtiReviewService review;

	
	/* 조회수 기능 준비 */
	Map<String, LocalTime[]> accessTime = new HashMap<>();
	/* 조회수 기능 */
	public void accessHistory(String mbti) {
		LocalTime accesstime[] = {LocalTime.now(), LocalTime.now()};
		/* 접속 시간 기록 */
		if(accessTime.containsKey(mbti)) {
			accesstime[0]=accessTime.get(mbti)[1];
			accessTime.put(mbti, accesstime);
		}else {
			accessTime.put(mbti, accesstime);
		}
		/* 시간 차이 확인 */
		if(Duration.between(accessTime.get(mbti)[0], accessTime.get(mbti)[1]).getSeconds()>60) {
			service.viewcount(mbti);
		}
	}
	
	/* 리뷰진입시 선택MBTI */
	String targetmbti;

	@RequestMapping(value = "introMBTI.do", method = RequestMethod.GET)
	public String introMBTI(Model model){ 

		/* MBTI 종류(16종) 전달 */
		List<String> str = service.mbtilist();
		model.addAttribute("mbtilist", str);

		return "introMBTI";
	}
	
	@RequestMapping(value = "detailMBTI.do", method = RequestMethod.POST)
	public String detailMBTI(Model model, String selectMbti){ 
		
		/* 정보전달 */
		/* 0번째 정보: introMBTI에서 선택한 MBTI */
		/* 1번째 정보: MBTI 종류(16종) */
		/* 2번째 정보: introMBTI에서 선택한 MBTI에 대한 상세 내용 */
		List<Object> selectInfo = new ArrayList<Object>();
		selectInfo.add(selectMbti);
		selectInfo.add(service.mbtilist());
		selectInfo.add(service.mbtidetail(selectMbti.toUpperCase()));
		
		/* 3번째 정보: introMBTI에서 선택한 MBTI에 대한 회원 비율 */
		String memberMbtiRatio = service.mbtiratio(selectMbti.toUpperCase());
		if(memberMbtiRatio!=null) {
			selectInfo.add(memberMbtiRatio);
		}else {
			selectInfo.add("0%");
		}
		
		/* 4번째 정보: detailMBTI에서 선택한 MBTI의 별점평균*/
		String asterion = review.reviewasterion(selectMbti.toUpperCase());
		selectInfo.add(asterion);
		
			
		model.addAttribute("selectMbti", selectInfo);
		
		/* 조회수 관련 */
		accessHistory(selectMbti.toUpperCase());
		
		/* 선택한 메뉴 저장(리뷰관련) */
		targetmbti=selectMbti.toUpperCase();
		
		return "detailMBTI";
	}
	
	@ResponseBody
	@RequestMapping(value ="mbtiContent.do", method=RequestMethod.POST)
	public Map<String, Object> mbtiContent(String selectMenu) {
		
		/* 조회수 관련 */
		accessHistory(selectMenu);
		
		/* 정보전달 */
		/* 정보(1): introMBTI에서 선택한 MBTI에 대한 회원 비율 */
		Map<String, Object> map = new HashMap<String, Object>();
		String memberMbtiRatio = service.mbtiratio(selectMenu);
		if(memberMbtiRatio!=null) {
			map.put("ratio",memberMbtiRatio);
		}else {
			map.put("ratio", "0%");			
		}
		
		/* 정보(2): introMBTI에서 선택한 MBTI에 대한 상세 내용 */
		MbtiDetailDto dto = service.mbtidetail(selectMenu);
		map.put("content",dto);
		
		
		/* 정보(3): detailMBTI에서 선택한 MBTI의 별점평균*/
		String asterion = review.reviewasterion(selectMenu);
		map.put("asterion", asterion);
		

		/* 선택한 메뉴 저장(리뷰관련) */
		targetmbti=selectMenu;
		return map;
	}
	
	/* 본인의 MBTI게시판으로 이동 */
	@RequestMapping(value = "board_type.do", method = RequestMethod.GET)
	public String board_type(String type, HttpServletRequest request){ 
		if (type == null || type.isBlank()) {
			MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
			type = mem.getMbti();
		}
		return "redirect:/board_"+type+".do?page=0";
	}
	
	
	
	/*리뷰 관련*/
	@RequestMapping(value = "mbtiReview.do", method = RequestMethod.GET)
	public String mbtiReview(Model model, MbtiReviewDto dto){ 
		
		if(dto.getTargetmbti()!=null) {
			targetmbti = dto.getTargetmbti();
		}
		
		/* 정보전달 */
		/* 정보(0): detailMBTI에서 선택한 MBTI*/
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("selectmbti", targetmbti);
		
		/* 정보(1): detailMBTI에서 선택한 MBTI의 리뷰목록*/
		List<MbtiReviewDto> reviewList = review.reviewlist(targetmbti);
		map.put("reviewList", reviewList);
		

		model.addAttribute("reviewInfo", map);
		
		return "mbtiReview";
	}
	/* 리뷰 작성 */
	@RequestMapping(value = "reviewWriteAf.do", method = RequestMethod.POST)
	public String reviewWriteAf(MbtiReviewDto dto){
		review.reviewwrite(dto);
		return "redirect:/mbtiReview.do";
	}
	
	/* 리뷰 삭제 */
	@RequestMapping(value = "reviewModify.do", method = RequestMethod.POST)
	public String reviewModify(MbtiReviewDto dto){
		if(dto.getReview()==null) {
			review.reviewdelete(dto);
		} else {
			review.reviewupdate(dto);
		}
		return "redirect:/mbtiReview.do";
	}
	
	
	
}
