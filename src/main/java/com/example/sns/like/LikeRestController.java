package com.example.sns.like;

import java.util.HashMap;
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
	@RequestMapping("/like/{postId}")
	public Map<String, Object> like(
			@PathVariable int postId
			,HttpSession session
			){
		// ###########
		Map<String, Object> result = new HashMap<>();
		Object userIdObject = session.getAttribute("userId");
		int userId = (int) userIdObject;
		
		likeBO.onAndOffLike(postId, userId);
		result.put("result", "success");
		
		return result;
	}
}
