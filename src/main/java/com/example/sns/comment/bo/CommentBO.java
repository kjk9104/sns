package com.example.sns.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.sns.comment.dao.CommentDAO;
import com.example.sns.comment.model.Comment;
import com.example.sns.comment.model.CommentView;
import com.example.sns.user.bo.UserBO;
import com.example.sns.user.model.User;

@Service
public class CommentBO {
	@Autowired
	private CommentDAO commentDAO;
	@Autowired
	private UserBO userBO;
	
	public void getCommentByPostIdanduserIdandContent(int postId,int userId,String content) {
		commentDAO.insertCommentByPostIdanduserIdandContent(postId,userId,content);
	};
	
	public List<Comment> getCommentById(int postid) {
		return commentDAO.selectCommentById(postid);
	}
	
	// postId -> List<CommentView> => comment 패키지에서
	public List<CommentView> generateCommentVeiwListByPostId(int postId){
		List<CommentView> CommentViewList = new ArrayList<>();
		
		List<Comment> commentList = getCommentById(postId);
		
		for(Comment comments : commentList) {
			CommentView comment = new CommentView();
			// 댓글 리스트
			comment.setComment(comments);
			
			// 유저 정보
			User user = userBO.getUserById(comments.getUserId());
			comment.setUser(user);
			
			CommentViewList.add(comment);
		}
		
		return CommentViewList;
	}
}
