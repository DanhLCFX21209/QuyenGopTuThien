package com.example.springdemo.service;

import java.util.List;

import com.example.springdemo.entity.Donation;
import com.example.springdemo.entity.UserDonation;



public interface UserDonationService {
	
	public void saveUserDonation(UserDonation theUserDonation);
	
	public UserDonation getUserDonation(int theId);

	public void deleteUserDonation(int theId);

}
