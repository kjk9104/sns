package com.example.sns.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.sns.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {
	@Autowired
	private PostBO postBO;
	
	@PostMapping("/post_create")
	public Map<String, Object> postCreate(
			@RequestParam("writeTextArea") String content
			,@RequestParam(value="file", required=false) MultipartFile file
			,HttpSession session
			){
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		Object userIdObject = session.getAttribute("userId");
		if(userIdObject == null) {
			// 로그인 되어있지 않음
			result.put("result", "error");
			result.put("error", "로그인 후 사용 가능합니다.");
			return result;
		}
		int userId = (int)userIdObject;
		String userLoginId = (String)session.getAttribute("userLoginId");
		
		postBO.addPost(userId,userLoginId, content, file);
		
		
		return result;
	} 
	
	@DeleteMapping("/delete")
	public Map<String, Object> post_delete(
			@RequestParam("postId") int postId
			,HttpSession session
			){
		Map<String, Object> result = new HashMap<>();
		int userId = (int)session.getAttribute("userId");
		
		postBO.deletePostByPostIdUserId(postId, userId);
		
		result.put("result", "success");
		
		return result;
		
		
	}
}
