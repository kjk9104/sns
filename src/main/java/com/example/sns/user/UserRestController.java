package com.example.sns.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.sns.user.bo.UserBO;
import com.example.sns.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	@Autowired
	private UserBO userBO;
	
	// http://localhost:8080/user/user_list
	@RequestMapping("/user_list")
	public List<User> user_list(){
		
		return userBO.getUserList();
		
	}
	
	@GetMapping("is_duplicated_id")
	public Map<String, Object> is_duplicated_id(
			@RequestParam("loginId") String loginId
			){
			boolean existLoginId = userBO.getUserById(loginId);
			Map<String ,Object> result = new HashMap<>();
			
			result.put("result", existLoginId);
		
		return result;
	}
	
	@PostMapping("/sign_up")
	public Map<String,Object> signUp(
			@RequestParam("loginId") String loginId
			,@RequestParam("password") String password
			,@RequestParam("name") String name
			,@RequestParam("email") String email
			){
		// 비밀번호 암호화(md5,SHA256, 512)
		String encryptPassword = com.example.sns.common.EncryptUtils.md5(password);
		
		// db insert
		userBO.addUser(loginId, encryptPassword, name, email);
		
		
		// 결과 리턴
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		return result;
		
	}
}
