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
			 <div>
			 	<div id="idCheckLength" class="small text-danger d-none">ID을 4자 이상 입력하세요</div>
				<div id="idCheckduplicated" class="small text-danger d-none">이미 사용중인 아이디 입니다.</div>
				<div id="idCheckOk" class="small text-success d-none">사용 가능한 아이디 입니다.</div></td>
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
			 <a href="/user/sign_in_view">로그인 페이지 이동</a>
			</div>
		</div>
	</form>
<script>
$(document).ready(function(){
	$("#chk_duplicated").on('click', function(){
		
		let loginId = $('input[name=loginId]').val().trim();
		$('#idCheckLength').addClass('d-none');
		$('#idCheckduplicated').addClass('d-none');
		$('#idCheckOk').addClass('d-none');
		
		if(loginId == ""){
			alert("아이디를 입력해주세요");
			return;	
		}
		if(loginId.length < 4){
			$("#idCheckLength").removeClass('d-none');
			return;
		}
		$.ajax({
			url : "/user/is_duplicated_id"
			,data : { "loginId" : loginId }
			,success :  function(data){
				if(data.result == true){
// 					중복인 경우
					$("#idCheckduplicated").removeClass('d-none');
				} else if (data.result == false){
					// 중복이 아닌 경우 => 사용 가능한 아이디
					$('#idCheckOk').removeClass('d-none');		
				} else {
					alert("아이디 중복체크 실패 입니다.");
				}
			}
			, error : function(e){
				alert("통신의 오류입니다 관리자에게 문의해 주세요.");
			}
		})
	});
	
	// 회원 가입
	$("#sign_up").on('submit',function(e){
		
		e.preventDefault();
		
		let loginId = $('input[name=loginId]').val().trim();
		let password = $('#password').val().trim();
		let confirmPassword = $('#confirmPassword').val().trim();
		let name = $('input[name=name]').val().trim();
		let email = $('input[name=email]').val().trim();
		
		if(loginId == ""){
			alert("아이디를 입력해주세요");
			return false;	
		}
		if(password == "" || confirmPassword == ""){
			alert("비밀번호를 입력하세요");
			return false;
		}
		if(password != confirmPassword){
			$('#password').val("");
			$('#confirmPassword').val("");
			alert("비밀번호가 일치하지 않습니다.");
			return false;	
		}
		if(name == ""){
			alert("이름을 입력해주세요");
			return false;	
		}
		if(email == ""){
			alert("email 입력해주세요");
			return false;	
		}
		
		if($('#idCheckOk').hasClass('d-none')) {
			alert("아이디 중복확인을 해주세요.");
			return false;
		}
		
		let url = $(this).attr("action");
		let params = $(this).serialize();
		
		$.post(url, params)
		.done(function(data) {
			if(data.result == "success") {
				alert("회원가입을 환영합니다. 로그인을 해주세요");
				location.href = "/user/sign_in_view";
			} else {
				alert("회원가입에 실패했습니다. 다시 시도해 주세요");
			}
		});
	});
});
</script>
