package com.example.sns.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.sns.comment.dao.CommentDAO;

@Service
public class CommentBO {
	@Autowired
	private CommentDAO commentDAO;
	
	public void getCommentByPostIdanduserIdandContent(int postId,int userId,String content) {
		commentDAO.insertCommentByPostIdanduserIdandContent(postId,userId,content);
	};
	
	// postId -> List<CommentView> => comment 패키지에서
	public List<CommentView> generateCommentVeiwListByPostId(int postId){
		List<Comment> commentList = getCommentByPostIdanduserIdandContent(postId);
	}
}
