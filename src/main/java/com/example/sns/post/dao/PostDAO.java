package com.example.sns.post.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PostDAO {

	public void insertPost( 
			@Param("userId") String userId
			,@Param("content") String content
			,@Param("imagePath") String imagePath
			);
}
