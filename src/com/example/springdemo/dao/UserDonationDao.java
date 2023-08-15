package com.example.springdemo.dao;

import java.util.List;


import com.example.springdemo.entity.UserDonation;



public interface UserDonationDao {
	public void saveUserDonation(UserDonation theUserDonation);

	public UserDonation getUserDonation(int theId);

	public void deleteUserDonation(int theId);
}
