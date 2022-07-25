package com.example.sns.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.sns.post.dao.PostDAO;
import com.example.sns.post.model.Post;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	public void addPost(int userId, String content, String imagePath) {
		postDAO.insertPost(userId, content, imagePath);
	}
	
	public List<Post> getPost(){
		return postDAO.selectPost();
		
	}
}
