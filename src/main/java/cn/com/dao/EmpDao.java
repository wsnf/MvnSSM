package cn.com.dao;

import java.util.List;

import cn.com.bean.Emp;

public interface EmpDao {

	public boolean addUser(Emp emp);
	public List<Emp> findAll();
	public boolean deleteById(int id);
	public Emp queryEmp(Emp emp);
}
