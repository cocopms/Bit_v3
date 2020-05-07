package com.cocopmss.web.admin;

import java.util.List;

public interface AdminDao {

	void insert(Admin admin);

	List<Admin> selectAll();

	Admin selectOne(String employeeNumber);

	void update(Admin admin);

	void delete(Admin admin);

}