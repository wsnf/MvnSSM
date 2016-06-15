package cn.com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.bean.Emp;
import cn.com.service.EmpService;

@Controller
@RequestMapping("/")
public class EmpController {

	@Autowired
	private EmpService empService;

	
	@RequestMapping("list")
	public String findAll(ModelMap mp){
		mp.put("empList", empService.findAll());
		return "list";
	}
	@RequestMapping("login")
	public String login(Emp emp,HttpSession session){
		Emp user = empService.queryEmp(emp);
		if (user != null) {
			session.setAttribute("emp", user);
			return "index";
		}
		return "login";
	}
}
