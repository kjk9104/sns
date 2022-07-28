package com.example.sns.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.sns.like.dao.LikeDAO;

@Service
public class LikeBO {

	@Autowired
	private LikeDAO likeDAO;
	
	public void onAndOffLike(
			int postId
			,int userId
			) {
		if(likeDAO.selectLike(postId, userId) == false) {
			likeDAO.insertLike(postId,userId);
		} else if(likeDAO.selectLike(postId, userId) ) {
			likeDAO.deleteLike(postId, userId);
		}
	}
	
	public boolean getLikeByPostIdAndUserId(
			int postId
			,int userId) {
		return likeDAO.selectLike(postId,userId);
	}
}
