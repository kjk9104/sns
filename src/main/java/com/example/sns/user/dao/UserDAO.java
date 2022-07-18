package com.example.sns.user.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.sns.user.model.User;

@Repository
public interface UserDAO {

	public List<User> selectUserList();
}
