package com.example.sns.timeline;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.sns.timeline.bo.TimelineBO;
import com.example.sns.timeline.model.CardView;

@RequestMapping("/timeline")
@Controller
public class TimelineController {

	@Autowired
	private TimelineBO timelineBO;
	
	
	// http://localhost:8080/timeline/timeline_list_view
		@RequestMapping("/timeline_list_view")
		public String postCreateView(
				Model model) {
			
			List<CardView> cardViewList = timelineBO.generateCardViewList();
			
			
//			model.addAttribute("postList", postList);
//			card.CommentView
			
			model.addAttribute("cardViewList", cardViewList);
			model.addAttribute("viewName", "timeline/timeline_list");
			return "/template/layout";
		}
		
	
	
}
