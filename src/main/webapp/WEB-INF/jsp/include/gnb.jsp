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
			<span>${userName}님 안녕하세요</span> 
			<a href="/user/sign_in_view">로그아웃</a>
		</c:if>
	</div>
</div>