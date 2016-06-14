package cn.com.service;

import java.util.List;

import cn.com.bean.Emp;

public interface EmpService {

	public boolean addUser(Emp emp);
	public List<Emp> findAll();
	public boolean deleteById(int id);
}
