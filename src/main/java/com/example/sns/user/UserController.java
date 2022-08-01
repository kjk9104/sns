package com.example.sns.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	
	// http://localhost:8080/user/sign_up_view
	@RequestMapping("/sign_up_view")
	public String signUpView(Model model) {
		model.addAttribute("viewName","user/sign_up");
		return"/template/layout";
	}
	
	
	// http://localhost:8080/user/sign_in_view
	@RequestMapping("/sign_in_view")
	public String signInView(Model model) {
		model.addAttribute("viewName","user/sign_in");
		return"/template/layout";
	}
	
	@RequestMapping("/sign_out")
	public String signOut(
			HttpSession session
			) {
		
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		session.removeAttribute("userName");
		
		return "redirect:/user/sign_in_view";
	}
}
