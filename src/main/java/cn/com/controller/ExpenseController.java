package cn.com.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.runners.Parameterized.Parameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import cn.com.bean.Emp;
import cn.com.bean.Expense;
import cn.com.bean.PageData;
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
		return "redirect:/expenseCtrl/queryPage.do?page=1";
	}
	
	@RequestMapping("addExpense")
	public String add(Expense expense,HttpSession session){
		if (session.getAttribute("emp")==null) {
			return "login";
		}
		expense.setEmp((Emp) session.getAttribute("emp"));
		expenseService.add(expense);
		return "redirect:/expenseCtrl/queryPage.do?page=1";
	}
	
	@RequestMapping("queryPage")
	public String queryPage(ModelMap mp,int page,HttpSession session,HttpServletResponse response) throws IOException{
		if (session.getAttribute("emp")==null) {
			return "login";
		}
		
		int count = expenseService.getPageCount();
		int pageCount = (count%15)>0?(count/15+1):(count/15);
		if (page>pageCount) {
			page = pageCount;
		}
		
		int offset = (page-1)*15;
		List<Expense> list = expenseService.queryPage(offset);
		PageData pageData = new PageData(count, list);
		response.getWriter().print(new Gson().toJson(pageData));
		mp.put("currentPage", page);
		mp.put("expenseList", list);
		mp.put("totalCount", count);
		return "reimburse";
	}

	@RequestMapping("queryPageJson")
	@ResponseBody
	public PageData queryPageJson(ModelMap mp,int page,HttpSession session,HttpServletResponse response) throws IOException{
		
		int count = expenseService.getPageCount();
		int pageCount = (count%15)>0?(count/15+1):(count/15);
		if (page>pageCount) {
			page = pageCount;
		}
		
		int offset = (page-1)*15;
		List<Expense> list = expenseService.queryPage(offset);
		PageData pageData = new PageData(count, list);
		mp.put("currentPage", page);
		mp.put("expenseList", list);
		mp.put("totalCount", count);
		return pageData;
	}
}
