package com.example.sns.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.sns.comment.bo.CommentBO;
import com.example.sns.comment.model.CommentView;
import com.example.sns.like.bo.LikeBO;
import com.example.sns.post.bo.PostBO;
import com.example.sns.post.model.Post;
import com.example.sns.timeline.model.CardView;
import com.example.sns.user.bo.UserBO;
import com.example.sns.user.model.User;

@Service
public class TimelineBO {
	
	@Autowired
	private PostBO postBO;
	@Autowired
	private UserBO userBO;
	@Autowired
	private CommentBO commentBO;
	@Autowired
	private LikeBO likeBO;
	// 자기자신의 DAO는 부를 수 있지만, 남의 DAO는 부르면 안된다.
	// 상호참조 하면 안된다. BO<->BO (x)
	// TimelineBO -> PostBO 
	// view(jsp) -> controller -> bo -> dao -> mapper.xml
	public List<CardView> generateCardViewList(Integer userId){
		List<CardView> cardViewList = new ArrayList<>();
		
		// 글 목록을 가져온다.
		List<Post> postList = postBO.getPostList();
		
		// 향상된 for문
		for(Post post : postList) {
			int likeCount = 0;
			CardView card = new CardView();
			// 글 정보
			card.setPost(post);
			// 글쓴 유저 정보
			User user = userBO.getUserById(post.getUserId());
			card.setUser(user);
			
			List<CommentView> commentViewList = commentBO.generateCommentVeiwListByPostId(post.getId());
			card.setCommentList(commentViewList); 
			
			if(userId ==  null) {
				return null;
			}
			// 내가 좋아요 한지 여부
			boolean like = likeBO.getLikeByPostIdAndUserId(post.getId(), userId);
			card.setFilledLike(like);
			
			// 글에 대한 좋아요 개수
			if(like) {
				likeCount++;
				card.setLikeCount(likeCount);
			}
			
			// 결과 리스트에 카드 저장
			cardViewList.add(card);
		}
		
		return cardViewList;
	}
	
}
