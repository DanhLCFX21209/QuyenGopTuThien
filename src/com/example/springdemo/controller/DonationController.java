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

import com.example.springdemo.entity.Donation;
import com.example.springdemo.entity.Role;
import com.example.springdemo.entity.User;
import com.example.springdemo.service.DonationService;
import com.example.springdemo.service.UserDonationService;






@Controller
@RequestMapping("/user")
public class DonationController {

	// need to inject our customer service
	@Autowired
	private DonationService donationService;

	@Autowired
	private UserDonationService userDonationService;
	
	@RequestMapping("/donation")
	public String showDonation(Model theModel) {
		//get customers from the service
		List<Donation> list = donationService.getDonations();		
		// add the customers to the model
		 theModel.addAttribute("donations", list);
		return "admin/donation";
	}
	
	@PostMapping("/saveDonation")
	public String addDonation(@ModelAttribute("donation") Donation donation) {

		donation.setMoney(0);
		donation.setStatus("1");
		donationService.saveDonation(donation);
        return "redirect:/user/donation";
	}
	
	@PostMapping("/deleteDonation")
	public String deleteDonation(@RequestParam("donationId") int theId) {
		// delete the customer
		userDonationService.deleteUserDonation(theId);
		donationService.deleteDonation(theId);
		return "redirect:/user/donation";
	}
	
	@PostMapping("/updateDonation")
	public String showFormForUpdate(@RequestParam("donationId") int theId,
			@RequestParam("code") String code,
            @RequestParam("name") String name,
            @RequestParam("startDate") String startDate,
            @RequestParam("endDate") String endDate,
            @RequestParam("organizationName") String organizationName,
            @RequestParam("phoneNumber") String phoneNumber,
            @RequestParam("description") String description) {
		
		System.out.println("update thanh chuq");
		Donation donation = donationService.getDonation(theId);
		
		donation.setCode(code);
		donation.setName(name);
		donation.setStartDate(startDate);
		donation.setEndDate(endDate);
		donation.setOrganizationName(organizationName);
		donation.setPhoneNumber(phoneNumber);
		donation.setDescription(description);
		
		donationService.saveDonation(donation);
		
		return "redirect:/user/donation";
	}
	

	@PostMapping("/arrange1")
	public String arrange1(@RequestParam("donationId") int theId) {
		System.out.println(theId + "----");
		Donation donation = donationService.getDonation(theId);
	    System.out.println(donation + " ----------");
		donation.setStatus("2");
	    donationService.saveDonation(donation);
	    
	    return "redirect:/user/donation";
	}
	@PostMapping("/arrange2")
	public String arrange2(@RequestParam("donationId") int theId) {
	    Donation donation = donationService.getDonation(theId);
		donation.setStatus("3");
	    donationService.saveDonation(donation);
	    
	    return "redirect:/user/donation";
	}
	
	@PostMapping("/arrange3")
	public String arrange3(@RequestParam("donationId") int theId) {
	    Donation donation = donationService.getDonation(theId);
		    donation.setStatus("4");
	    donationService.saveDonation(donation);
	    
	    return "redirect:/user/donation";
	}
	
	
	@GetMapping("/detail/{donationId}")
    public String detail(@PathVariable("donationId") int theId, Model model) {
        // Add your logic to retrieve the details of the specific donation
        // Assuming you have a Donation object named "donation" for the given id
		System.out.println(theId);
        Donation donation = donationService.getDonation(theId);

        model.addAttribute("donation", donation);
        return "admin/detail";
    }

	@RequestMapping("/home")
	public String home(Model theModel) {
		//get customers from the service
		List<Donation> list = donationService.getDonations();		
		// add the customers to the model
		 theModel.addAttribute("donations", list);
		return "public/home";
	}
	
	@RequestMapping("/detail2/{donationId}")
	public String detail2(@PathVariable("donationId") int theId, Model model) {
		System.out.println(theId);

		Donation donation = donationService.getDonation(theId);

        model.addAttribute("donation", donation);
        
		return "public/detail";
	}
	
}