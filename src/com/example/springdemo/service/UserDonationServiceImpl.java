package com.example.springdemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.example.springdemo.dao.UserDonationDao;
import com.example.springdemo.entity.UserDonation;

@Service
public class UserDonationServiceImpl implements UserDonationService {
	// need to inject customer dao
		@Autowired
		private UserDonationDao userDonationDao;

		


		@Override
		@Transactional
		public void saveUserDonation(UserDonation theUserDonation) {
			userDonationDao.saveUserDonation(theUserDonation);
		}

		@Override
		@Transactional
		public UserDonation getUserDonation(int theId) {
			return userDonationDao.getUserDonation(theId);
		}

		@Override
		@Transactional
		public void deleteUserDonation(int theId) {
			userDonationDao.deleteUserDonation(theId);
			
		}

		
}
