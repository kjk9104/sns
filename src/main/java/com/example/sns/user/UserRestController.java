package com.example.sns.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.sns.user.bo.UserBO;
import com.example.sns.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	@Autowired
	private UserBO userBO;
	
	// http://localhost:8080/user/user_list
	@RequestMapping("/user_list")
	public List<User> user_list(){
		
		return userBO.getUserList();
		
	}
}
