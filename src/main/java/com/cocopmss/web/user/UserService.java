package com.cocopmss.web.user;

import java.util.List;

import com.cocopmss.web.item.Item;

public interface UserService {

	void register(User user);

	List<User> findAll();

	User findOne(String userid);

	void modify(User user);

	void remove(User user);
}