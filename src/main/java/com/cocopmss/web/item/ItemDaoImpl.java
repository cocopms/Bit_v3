package com.cocopmss.web.item;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.cocopmss.web.util.Data;

@Repository
public class ItemDaoImpl implements ItemDao { // 무조건 try catch

	@Override
	public List<Item> selectAll() {
		List<Item> items = new ArrayList<>();
		List<String> temp = new ArrayList<>();
		String message = "";
		try (BufferedReader reader = new BufferedReader(new FileReader(new File(Data.ITEMS.toString())))) {
			while ((message = reader.readLine()) != null) {
				temp.add(message);
			}
			reader.close(); //잊지말것
		} catch (Exception e) {
			System.out.println("에러");
			e.printStackTrace();
		}
		Item i = null;
		for (String s : temp) {
			i = new Item();
			String[] arr = s.split(",");
			i.setItemId(arr[0]);
			i.setItemName(arr[1]);
			i.setTakeDate(arr[2]);
			i.setCategory(arr[3]);
			i.setTakePlace(arr[4]);
			items.add(i);
		}
		return items;
	}
}