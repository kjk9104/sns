package com.example.sns.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.example.sns.user.model.User;

@Repository
public interface UserDAO {

	public List<User> selectUserList();
	
	public boolean selectUserByLoginId(String loginId);
	
	public void insertUser(
			@Param("loginId") String loginId
			,@Param("encryptPassword") String encryptPassword
			,@Param("name") String name
			,@Param("email") String email
			);
	
	public User selectUserByIdAndPassword(@Param("loginId")String loginId, @Param("encryptPassword")String encryptPassword);
	
	public User selectUserById(int id);
	
	public void updateUserById(@Param("id")int id , @Param("profile")MultipartFile profile);
}
