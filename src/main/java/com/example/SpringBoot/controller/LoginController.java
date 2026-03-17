package com.example.SpringBoot.controller;

import com.example.SpringBoot.Application;
import com.example.SpringBoot.entity.Employee;
import com.example.SpringBoot.services.EmployeeService;
import com.example.SpringBoot.services.LoginService;
import com.example.SpringBoot.entity.UserEntity;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import java.util.List;

@Controller
public class LoginController {

    private final Application application;

    @Autowired
    LoginService loginService;

    @Autowired
    EmployeeService employeeService;

    LoginController(Application application){
        this.application = application;
    }

    @GetMapping("/")
    public String loginPage() { return "login.jsp" ;}

    @PostMapping("/login")
    public String validate(String username, String password, Model model){
        System.out.println(username);
        System.out.println(password);
        if(username == null || username.isEmpty() || password == null || password.isEmpty()){
            model.addAttribute("error", "Username or Password cannot be empty");
            return "login.jsp";
        }

        boolean validUser = loginService.validateUser(username, password);
        if(validUser){
            List<Employee> listOfEmp = employeeService.getAllEmployee();
            model.addAttribute("listOfEmp", listOfEmp);
            return "home.jsp";
        } else {
            model.addAttribute("error", "Wrong username or password");
            return "login.jsp";
        }

    }

    @PostMapping("/register")
    public String register(HttpServletRequest request){
        String empId = request.getParameter("empId");
        String userName = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println("Emp Id : " + empId);
        System.out.println("Emp name : " + userName);
        System.out.println("Email : " + email);
        System.out.println("Password : " + password);

        UserEntity userEntity = new UserEntity();

        userEntity.setUsername(userName);
        userEntity.setEmail(email);
        userEntity.setPassword(password);

        loginService.registerUser(userEntity);
        return "home.jsp";
    }

    @PostMapping("/forgotpassword")
    public String forgotpassword(@RequestParam String email)
    {
        System.out.println("email entered: "+email);
        return "resetpassword.jsp";
    }
}

