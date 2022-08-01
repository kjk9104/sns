package com.example.sns.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.sns.comment.model.Comment;

@Repository
public interface CommentDAO {

	public void insertCommentByPostIdanduserIdandContent(@Param("postId") int postId,@Param("userId")int userId,@Param("content") String content);
	
	public List<Comment> selectCommentById(int postId);
	
	public void deleteCommentById(int commnetId);
}
