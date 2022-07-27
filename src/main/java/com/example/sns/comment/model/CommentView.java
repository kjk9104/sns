package com.example.sns.comment.model;

import com.example.sns.post.model.Post;
import com.example.sns.user.model.User;

public class CommentView {
	private Comment comment;
	private User user;
	private Post post;
	
	
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
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
