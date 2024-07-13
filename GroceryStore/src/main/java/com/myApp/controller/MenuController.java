package com.myApp.controller;

import java.util.List;

import com.myApp.Dto.ItemsDTO;
import com.myApp.dao.ItemsDAO;
import com.myApp.service.ItemsService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MenuController {

	@Autowired
	private ItemsService itemService;
	
	@Autowired
	private ItemsDAO itemsDAO;
	
	@RequestMapping("/createMenu")
	public String myMenu()
	{		
		return "menu-items";
	}
	
	@GetMapping("/addItems")
	public String getMenuItems(@ModelAttribute("itemsdto") ItemsDTO itemDTO) {
		
		return "add-items";
	}
	
	
	@PostMapping("/add")
	public String addItems(ItemsDTO itemDTO)
	{
		System.out.println(itemDTO);
		
		itemsDAO.SaveItems(itemDTO);
		
		return "redirect:/Menu";
	}
	
	@GetMapping("/Menu")
	public String MainMenu(Model model)
	{
	      List<ItemsDTO> listItems = itemsDAO.getAllItems();
		   model.addAttribute("itemsList",listItems);
		  
		   return "Menu-List";
	}
	
	@GetMapping("/editItems/{item_id}")
	public String editMenuItems(@PathVariable("item_id") int item_id,Model model)
	{	
	     ItemsDTO	itemsDTO = itemService.getItemById(item_id);
		    model.addAttribute("itemsdto",itemsDTO);		
		return "edit-items";
	}
	
	@PostMapping("/updateItems")
   	public String updateItems(@ModelAttribute("itemsdto") ItemsDTO itemsDTO)
   	{
		itemsDAO.updateItems(itemsDTO);
		return "redirect:/Menu";
   	}
 	
	
	@GetMapping("/deleteItems/{item_id}")
	public String delItems(@PathVariable("item_id") int item_id)
	{
		//wriite logic to delete 
		
		itemsDAO.deleteItems(item_id);
		
		
		return "redirect:/Menu";
	}
	
}
