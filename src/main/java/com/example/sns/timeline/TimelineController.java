package com.example.sns.timeline;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/timeline")
@Controller
public class TimelineController {

	// http://localhost:8080/timeline/timeline_list
		@RequestMapping("/timeline_list")
		public String postCreateView(Model model) {
			model.addAttribute("viewName", "timeline/timeline_list");
			return "/template/layout";
		}
}
