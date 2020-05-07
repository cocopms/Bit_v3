package com.cocopmss.web.user;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;

import com.cocopmss.web.util.Data;

@Repository
public class UserDaoImpl implements UserDao {

	@Override
	public void insert(User user) {

	}

	@Override
	public List<User> selectAll() {
		List<User> users = new ArrayList<>();
		List<String> temp = new ArrayList<>();
		String message = "";
		try (BufferedReader reader = new BufferedReader(new FileReader(new File(Data.USERS.toString())))) {
			while ((message = reader.readLine()) != null) {
				temp.add(message);
			}
			reader.close();
		} catch (Exception e) {
			System.out.println("에러");
			e.printStackTrace();
		}
		User u = null;
		for (String s : temp) {
			u = new User();
			String[] arr = s.split(",");
			u.setUserid(arr[0]);
			u.setPasswd(arr[1]);
			u.setName(arr[2]);
			u.setSsn(arr[3]);
			u.setAddr(arr[4]);
			u.setProfile(arr[5]);
			u.setEmail(arr[6]);
			u.setPhoneNumber(arr[7]);
			u.setRegisterDate(arr[8]);
			users.add(u);
		}
		return users;
	}

	@Override
	public User selectOne(String userid) {
		List<User> list = selectAll();
		User findUser = null;
		for (User u : list) { // 향상된 for문
			if (userid.equals(u.getUserid())) {
				findUser = u;

				break;
			}
		}
		return findUser;
	}

	@Override
	public void update(User user) {

	}

	@Override
	public void delete(User user) {

	}
}