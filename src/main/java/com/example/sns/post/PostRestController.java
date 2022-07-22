package com.example.sns.post;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.sns.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {
	@Autowired
	private PostBO postBO;
	
	@PostMapping("/post_create")
	public Map<String, Object> postCreate(
			@RequestParam("content") String content
			,@RequestParam("imagePath") String imagePath
			){
		
		
		postBO.addPost(userId, content, imagePath);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		return result;
	} 
}
