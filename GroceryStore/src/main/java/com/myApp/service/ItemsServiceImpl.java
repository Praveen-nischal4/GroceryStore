package com.myApp.service;

import com.myApp.Dto.ItemsDTO;
import com.myApp.dao.ItemsDAO;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

@Service
public class ItemsServiceImpl implements ItemsService {
	
	
	
	@Autowired
	private ItemsDAO itemsDAO;

	@Override
	public ItemsDTO getItemById(int item_id) {
		
		return itemsDAO.getItemsById(item_id);
	}


		
	

}
