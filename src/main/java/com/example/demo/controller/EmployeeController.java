package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Employee;
import com.example.demo.repository.EmployeeRepository;
import com.example.demo.service.IEmployeeService;
import com.google.gson.Gson;

@RestController
@RequestMapping("/")
public class EmployeeController {
	@Autowired
	private IEmployeeService commonService;
	@Autowired
	private EmployeeRepository empRepository;
	
	@GetMapping("/")
	public ModelAndView create(HttpSession session, HttpServletRequest request) {
		
		return new ModelAndView("/create");
	}
	
	@GetMapping("/edit/{id}")
	public ModelAndView edit(@PathVariable(name = "id") long id, Model model) {
		
		Employee entity = empRepository.getOne(id);
		
		model.addAttribute("entity", entity);
		return new ModelAndView("/edit");
	}
	
	@PostMapping("/insert")
	public ModelAndView save(Employee emp) {
		empRepository.save(emp);
		
		return new ModelAndView("/create");
		
	}
	
	@PostMapping("/update/{id}")
	public ModelAndView update(Employee emp, @PathVariable(name = "id") long id, Model model) {
		try {
			Employee entity = empRepository.getOne(id);
			if (entity !=null) {
				entity.setName(emp.getName());
				entity.setMobile(emp.getMobile());
				empRepository.save(entity);
			}
		} catch (NullPointerException e) {
			System.err.println(e.getMessage());
		}
		
		return getAll(model);
	}
	
	@GetMapping("/delete/{id}")
	public ModelAndView delete(@PathVariable(name = "id") long id, Model model) {
		
		Employee entity = empRepository.getOne(id);
		empRepository.delete(entity);
		
		return getAll(model);
	}
	
	@GetMapping("/list")
	public ModelAndView getAll(Model model) {
		
		List<Employee> entityList = empRepository.findAll();
		model.addAttribute("entityList", entityList);
		
		return new ModelAndView("/list"); 
	}
	
	@GetMapping("/getEmployee")
	@ResponseBody
	public String getStationaryByStationaryCat(HttpServletRequest request) {
		List<Employee> entity = null;
		String json = null;
		try {
			entity = commonService.findEmployeeByDate(request.getParameter("date"));
			json = new Gson().toJson(entity);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return json;
	}
}
