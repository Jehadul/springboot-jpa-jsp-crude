package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Employee;

public interface IEmployeeService {

	public List<Employee> findEmployeeByDate(String date1);

}
