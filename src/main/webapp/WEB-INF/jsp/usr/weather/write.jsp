<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="weather"></c:set>
<%@ include file="../common/head.jspf"%>

<hr />

<section class="main-content">
	<div style="display: flex; justify-content: center;">
		<div class="intro ">
			<div class="font-bold">날씨를 확인할 도시를 입력해주세요</div>

			<c:if test="${not empty error}">
				<p style="color: red;">${error}</p>
			</c:if>

			<form action="/weather" method="get" class="mt-10">
				<label for="city">도시 이름 :</label>
				<div style="display: flex; align-items: center;">
					<input type="text" id="city" name="city" placeholder="지역을 입력해주세요" class="input input-ghost w-full max-w-xs" />
					<button class="btn btn-active btn-ghost" type="submit" style="margin-left: 10px;">조회</button>
				</div>
			</form>

		</div>
	</div>
	<%@ include file="../common/foot.jspf"%>