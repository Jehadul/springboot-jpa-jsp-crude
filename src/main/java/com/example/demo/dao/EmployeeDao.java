package com.example.demo.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.example.demo.model.Employee;

@Repository("employeeDao")
@Transactional
public class EmployeeDao implements IEmployeeDao{
	@PersistenceContext
    private EntityManager entityManger;
	
	public List<Employee> findEmployeeByDate(String date){
        return entityManger.createQuery("select e from Employee e where e.createdDate >= CONVERT('"+date+"', DATETIME)", Employee.class).getResultList();
    }
	
}
