package com.example.springdemo.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.springdemo.entity.Role;
import com.example.springdemo.entity.User;
import com.example.springdemo.service.UserService;




@Controller
@RequestMapping("/user")
public class UserController {

	// need to inject our customer service
	@Autowired
	private UserService userService;
	
	
	@GetMapping("/test")
	public String listCustomers(Model theModel) {
		
		return "admin/test";
	}
	
	@GetMapping("/account")
	public String showUser(Model theModel) {
		//get customers from the service
		List<User> list = userService.getUsers();			
		// add the customers to the model
		 theModel.addAttribute("users", list);
		return "admin/account";
	}
	
	@PostMapping("/saveUser")
	public String addUser(@ModelAttribute("user") User user, @RequestParam("idRole") int roleId) {
	    Role role = new Role();
	    role.setId(roleId);
	    user.setRole(role);
	    user.setStatus("1");
		userService.saveCustomer(user);
        return "redirect:/user/account";
	}
	

	@GetMapping("/detail")
	public String logout(Model theModel) {
		
		return "admin/detail";
	}
	
	@RequestMapping("/test")
	public String Test(Model theModel) {
		//get customers from the service
		List<User> theUser = userService.getUsers();
						
		// add the customers to the model
		theModel.addAttribute("users", theUser);		
		return "test";
	}
	@PostMapping("/delete")
	public String deleteCustomer(@RequestParam("userId") int theId) {
		System.out.println(theId);
		// delete the customer
		
		userService.deleteUser(theId);
		return "redirect:/user/account";
	}
	
	@PostMapping("/update")
	public String showFormForUpdate(@RequestParam("userId") int theId,
            @RequestParam("fullName") String fullName,
            @RequestParam("phoneNumber") String phoneNumber,
            @RequestParam("address") String address,
            @RequestParam("idRole") int roleId) {
		
		// get the customer from our service
		User user = userService.getUser(theId);
	    Role role = new Role();

	    // Cập nhật thông tin người dùng
	    user.setFullName(fullName);
	    user.setPhoneNumber(phoneNumber);
	    user.setAddress(address);
	    System.out.println(roleId);
	    role.setId(roleId);
	    user.setRole(role);
		
		userService.saveCustomer(user);

		
		// send over to our form		
		return "redirect:/user/account";
	}
	
	 @PostMapping("/lock")
	  public String lockUser(@RequestParam("idUser") int userId) {
	    // Lấy thông tin khách hàng từ cơ sở dữ liệu
	    User user = userService.getUser(userId);
	    
	    user.setStatus("0");
	    
	    userService.saveCustomer(user);
	    // Chuyển hướng người dùng đến trang nào đó sau khi hoàn tất
	    return "redirect:/user/account";
	  }
	 
	 @PostMapping("/un-lock")
	  public String unlockUser(@RequestParam("idUser") int userId) {
	    // Lấy thông tin khách hàng từ cơ sở dữ liệu
	    User user = userService.getUser(userId);
	    
	    user.setStatus("1");
	    
	    userService.saveCustomer(user);
	    // Chuyển hướng người dùng đến trang nào đó sau khi hoàn tất
	    return "redirect:/user/account";
	  }
	
}