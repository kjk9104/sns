<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="d-flex justify-content-center">
			    <h1>회원 가입</h1>
	</div>
	<form id="sign_up" method="post" action="/user/sign_up">
		<div class="d-flex justify-content-center">
			<div id="sign_up_box" class="d-flex flex-column">
			 <span>ID</span>
			 <div>
			 <input name="loginId" class="form-control-sm" type="text" placeholder="아이디를 입력해주세요">
			 <button id="chk_duplicated" type="button" class="btn btn-primary text-light">중복 확인</button>
			 </div>
			 <span>password</span>
			 <input name="password" id="password" class="form-control-sm " type="password" placeholder="비밀번호를 입력해주세요">
			 <span>confirm password</span>
			 <input id="confirmPassword" class="form-control-sm" type="password" placeholder="비밀번호를 다시 입력해주세요">
			 <span>이름</span>
			 <input name="name" class="form-control-sm" type="text" placeholder="이름을 입력해주세요">
			 <span>이메일</span>
			 <input name="email" class="form-control-sm" type="text" placeholder="이메일을 입력해주세요">
			 <input type="submit" value="회원가입" class="btn btn-primary">
			</div>
		</div>
	</form>
<script>
$(document).ready(function(){
	$("#chk_duplicated").on('click', function(){
		
		let loginId = $('input[name=loginId]').val().trim();
		
		if(loginId == ""){
			alert("아이디를 입력해주세요");
			return;	
		}
		
		
	});
	
	$("#sign_up").on('submit',function(){
		
		e.preventDefault();
		
		let loginId = $('input[name=loginId]').val().trim();
		let password = $('#password').val().trim();
		let confirmPassword = $('#confirmPassword').val().trim();
		let name = $('input[name=name]').val().trim();
		let email = $('input[name=email]').val().trim();
		
		if(loginId == ""){
			alert("아이디를 입력해주세요");
			return;	
		}
		if(password == ""){
			alert("아이디를 입력해주세요");
			return;	
		}
		if(confirmPassword == ""){
			alert("아이디를 입력해주세요");
			return;	
		}
		if(password != confirmPassword){
			alert("비밀번호를 확인해 주세요");
			return;	
		}
		if(name == ""){
			alert("아이디를 입력해주세요");
			return;	
		}
		if(email == ""){
			alert("아이디를 입력해주세요");
			return;	
		}
	});
});
</script>
