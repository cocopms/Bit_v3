package com.cocopmss.web.user;

//저장공간이 map에서 file로 바뀌었으므로 구조 다 바뀜
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cocopmss.web.item.Item;

@Service
public class UserServiceImpl implements UserService{

	@Autowired UserDao dao;

	@Override
	public void register(User user) {
		dao.insert(user);
	}

	@Override
	public List<User> findAll() {
		return dao.selectAll();
	}

	@Override
	public User findOne(String userid) { //toss
		return dao.selectOne(userid);
	}

	@Override
	public void modify(User user) {
		dao.update(user);
	}

	@Override
	public void remove(User user) {
		dao.delete(user);
	}
}
