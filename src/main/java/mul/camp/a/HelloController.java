package mul.camp.a;

import org.apache.log4j.spi.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller 
public class HelloController {
	
	@RequestMapping("hello.do")
	public String helloMethod() {
		
		System.out.println("HelloController 로그인 페이지로 이동했습니다()");
		
		return "hello";
	}
	
	
	@RequestMapping("home.do")
	public String home() {
		
		System.out.println("HelloController 첫 홈페이지로 이동했습니다()");
		
		return "home";
	}
	
	@RequestMapping("pageIsfj.do")
	public String page() {
		
		System.out.println("HelloController에서 설명페이지로 이동했습니다()");
		
		return "pageIsfj";
	}
	

	
}
