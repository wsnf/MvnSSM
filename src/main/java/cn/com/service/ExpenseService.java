package cn.com.service;

import java.util.List;

import cn.com.bean.Expense;

public interface ExpenseService {

	public List<Expense> queryAll();
	public boolean deleteById(int id);
	public boolean update(Expense expense);
	public boolean add(Expense expense);
}
