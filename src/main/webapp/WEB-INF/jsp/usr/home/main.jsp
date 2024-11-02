<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN"></c:set>
<%@ include file="../common/head.jspf"%>

<hr />

<section class="main-content">
	<!-- 페이지 소개 -->

	<div class="intro">
		<h1>Welcome to Our Community!</h1>
		<p>We're glad you're here. Whether you have questions, ideas, or just want to connect with others, you're in the right place. Browse through our
			latest discussions, check out the FAQ, or ask your own question!</p>
		<div style="display: flex; justify-content: center;">
			<button class="btn btn-wide mt-10" onclick="location.href='/usr/weather/write'">지역 날씨 알아보기</button>
		</div>
	</div>

	<%@ include file="../common/foot.jspf"%>