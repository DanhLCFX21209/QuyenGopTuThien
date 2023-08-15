package com.example.springdemo.controller;



import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
import com.example.springdemo.entity.UserDonation;
import com.example.springdemo.service.DonationService;
import com.example.springdemo.service.UserDonationService;
import com.example.springdemo.service.UserService;




@Controller
@RequestMapping("/user")
public class UserDonationController {

	// need to inject our customer service
	@Autowired
	private UserDonationService userDonationService;
	
	@Autowired
	private DonationService donationService;
	
	@PostMapping("/saveUserDonation")
	public String addUserDonation(@ModelAttribute("userDonation") UserDonation userDonation,@RequestParam("idDonation") int donationId) {
	    Donation donation = new Donation();
	 // Lấy ngày tháng năm hiện tại
	    LocalDate currentDate = LocalDate.now();

	    // Định dạng ngày tháng năm thành chuỗi
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
	    String dateString = currentDate.format(formatter);
	    donation.setId(donationId);
	    userDonation.setDonation(donation);
	    userDonation.setStatus("0");
	    userDonation.setCreated(dateString);
	    userDonationService.saveUserDonation(userDonation);
        return "redirect:/user/home";
	}
	
	@PostMapping("/confirmDonation")
	public String confirmDonation(@RequestParam("idD") int donationId) {
		UserDonation userDonation = userDonationService.getUserDonation(donationId);
		userDonation.setStatus("1");
		
	    // Lấy số tiền từ bảng user_donation và cập nhật vào đợt quyên góp
	    int money = userDonation.getMonney();
	    Donation donation = userDonation.getDonation();
	    donation.setMoney(donation.getMoney() + money);
		
		userDonationService.saveUserDonation(userDonation);
	    donationService.saveDonation(donation);


		return "redirect:/user/donation";
	}
	
}