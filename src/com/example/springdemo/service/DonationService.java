package com.example.springdemo.service;

import java.util.List;

import com.example.springdemo.entity.Donation;



public interface DonationService {
	public List<Donation> getDonations();

	public void saveDonation(Donation theUser);
	
	public Donation getDonation(int theId);
	
	public Donation getDonation2(int theId);

	public void deleteDonation(int theId);

}
