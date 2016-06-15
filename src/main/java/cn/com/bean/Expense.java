package cn.com.bean;

import java.util.Date;

public class Expense {

	private int id;
	private Emp emp;
	private String local;
	private String payname;
	private String price;
	private Date startDate;
	private Date endDate;
	private String abstracts;
	private int state;
	public Expense() {
		super();
	}
	public Expense(Emp emp, String local, String payname, String price, Date startDate, Date endDate,
			String abstracts) {
		super();
		this.emp = emp;
		this.local = local;
		this.payname = payname;
		this.price = price;
		this.startDate = startDate;
		this.endDate = endDate;
		this.abstracts = abstracts;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Emp getEmp() {
		return emp;
	}
	public void setEmp(Emp emp) {
		this.emp = emp;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public String getPayname() {
		return payname;
	}
	public void setPayname(String payname) {
		this.payname = payname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getAbstracts() {
		return abstracts;
	}
	public void setAbstracts(String abstracts) {
		this.abstracts = abstracts;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
}
