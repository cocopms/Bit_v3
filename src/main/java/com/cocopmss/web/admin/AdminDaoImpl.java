package com.cocopmss.web.admin;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.cocopmss.web.util.Data;
import com.cocopmss.web.util.Messanger;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Override
	public void insert(Admin admin) {
		try {
			BufferedWriter writer = new BufferedWriter(
					new FileWriter(new File(Data.ADMINS.toString()),true)); //true는 오버로딩 할때에만 필요하므로 write에만 씀
			writer.write(admin.toString());
			writer.newLine();
			writer.flush();
		} catch (Exception e) {
			System.out.println(Messanger.FILE_INSERT_ERROR);
		} finally {

		}
	}

	@Override
	public List<Admin> selectAll() {
		List<Admin> admins = new ArrayList<>();
		List<String> temp = new ArrayList<>();
		try {
			File file = new File(Data.ADMINS.toString());
			BufferedReader reader = new BufferedReader(new FileReader(file));
			String message = "";
			while(reader.readLine()!=null) {
				temp.add(message);
			}
			reader.close();
		} catch(Exception e) {
			System.out.println(Messanger.FILE_INSERT_ERROR);
		}
		Admin a = null;
		for(String s : temp) {
			a = new Admin();
			String arr[] = s.split(",");
			//나머지 해야함
		}
		return admins;
	}

	@Override
	public Admin selectOne(String employeeNumber) {
		Admin returnAdmin = null;
		try {
			
		} catch(Exception e) {
			System.out.println(Messanger.FILE_INSERT_ERROR);
		} finally {
			
		}
		return returnAdmin;
	}

	@Override
	public void update(Admin admin) {
		try {
			
		} catch(Exception e) {
			System.out.println(Messanger.FILE_INSERT_ERROR);
		} finally {
			
		}
	}

	@Override
	public void delete(Admin admin) {
		try {
			
		} catch(Exception e) {
			System.out.println(Messanger.FILE_INSERT_ERROR);
		} finally {
			
		}	
	}
	
}