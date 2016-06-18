package cn.com.bean;

import java.util.List;

public class PageData {

	private int dataCount;
	private List<Expense> expenseList;
	public PageData(int dataCount, List<Expense> expenseList) {
		super();
		this.dataCount = dataCount;
		this.expenseList = expenseList;
	}
	public PageData() {
		super();
	}
	public int getDataCount() {
		return dataCount;
	}
	public void setDataCount(int dataCount) {
		this.dataCount = dataCount;
	}
	public List<Expense> getExpenseList() {
		return expenseList;
	}
	public void setExpenseList(List<Expense> expenseList) {
		this.expenseList = expenseList;
	}
	
}
