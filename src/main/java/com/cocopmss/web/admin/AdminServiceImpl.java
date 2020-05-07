package com.cocopmss.web.admin;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDao dao;

	@Override
	public void register(Admin admin) {
		admin.setEmployeeNumber(createEmployeeNumber());
		admin.setPasswd("1");
		admin.setRegisterDate(creatCurrentDate());
		dao.insert(admin);
	}

	private String creatCurrentDate() { // calendar 쓰면 안됨
		return new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	}

	private String createEmployeeNumber() {
		String startNum = "";
		for (int i = 0; i < 4; ++i) {
			startNum += String.valueOf((int) (Math.random() * 10));
		}
		return startNum;
	}
	
	@Override
	public List<Admin> findAll() {
		return dao.selectAll();
	}

	@Override
	public Admin findOne(String employeeNumber) {
		return dao.selectOne(employeeNumber);
	}

	@Override
	public void modify(Admin admin) {
		dao.update(admin);
	}

	@Override
	public void remove(Admin admin) {
		dao.delete(admin);
	}
}