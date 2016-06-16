package cn.com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.bean.Expense;
import cn.com.dao.ExpenseDao;
import cn.com.service.ExpenseService;
@Service
public class ExpenseServiceImpl implements ExpenseService {

	@Autowired
	private ExpenseDao expenseDao;
	
 	public List<Expense> queryAll() {
		List<Expense> list = expenseDao.queryAll();
		return list;
	}

	public boolean deleteById(int id) {
		if(expenseDao.deleteById(id)){
			return true;
		}
		return false;
	}

	public boolean update(Expense expense) {
		if (expenseDao.update(expense)) {
			return true;
		}
		return false;
	}

	public boolean add(Expense expense) {
		if (expenseDao.add(expense)) {
			return true;
		}
		return false;
	}

	public List<Expense> queryPage(int offset) {
		List<Expense> list = expenseDao.queryPage(offset);
		return list;
	}

	public int getPageCount() {
		
		return expenseDao.getPageCount();
	}

}
