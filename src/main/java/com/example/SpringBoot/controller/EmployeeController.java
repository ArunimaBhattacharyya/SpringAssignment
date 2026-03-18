package com.example.SpringBoot.controller;

import com.example.SpringBoot.Application;
import com.example.SpringBoot.entity.Employee;
import com.example.SpringBoot.services.EmployeeService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class EmployeeController {

    private final Application application;

    @Autowired
    EmployeeService employeeService;

    EmployeeController(Application application) {
        this.application = application;
    }

    @RequestMapping("/allemp")
    public String getAllEmployee(HttpServletRequest request) {
        List<Employee> listOfEmp = employeeService.getAllEmployee();
        request.setAttribute("listOfEmp", listOfEmp);
        return "/home.jsp";
    }

    @GetMapping("/addemp")
    public String createEmp() {
        return "/register_emp.jsp";
    }

    @PostMapping("/createemp")
    public String registerEmp(HttpServletRequest request) {
        String empId     = request.getParameter("empId");
        String empName   = request.getParameter("empName");
        String empEmail  = request.getParameter("empEmail");
        long   contactNo = Long.parseLong(request.getParameter("contactNo"));
        String empCity   = request.getParameter("empCity");

        Employee employee = new Employee();
        employee.setEmpId(empId);
        employee.setEmpName(empName);
        employee.setEmpEmail(empEmail);
        employee.setEmpCity(empCity);
        employee.setEmpContactNo(contactNo);

        employeeService.storeEmployee(employee);

        return "redirect:/allemp";
    }

    @GetMapping("/editemp/{id}")
    public String editEmployee(@PathVariable int id, HttpServletRequest request) {
        Employee emp = employeeService.getEmployeeById(id);
        request.setAttribute("emp", emp);
        return "/edit_emp.jsp";
    }

    @PostMapping("/updateemp")
    public String updateEmployee(@RequestParam int id, Employee emp) {
        employeeService.updateEmployee(id, emp);
        return "redirect:/allemp";
    }

    @GetMapping("/deleteemp/{id}")
    public String deleteEmployee(@PathVariable int id) {
        employeeService.deleteEmployee(id);
        return "redirect:/allemp";
    }
}