package com.example.sns.timeline.model;

import java.util.List;

import com.example.sns.comment.model.CommentView;
import com.example.sns.post.model.Post;
import com.example.sns.user.model.User;

// 타임라인의 카드 한개
public class CardView {
	
	private User user; // 글을 쓴 사람		${card}
	private Post post;
	private List<CommentView> commentList;	
	private boolean filledLike;  // 로그인한 내가 좋아요를 누른 여부
	private int likeCount;		// 좋아요 갯수
	
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
	public List<CommentView> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<CommentView> commentList) {
		this.commentList = commentList;
	}
	public boolean isFilledLike() {
		return filledLike;
	}
	public void setFilledLike(boolean filledLike) {
		this.filledLike = filledLike;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	
}
