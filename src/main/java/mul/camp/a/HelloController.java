package mul.camp.a;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller	// <- annotation
public class HelloController {
	
	private static Logger logger = LoggerFactory.getLogger(HelloController.class); 

	@RequestMapping("login")	// hello <- pattern
	public String loginMethod() {
		
		return "login";		// hello.jsp로 가라!
	}
	
	@RequestMapping("INSJ")
	public String INSJMethod() {
		
		return "INSJ";		
	}
	@RequestMapping("world")
	public String world(String job) {
		logger.info("HelloController world()");
		
		System.out.println("job = " + job);
		
		return "world";		// world.jsp로 가라!
	}
}





