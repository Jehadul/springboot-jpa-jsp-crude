package com.example.demo.dao;

import java.util.List;

import com.example.demo.model.Employee;

public interface IEmployeeDao {

	public List<Employee> findEmployeeByDate(String date1);

}
