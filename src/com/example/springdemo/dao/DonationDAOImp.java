package com.example.springdemo.dao;

import java.util.List;

import org.dom4j.dom.DOMAttribute;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.springdemo.entity.Donation;
import com.example.springdemo.entity.User;





@Repository
public class DonationDAOImp implements DonationDao {



	// need to inject the session factory
	@Autowired
	private SessionFactory sessionFactory;
	
	
	
	
	@Override
	public List<Donation> getDonations() {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query  ... sort by last name
		Query<Donation> theQuery = 
				currentSession.createQuery("FROM Donation",
											Donation.class);
		
		// execute query and get result list
		List<Donation> donations = theQuery.getResultList();
				
		// return the results		
		return donations;		
	}



	@Override
	public void saveDonation(Donation theDonation) {
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// save/upate the customer ... finally LOL
		currentSession.saveOrUpdate(theDonation);		
		
	}



	@Override
	public Donation getDonation2(int theId) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
        String query = "SELECT d FROM Donation d JOIN FETCH u.userDonations WHERE d.id = :theId";
        Donation theDonation = currentSession.createQuery(query, Donation.class)
            .setParameter("theId", theId)
            .uniqueResult();
		
		return theDonation;
	}
	
	@Override
	public Donation getDonation(int theId) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		Donation theDonation = currentSession.get(Donation.class, theId);
		
		return theDonation;
	}



	@Override
	public void deleteDonation(int theId) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// delete object with primary key
		Query theQuery = 
				currentSession.createQuery("delete from Donation where id=:donationId");
		theQuery.setParameter("donationId", theId);
		
		theQuery.executeUpdate();	
		
	}
	

}


