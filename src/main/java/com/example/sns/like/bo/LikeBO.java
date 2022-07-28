package com.example.sns.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.sns.like.dao.LikeDAO;

@Service
public class LikeBO {

	@Autowired
	private LikeDAO likeDAO;
	
	public void addLike(
			int postId
			,int userId
			) {
		likeDAO.insertLike(postId,userId);
	}
}
