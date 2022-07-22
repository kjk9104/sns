package com.example.sns.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.sns.post.dao.PostDAO;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	public void addPost(String userId, String content, String imagePath) {
		postDAO.insertPost(userId, content, imagePath);
	}
}
