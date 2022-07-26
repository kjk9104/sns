package com.example.sns.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.example.sns.post.model.Post;

@Repository
public interface PostDAO {

	public void insertPost( 
			@Param("userId") int userId
			,@Param("content") String content
			,@Param("imagePath") String imagePath
			);
	
	
	public List<Post> selectPostList();
	
	public Post selectPostById(int id);
}
