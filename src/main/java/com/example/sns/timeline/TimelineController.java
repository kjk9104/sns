package com.example.sns.timeline;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sns.post.bo.PostBO;
import com.example.sns.post.model.Post;
import com.example.sns.user.bo.UserBO;

@RequestMapping("/timeline")
@Controller
public class TimelineController {

	@Autowired
	private PostBO postBO;
	
	// http://localhost:8080/timeline/timeline_list_view
		@RequestMapping("/timeline_list_view")
		public String postCreateView(
				Model model) {
			
			List<Post> postList= postBO.getPostList();
			
			model.addAttribute("postList", postList);
			model.addAttribute("viewName", "timeline/timeline_list");
			return "/template/layout";
		}
		
	
	
}
