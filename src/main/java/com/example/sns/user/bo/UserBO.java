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
	
	public boolean getUserByLoginId(String loginId) {
		return userDAO.selectUserByLoginId(loginId);
		
	}

	public void addUser(
			String loginId
			,String encryptPassword
			,String name
			,String email
			) {
			userDAO.insertUser(loginId, encryptPassword, name, email);
	}


	public User getUserByIdAndPassword(String loginId, String encryptPassword) {
		return userDAO.selectUserByIdAndPassword(loginId, encryptPassword);
	}

	public User getUserById(int id) {
		return userDAO.selectUserById(id);
	}

}
