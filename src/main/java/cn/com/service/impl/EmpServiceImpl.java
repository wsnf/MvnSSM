package cn.com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.bean.Emp;
import cn.com.dao.EmpDao;
import cn.com.service.EmpService;
@Service
public class EmpServiceImpl implements EmpService {

	@Autowired
	private EmpDao empDao;
	public boolean addUser(Emp emp) {
		// TODO Auto-generated method stub
		return false;
	}

	public List<Emp> findAll() {
		List<Emp> list = empDao.findAll();
		return list;
	}

	public boolean deleteById(int id) {
		// TODO Auto-generated method stub
		return false;
	}

}
