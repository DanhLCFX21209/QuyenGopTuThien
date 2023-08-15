package com.example.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.springdemo.entity.UserDonation;





@Repository
public class UserDonationDAOImp implements UserDonationDao {

	// need to inject the session factory
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public void saveUserDonation(UserDonation theUserDonation) {
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// save/upate the customer ... finally LOL
		currentSession.saveOrUpdate(theUserDonation);			
		
	}


	@Override
	public UserDonation getUserDonation(int theId) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// now retrieve/read from database using the primary key
		UserDonation theUserDonation = currentSession.get(UserDonation.class, theId);
		
		return theUserDonation;
	}


	@Override
	public void deleteUserDonation(int theId) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// delete object with primary key
		Query theQuery = 
				currentSession.createQuery("delete from UserDonation where donation.id = :donationId");
		theQuery.setParameter("donationId", theId);
		
		theQuery.executeUpdate();
		
	}





	

}


