package com.example.sns.timeline.model;

import java.util.List;

import com.example.sns.post.model.Post;
import com.example.sns.user.model.User;

// 타임라인의 카드 한개
public class CardView {
	
	private User user; // 글을 쓴 사람		${card}
	private Post post;
	
	
	
	
//	private List<Comment> commentList;
//	private List<Like> likeList;
	
	//getters, setters
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	
}
