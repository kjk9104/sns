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
			<content>
				 <c:forEach var="post" items="${postList}">
				 <div class="card border rounded mt-3">
					  <div class="p-2 d-flex justify-content-between">
							<span class="font-weight-bold">${content.user.name}</span>
							
							<%-- 글쓴 사용자와 로그인 사용자가 일치할 때만 삭제 가능 --%>
							<c:if test="${userName eq content.user.name}">
								<a href="#" class="more-btn" data-toggle="modal" data-target="#moreModal" data-post-id="${post.content}">
									<img src="https://www.iconninja.com/files/860/824/939/more-icon.png" width="30">
								</a>
							</c:if>
								<button id="writeBtn" class="btn btn-info">게시</button>
						</div>
					</div>
				
					 <div>
					 	<samp>${post.content}</samp>
					 	<img alt="업로드" src="${post.imagePath}" width="400">
					 </div> 
				 </c:forEach>
			</content>
			
			<comment>
			</comment>
		</div>
	</div>
</div>

<div class="d-flex justify-content-center">
	<div class="contents-box">
		
		<%-- 글쓰기 영역 - 로그인 된 상태에서만 보임 --%>
		<c:if test="${not empty userId}">
			<%-- textarea의 테두리는 없애고 div에 테두리를 준다. --%>
			<div class="write-box border rounded m-3">
				<textarea id="writeTextArea" placeholder="내용을 입력해주세요" class="w-100 border-0"></textarea>
				
				<%-- 이미지 업로드를 위한 아이콘과 업로드 버튼을 한 행에 멀리 떨어뜨리기 위한 div --%>
				<div class="d-flex justify-content-between">
					<div class="file-upload d-flex">
						<%-- file 태그는 숨겨두고 이미지를 클릭하면 file 태그를 클릭한 것처럼 이벤트를 줄 것이다. --%>
						<input type="file" id="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
						<%-- 이미지에 마우스 올리면 마우스커서가 링크 커서가 변하도록 a 태그 사용 --%>
						<a href="#" id="fileUploadBtn"><img width="35" src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png"></a>

						<%-- 업로드 된 임시 파일 이름 저장될 곳 --%>
						<div id="fileName" class="ml-2">
						</div>
					</div>
					<button id="writeBtn" class="btn btn-info">게시</button>
				</div>
			</div>
		</c:if>
		
		<%-- 타임라인 영역 --%>
		<%-- my: margin 위아래(y축) --%>
		<div class="timeline-box my-5">
			<%-- 반복문 --%>
			<c:forEach items="${contentList}" var="content">
				<%-- 카드 하나하나마다 영역을 border로 나눔 --%>
				<div class="card border rounded mt-3">
					
					<%-- 글쓴이 아이디 및 ... 버튼(삭제) : 이 둘을 한 행에 멀리 떨어뜨려 나타내기 위해 d-flex, between --%>
					<div class="p-2 d-flex justify-content-between">
						<span class="font-weight-bold">${content.user.name}</span>
						
						<%-- 글쓴 사용자와 로그인 사용자가 일치할 때만 삭제 가능 --%>
						<c:if test="${userName eq content.user.name}">
							<a href="#" class="more-btn" data-toggle="modal" data-target="#moreModal" data-post-id="${content.post.id}">
								<img src="https://www.iconninja.com/files/860/824/939/more-icon.png" width="30">
							</a>
						</c:if>
					</div>
					
					<%-- 카드 이미지 --%>
					<div class="card-img">
						<%-- 이미지가 존재하는 경우에만 노출 --%>
							<img src="${content.post.imagePath}" class="w-100" alt="이미지">
					</div>
					
					<%-- 좋아요 --%>
					<div class="card-like m-3">
						<a href="#" class="like-btn" data-post-id="${content.post.id}">
							<%-- 좋아요 해제 상태 --%>
							<c:if test="${content.filledLike eq false}">
								<img src="https://www.iconninja.com/files/214/518/441/heart-icon.png" width="18px" height="18px" alt="empty heart">
							</c:if>
							<%-- 좋아요 상태 --%>
							<c:if test="${content.filledLike eq true}">
								<img src="https://www.iconninja.com/files/527/809/128/heart-icon.png" width="18px" height="18px" alt="filled heart">
							</c:if>
						
						좋아요 ${content.likeCount}개
						</a>
					</div>
					
					<%-- 글(Post) --%>
					<div class="card-post m-3">
						<span class="font-weight-bold">${content.user.name}</span> 
						<span>
							${content.post.content}
						</span>
					</div>
					
					<%-- 댓글(Comment) --%>
					
					<%-- "댓글" - 댓글이 있는 경우에만 댓글 영역 노출 --%>
					<c:if test="${not empty content.commentList}">
						<div class="card-comment-desc border-bottom">
							<div class="ml-3 mb-1 font-weight-bold">댓글</div>
						</div>
						<div class="card-comment-list m-2">
							<%-- 댓글 목록 --%>
							<c:forEach items="${content.commentList}" var="commentView">
								<div class="card-comment m-1">
									<span class="font-weight-bold">${commentView.user.name} : </span>
									<span>${commentView.comment.content}</span>
									
									<%-- 댓글쓴이가 본인이면 삭제버튼 노출 --%>
									<c:if test="${commentView.user.id eq userId}">
										<a href="#" class="commentDelBtn" data-comment-id="${commentView.comment.id}">
											<img src="https://www.iconninja.com/files/603/22/506/x-icon.png" width="10px" height="10px">
										</a>
									</c:if>
								</div>
							</c:forEach>
						</div>
					</c:if>
					
					<%-- 댓글 쓰기 --%>
					<%-- 로그인 된 상태에서만 쓸 수 있다. --%>
					<c:if test="${not empty userId}">
						<div class="comment-write d-flex border-top mt-2">
							<input type="text" id="commentText${content.post.id}" class="form-control border-0 mr-2" placeholder="댓글 달기"/> 
							<button type="button" class="commentBtn btn btn-light" data-post-id="${content.post.id}">게시</button>
						</div>
					</c:if>
				</div>
			</c:forEach>
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
		
		console.log(writeTextArea);
		console.log(file);
		console.log(formData);
		
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
});
</script>



