package com.example.sns.like;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.sns.like.bo.LikeBO;

@RestController
public class LikeRestController {

	@Autowired
	private LikeBO likeBO;
	
	// 좋아요/해제
	@RequestMapping("/like/{postid}")
	public Map<String, Object> like(
			@PathVariable int postId
			,HttpSession session
			){
		 
		Object userIdObject = session.getAttribute("userId");
		int userId = (int) userIdObject;
		
		likeBO.addLike(postId, userId);
		
		return null;
	}
}
