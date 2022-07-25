<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
			    <h1>로그인</h1>
</div>
<div id="loginBox" class="d-flex justify-content-center">
	<form id="signIn" method="post" action="/user/sign_in">
	<div class="d-flex flex-column">
		<input id="loninId" name="loginId" class="form-control-lg" type="text" placeholder="ID">
		<input id="pasworrd" name="password" class="form-control-lg" type="password" placeholder="password">
		<input id="loginForm" class="btn test-light form-control-lg btn-primary" type="submit" value="로그인"/>
		<a class="btn form-control-lg btn-secondary" href="#" type="button">회원가입</a>
	</div>
	</form>
</div>
<script>
$(document).ready(function(){
	$('#signIn').on('submit', function(e){
		e.preventDefault();
		let loninId = $('#loninId').val().trim();
		let pasworrd = $('#pasworrd').val().trim();
		
		
		if(loninId == ""){
			alert("로그인 아이디를 입력하세요");
			return false;
		}
		
		if(pasworrd == ""){
			alert("패스워드를 입력하세요");
			return false;
		}
		
		
		let url = $(this).attr('action');
		let params = $(this).serialize();
		
		console.log(url);
		console.log(params);
		

		$.post(url, params)
		.done(function(data){
			if(data.result == "success"){
				location.href = "/timeline/timeline_list_view";
			}else{
				alert(data.errorMessage);
			}
		});
		
		
		
	});
});
</script>















