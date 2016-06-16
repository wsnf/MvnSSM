package cn.com.dao;

import java.util.List;

import cn.com.bean.Expense;

public interface ExpenseDao {

	public List<Expense> queryAll();
	public boolean deleteById(int id);
	public boolean update(Expense expense);
	public boolean add(Expense expense);
	public List<Expense> queryPage(int offset);
	public int getPageCount();
}
