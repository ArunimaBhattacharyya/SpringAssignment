package com.example.SpringBoot.controller;

import com.example.SpringBoot.Application;
import com.example.SpringBoot.entity.Employee;
import com.example.SpringBoot.repository.EmployeeRepository;
import com.example.SpringBoot.services.EmployeeService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class EmployeeController {

    private final Application application;

    @Autowired
    EmployeeService employeeService;

    EmployeeController(Application application){
        this.application = application;
    }

    @RequestMapping("/allemp")
    public String getAllEmployee(HttpServletRequest request){
        System.out.println("*******************************");
        List<Employee> listOfEmp = employeeService.getAllEmployee();
        for(Employee emp : listOfEmp){
            System.out.println(" Emp : " + emp.getEmpName());
        }

        request.setAttribute("listOfEmp", listOfEmp); //it is storing all the employees into a object
        return "home.jsp";
    }

    @GetMapping("/addemp")
    public String createEmp(){
        return "register_emp.jsp";
    }

    @PostMapping("/createemp")
    public String registerEmp(HttpServletRequest request){

        String empId = request.getParameter("empId");
        String empName = request.getParameter("empName");
        String empEmail = request.getParameter("empEmail");
        long contactNo = Long.parseLong(request.getParameter("contactNo"));
        String empCity = request.getParameter("empCity");

        Employee employee = new Employee();
        employee.setEmpId(empId);
        employee.setEmpName(empName);
        employee.setEmpEmail(empEmail);
        employee.setEmpCity(empCity);
        employee.setEmpContactNo(contactNo);
        // store employee
        employeeService.storeEmployee(employee);
        //get all employee
        List<Employee> listOfEmp = employeeService.getAllEmployee();
        request.setAttribute("listOfEmp", listOfEmp);

        return "home.jsp";
    }

}
