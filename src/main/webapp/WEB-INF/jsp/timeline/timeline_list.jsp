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
					<div class="d-flex justify-content-between bg-light pl-3 pr-3">	
				 		<div>${card.user.name}</div>
					 	<a href="#" class="more-btn" data-toggle="modal" data-target="#moreModal" data-post-id="${post.id}">
									<img src="https://www.iconninja.com/files/860/824/939/more-icon.png" width="30">
						</a>	
					</div>	
					 <div class="d-flex justift-content-conter">
					 	<img alt="업로드" src="${post.imagePath}" width="400">
					 	${post.imagePath}
					 </div> 
					 <div>
					 	<span class="content">${post.content}</span>
					 </div>
					 <div>
						 <input class="comment" type="text" placeholder="댓글쓰기"> <button class="commentBtn btn btn-light" type="button"  data-post-id="${post.id}">게시</button>
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
	
	$(".commentBtn").on('click', function(){
		
		
		let comment = $(".comment").val();
		let postId = $(this).data('post-id');
		
		if (comment == '') {
			alert("댓글 내용을 입력해주세요");
			return;
		}
		
		console.log(postId);
		console.log(comment);
		
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
				alert("통신의 실패 했습니다.");
			}
		});
		
	});
		
		
		



});
</script>



