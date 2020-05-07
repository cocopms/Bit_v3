package com.cocopmss.web.admin;

import java.util.List;

public interface AdminService {

	void register(Admin admin);

	List<Admin> findAll();

	Admin findOne(String employeeNumber);

	void modify(Admin admin);

	void remove(Admin admin);


}