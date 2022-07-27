package com.example.sns.like;

import java.util.Map;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LikeRestController {

	
	// 좋아요/해제
	@RequestMapping("/like/{postid}")
	public Map<String, Object> like(
			@PathVariable int postId
			){
		
		
		return null;
	}
}
