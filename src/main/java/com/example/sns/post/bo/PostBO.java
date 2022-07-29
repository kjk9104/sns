package com.example.sns.post.bo;
import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.sns.comment.bo.CommentBO;
import com.example.sns.common.FileManagerService;
import com.example.sns.like.bo.LikeBO;
import com.example.sns.post.dao.PostDAO;
import com.example.sns.post.model.Post;

@Service
public class PostBO {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private FileManagerService fileManager;
			
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
	public void addPost(int userId, String userLoginId, String content, MultipartFile file) {
		String imagePath = null;
		
		if(file != null) {
			imagePath = fileManager.saveFile(userLoginId, file);
		}
		
		postDAO.insertPost(userId, content, imagePath);
	}
	
	
	public List<Post> getPostList(){
		return postDAO.selectPostList();
		
	}
	public Post getPostListById(int postId){
		return postDAO.selectPostById(postId);
	}
	
	public void deletePostByPostIdUserId(int postId, int userId) {
		// 삭제할 글을 셀렉트 해온다.
		Post post = getPostListById(postId);
		if(post ==  null) {
			logger.error("[delete post] 삭제할 게시글이 존재하지 않습니다. postId:{}", postId);
			return;
		}
		// 이미지가 있으면 이미지 삭제
		if(post.getImagePath() != null) {
			try {
				fileManager.deleteFile(post.getImagePath());
			} catch (IOException e) {
				logger.error("[delete post] 이미지 삭제 실패. postId:{}", postId);
			}
		}
		// 글삭제
			postDAO.deletePostByPostId(postId, userId);
		// 댓글들 삭제 byPostID
			commentBO.deleteCommentById(postId);
		// 좋아요 삭제 byPostID
			likeBO.deleteLikeById(postId);
	}
}
