<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<div  class="d-flex justify-content-center">
	<div class="contents-box">
		<div class="write-box border rounded m-3">
			<textarea id="writeTextArea" placeholder="내용을 입력해 주세요" class="w-100 border-0"></textarea>
	
		<div class="d-flex justify-content-between">
		<!-- 이미지 업로드를 위한 곳  -->
			<div class="file-upload d-flex">
				<input type="file" id ="file" class="d-none" accept=".gif,.jpg,.png,jpeg">
				<a href="#" id="fileUpLoadBtn">
					<img alt="파일 선택" width="35" src="https://cdn-icons.flaticon.com/png/512/5124/premium/5124630.png?token=exp=1658396115~hmac=754cb5179de5e95bcd4a72862569006a">
				</a>
				
				<!-- 업로드 된 임시 파일명 보이는 곳 -->
				<div id="fileName" class="ml-2">
				</div>
			</div>
			<button id="writeBtn" type="button" class="btn btn-info">게시</button>
			</div>
			
		</div>
		<%-- 타임라인 영역 --%>
		<div>
				
				 <c:forEach var="card" items="${cardViewList}">	
					<div class="d-flex justify-content-between bg-light pl-3 pr-3 mt-5">	
				 		<strong>${card.user.name}</strong>
				 		<!-- 로그인 된 사람과 글쓴이 정보가 일치할 때만 삭제 가능  -->
				 		<c:if test="${card.user.id eq userId}">
					 		<a href="#" class="more-btn"  data-toggle="modal" data-target="#moreModal" data-post-id="${card.post.id}">
									<img src="https://www.iconninja.com/files/860/824/939/more-icon.png" width="30">
							</a>
						</c:if>	
					</div>	
					 <div class="d-flex justify-content-center">
					 	<img alt="업로드" src="${card.post.imagePath}" width="400">
					 </div> 
					 <div>
					 	<span class="content">${card.post.content}</span>
					 </div>
					 <div class="d-flex mb-3 mt-3">
					 	<c:choose>
					 		<c:when test="${card.filledLike eq false}">
					 			<div class="mr-2"><a href="#" class="likeBtn" data-post-id="${card.post.id}"><img class="likeOff" src="https://cdn-icons-png.flaticon.com/512/1077/1077035.png" width="20"></a></div>
					 		</c:when>
					 		<c:when test="${card.filledLike}">
					 			<div class="mr-2"><a href="#" class="likeBtn" data-post-id="${card.post.id}"><img class="likeOff" src="https://www.iconninja.com/files/527/809/128/heart-icon.png" width="20"></a></div>
					 		</c:when>
					 	</c:choose>
					 	<c:if test="${card.likeCount ne 0}">
					 		${card.likeCount} 
					 	</c:if>
					 	<div>좋아요</div>
					 </div>
					 
					 
					 <div class="bg-light">
					 	<strong>댓글 쓰기</strong>
					 </div>
					 <c:forEach var="comment" items="${card.commentList}">
					
						 <div class="d-flex">
						 	<div class="mr-5"><strong>${comment.user.name}</strong></div>	
						 	<c:if test="${card.user.id eq userId}">
							 	<div class="comdelBtn d-flex justify-content-between">
							 		<div>${comment.comment.content}</div>
							 		<div class="mr-3"><a href="#" class="commentDelBtn" data-comment-id="${comment.comment.id}">X</a></div>
							 	</div>
						 	</c:if>
						 	<c:if test="${card.user.id ne userId}">
						 	 	<div>${comment.comment.content}</div>
						 	</c:if>
						 </div>	
					  </c:forEach>
					 <div class="d-flex">
						 <input class="comment form-control" type="text" placeholder="댓글쓰기"> <button class="commentBtn btn btn-light" type="button"  data-post-id="${card.post.id}">게시</button>
					 </div>
				 </c:forEach>
			
		</div>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="moreModal">
  <div class="modal-dialog modal-sm modal-dialog-centered">
    <div class="modal-content">
    	<div class="text-center m-3">
    		<!-- d-block a태그 영역을 넓히기 위해  -->
    		<a href="#" class="del-post d-block">삭제하기</a>
    	</div>
    	<div class="border-top"></div>
    	<div class="text-center m-3">
    	<!-- data-dismiss : 모달창 닫힘  -->
    		<a href="#" class="d-block" data-dismiss="modal">취소하기</a>
    	</div>
    </div>
  </div>
</div>

<script>
$(document).ready(function(){
	// 파일 업도르 이미지 클릭 => input type="file" 숨어있던 창이 열림
	$('#fileUpLoadBtn').on('click',function(e){
		e.preventDefault(); // a태그가 위로 올라가는 현상을 방지
		
		$('#file').click(); // input file을 클릭한 것과 같은 효과
	});
	
	// 파일 업로드를 했을 때, 확장자 이름 노출, 파일 확장자 검증
	$('#file').on('change', function(e){
		let fileName = e.target.files[0].name;
		let arr = fileName.split(".");
		// 확장자 검증
		if (arr.length < 2 ||
			(arr[arr.length -1] != "gif")
				&&(arr[arr.length -1] != "jpeg")
					&&(arr[arr.length -1] != "jpg")
						&&(arr[arr.length -1] != "png")
		){
			alert("이미지 파일만 업로드 할 수 있습니다.");
			$(this).val(""); // 파일을 비운다.
			$('#fileName').text(""); // 파일 이름도 비워줌
			return;
		}
		
		// 임시파일 명 노출
		$("#fileName").text(fileName);
	});
	
	$("#writeBtn").on('click', function(){
		let writeTextArea = $('#writeTextArea').val();
		let file = $('#file').val();
		
		if(writeTextArea == ""){
			alert("내용을 입력해 주세요");
			return false;
		}
		let formData = new FormData();
		formData.append("writeTextArea", writeTextArea);
		formData.append("file", $('#file')[0].files[0]);
		
		
		$.ajax({
			type : "POST"
			,url : "/post/post_create"
			,data : formData
			, enctype: "multipart/form-data"
			, processData: false		
			, contentType: false	
			, success : function(data){
				if(data.result == "success"){
					alert("게시물이 저장되었습니다.");
					location.href = "/timeline/timeline_list_view";
				} else {
					alert(data.errorMessage);
				}
			}
			, error : function(e){
				alert("통신에 실패 했습니다.");
			}			
		});
	});
	
	$(".commentBtn").on('click', function(){
		
		let comment = $(this).siblings('input').val();
		let postId = $(this).data('post-id');
		
		if (comment == '') {
			alert("댓글 내용을 입력해주세요");
			return;
		}
		
		
		$.ajax({
			type :  "post"
			,url : "/comment/create"
			,data : {
				"postId" :  postId
				,"content" :  comment
			}
	
			, success:function(data){
				if (data.result =="success"){
					location.reload(true); // 댓글 쓰고 나서 새로 고침
				} else {
					alert(data.errorMessage);
				}
			}
			, error: function(e){
				alert("통신이 실패 했습니다.");
			}
		});
		
	});
		
	
	$('.likeBtn').on('click', function(e){
		e.preventDefault();
		
			let postId = $(this).data('post-id');
		$.ajax({
			url : "/like/"+postId		
			,success : function(data){
				if(data.result = "success"){
					location.reload(true); // 좋아요 누르고 나서 새로 고침
				}else{
					alert("통신 실패");
				}
			}	
			,error : function(e){
				alert("통신이 실패 했습니다.");
			}
						
		});
	});
	
	// ... 더보기 버튼 클릭시, 모달에 삭제될 글 번호를 넣어준다.
	$('.more-btn').on('click', function(e){
		 e.preventDefault(); // a 태그 기본 동작 중단(위로 올라가는 현상 방지)
		
		 let postId = $(this).data("post-id"); // get
		 
		 // 모달에 삭제될 글 번호를 넣어준다. (모달은 재활용 되기 때문에)
		 let moreModal = $('#moreModal').data('post-id', postId); // set 태그 data-post-id
		 
		 
	});
	
	// 모달창 안에 있는 삭제하기 버튼 클릭
	$('#moreModal .del-post').on('click', function(e){
		e.preventDefault(); // a 태그 위로 올라가는 현상 중단
		
		let postId = $('#moreModal').data('post-id'); // get
		
		$.ajax({
			type : "delete"
			, url : "/post/delete"
			, data : {"postId" : postId}
			, success : function(data){
				if(data.result == "success"){
					location.reload(true);
				} else{
					alert(data.errorMessage);
				}
			}
			,error : function(e){
				alert("삭제하는데 실패했습니다. 관리자에게 문의해주세요.")
			}
		});
	});
	
	$('.commentDelBtn').on('click', function(e){
		e.preventDefault();
		alert("댓글을 삭제하시겠습니까?");
		let commentId = $(this).data('comment-id');
		
		$.ajax({
			type : "delete"
			,url : "/comment/delete"
			,data : {
				"commentId" :  commentId
			}
			,success :  function(data){
				if(data.result == "success"){
					location.reload(true);
				} else {
					alert("댓글삭제 실패");
				}
			}
			,error : function(e){
				alert("통신 실패");
			}
		});	

	});
	
});
</script>



