package cn.com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.bean.Emp;
import cn.com.bean.Expense;
import cn.com.service.ExpenseService;

@Controller
@RequestMapping("expenseCtrl")
public class ExpenseController {

	@Autowired
	private ExpenseService expenseService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    dateFormat.setLenient(false);
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));//true:允许输入空值，false:不能为空值
	}
	
	@RequestMapping("getAll")
	public String getAll(ModelMap mp,HttpSession session){
		if (session.getAttribute("emp")==null) {
			return "login";
		}
		mp.put("expenseList", expenseService.queryAll());
		return "reimburse";
	}
	
	@RequestMapping("delete")
	public String deleteById(int id,HttpSession session){
		if (session.getAttribute("emp")==null) {
			return "login";
		}
		expenseService.deleteById(id);
		return "redirect:/expenseCtrl/getAll.do";
	}
	
	@RequestMapping("addExpense")
	public String add(Expense expense,HttpSession session){
		if (session.getAttribute("emp")==null) {
			return "login";
		}
		expense.setEmp((Emp) session.getAttribute("emp"));
		expenseService.add(expense);
		return "redirect:/expenseCtrl/getAll.do";
	}
}
