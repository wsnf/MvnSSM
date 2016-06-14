package cn.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
