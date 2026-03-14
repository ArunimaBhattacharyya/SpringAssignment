package com.capgemini.training;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class LoginController {
	
	@GetMapping("/")
	public String loginPage() {
		return "login.jsp";
	}
	
	@PostMapping("/login")
	public String validate(String user, String password) {
		System.out.println(user);
		System.out.println(password);
		return "home.jsp";
	}
	
	@PostMapping("/register")
	public String register(HttpServletRequest request){
		String empId = request.getParameter("empId");
		System.out.println("Emp Id : "+empId);
		return "home.jsp";
	}
	@PostMapping("/forgotpassword")
	public String forgotPassword(@RequestParam String email) {

	    System.out.println("Email entered : " + email);
	    return "resetpassword.jsp";
	}
}