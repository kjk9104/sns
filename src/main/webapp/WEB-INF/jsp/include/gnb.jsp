<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="h-100 d-flex justify-content-between align-items-center">
	<div class="logo">
		<h1>Marondalgram</h1>
	</div>
	<div class="login-info text-light">
		<c:if test="${not empty userId}">
			<c:if test="${empty profile}">
				<div>
					<img class="rounded-circle" alt="프로필 사진" src="https://cdn.icon-icons.com/icons2/2760/PNG/512/profile_icon_176363.png" width="70">
				</div>
			</c:if>
			<c:if test="${not empty profile}">
				<div>
					<img alt="프로필 사진" src="${profile}">
				</div>
			</c:if>
			<span>${userName}님 안녕하세요</span> 
			<a href="/user/sign_out">로그아웃</a>
		</c:if>
	</div>
</div>