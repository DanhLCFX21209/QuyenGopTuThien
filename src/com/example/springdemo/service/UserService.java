package com.example.springdemo.service;

import java.util.List;

import com.example.springdemo.entity.User;

public interface UserService {
	public List<User> getUsers();

	public void saveCustomer(User theUser);
	
	public User getUser(int theId);

	public void deleteUser(int theId);

}
