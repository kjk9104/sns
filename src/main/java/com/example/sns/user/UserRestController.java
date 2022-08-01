package com.example.sns.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.sns.user.bo.UserBO;
import com.example.sns.user.model.User;

@RequestMapping("/user")
@RestController
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
			boolean existLoginId = userBO.getUserByLoginId(loginId);
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
		String encryptPassword = com.example.sns.common.EncryptUtils.md5(password);
		
		userBO.addUser(loginId, encryptPassword, name, email);
		
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		return result;
	}
	
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loninId
			,@RequestParam("password") String password
			,HttpServletRequest request
			){
		
		String encryptPassword = com.example.sns.common.EncryptUtils.md5(password);
		
		Map<String, Object> result = new HashMap<>();
		User user = userBO.getUserByIdAndPassword(loninId, encryptPassword);
		
		if(user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("profile", user.getProfile());
			
			result.put("result", "success");
		} else {
			result.put("errorMessage", "존재하지 않는 사용자입니다. 관리자에게 문의해주세요.");
		}
		
		return result;
	}
	
	@RequestMapping("/add_profile")
	public Map<String, Object> getProfile(
			HttpSession session
			,@RequestParam(value="profile", required=false) MultipartFile profile
			){
		
			Map<String, Object> result = new HashMap<>();
			int userId = (int) session.getAttribute("userId");
			String userLoginId = (String) session.getAttribute("userLoginId");
			userBO.updateUserById(userId, profile, userLoginId);
			User user = userBO.getUserById(userId);
			session.setAttribute("profile", user.getProfile());
			result.put("result", "success");
			return result;
	}
}
