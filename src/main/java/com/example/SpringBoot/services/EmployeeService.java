package com.example.SpringBoot.services;

import com.example.SpringBoot.entity.Employee;
import com.example.SpringBoot.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    EmployeeRepository employeeRepository;

    public List<Employee> getAllEmployee(){
        return employeeRepository.findAll();
    }

    public Employee storeEmployee(Employee emp){
        return employeeRepository.save(emp);
    }
}
