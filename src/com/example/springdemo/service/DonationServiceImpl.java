package com.example.springdemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.springdemo.dao.DonationDao;
import com.example.springdemo.dao.UserDAO;
import com.example.springdemo.entity.Donation;
import com.example.springdemo.entity.User;

@Service
public class DonationServiceImpl implements DonationService {
	// need to inject customer dao
		@Autowired
		private DonationDao donationDao;

		
		@Override
		@Transactional
		public List<Donation> getDonations() {
			
			return donationDao.getDonations();
		}

		@Override
		@Transactional
		public void saveDonation(Donation theDonation) {
			donationDao.saveDonation(theDonation);
			
		}

		@Override
		@Transactional
		public Donation getDonation(int theId) {
			// TODO Auto-generated method stub
			return donationDao.getDonation(theId);
		}
		
		@Override
		@Transactional
		public Donation getDonation2(int theId) {
			// TODO Auto-generated method stub
			return donationDao.getDonation(theId);
		}

		@Override
		@Transactional
		public void deleteDonation(int theId) {
			donationDao.deleteDonation(theId);
			
		}


		

		
}
