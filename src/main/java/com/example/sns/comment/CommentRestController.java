package com.example.sns.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.sns.comment.bo.CommentBO;

@RequestMapping("/comment")
@RestController
public class CommentRestController {
	@Autowired
	private CommentBO commetBO;
	
	@PostMapping("/create")
	public Map<String, Object> create(
			@RequestParam("postId") int postId
			,@RequestParam("content") String content
			,HttpSession session
			){
			
		
		 	Map<String, Object> result = new HashMap<>();
			Object userIdObj = session.getAttribute("userId");
			
			
			if (userIdObj == null) {
				result.put("result", "fail");
				result.put("errorMessage", "로그인을 해야 사용할 수 있습니다.");
				
				return result;
			}
			
			int userId = (int)session.getAttribute("userId");
			
			//insert db
			commetBO.getCommentByPostIdanduserIdandContent(postId,userId,content);
			
			result.put("result", "success");
		
			return result;
				
		
	}
}
