package com.example.sns.user.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.sns.user.dao.UserDAO;
import com.example.sns.user.model.User;

@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;
	
	public List<User> getUserList(){
		return userDAO.selectUserList();
	}
	
}
