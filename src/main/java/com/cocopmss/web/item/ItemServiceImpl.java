package com.cocopmss.web.item;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemServiceImpl implements ItemService {
	
	@Autowired ItemDao dao;

	@Override
	public List<Item> findAll() {
		return dao.selectAll();
	}

}
