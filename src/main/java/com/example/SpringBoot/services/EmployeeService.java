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

    public Employee updateEmployee(int id, Employee updateEmp){
        Employee existingEmp = employeeRepository.findById(id).orElseThrow(() -> new RuntimeException("Employee not found"));

        existingEmp.setEmpId(updateEmp.getEmpId());
        existingEmp.setEmpName(updateEmp.getEmpName());
        existingEmp.setEmpEmail(updateEmp.getEmpEmail());
        existingEmp.setEmpContactNo(updateEmp.getEmpContactNo());
        existingEmp.setEmpCity(updateEmp.getEmpCity());

        return employeeRepository.save(existingEmp);
    }

    public void deleteEmployee(int id){
        employeeRepository.deleteById(id);
    }

    public Employee getEmployeeById(int id){
        return employeeRepository.findById(id).orElseThrow(() -> new RuntimeException("Employee not found"));
    }
}
