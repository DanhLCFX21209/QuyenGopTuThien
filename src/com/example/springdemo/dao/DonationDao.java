package com.example.springdemo.dao;

import java.util.List;

import com.example.springdemo.entity.Donation;



public interface DonationDao {
	public List<Donation> getDonations();

	public void saveDonation(Donation theDonation);
	
	public Donation getDonation(int theId);
	
	public Donation getDonation2(int theId);

	
	public void deleteDonation(int theId);
}
