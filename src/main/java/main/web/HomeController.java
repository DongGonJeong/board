package main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	
	
	@RequestMapping("/home.do")
	public String homePage() {
		
		return "home/homePage";
		
	}
	
}

//별도 추가