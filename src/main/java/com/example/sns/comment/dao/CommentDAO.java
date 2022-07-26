package com.example.sns.comment.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentDAO {

	public void insertCommentByPostIdanduserIdandContent(@Param("postId") int postId,@Param("userId")int userId,@Param("content") String content);
}
