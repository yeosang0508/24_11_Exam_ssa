<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html data-theme="light">
<head>
<meta charset="UTF-8">
<title>${pageTitle }</title>
<link rel="stylesheet" href="/resource/common.css" />
<script src="/resource/common.js" defer="defer"></script>
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- 폰트어썸 FREE 아이콘 리스트 : https://fontawesome.com/v5.15/icons?d=gallery&p=2&m=free -->

<!-- 테일윈드 -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.1.4/tailwind.min.css"> -->
<!-- 테일윈드 치트시트 : https://nerdcave.com/tailwind-cheat-sheet -->
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2/dist/tailwind.min.css" rel="stylesheet" type="text/css" />

<!-- daisyUI -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.12.10/full.css" />


</head>
<body>
<div class="flex flex-col justify-center items-center min-h-screen bg-blue-50 space-y-4">
    <div class="bg-white rounded-lg p-6 max-w-md shadow-lg">
        <h1 class="text-center text-2xl font-semibold text-gray-800 mb-4">${city}의 날씨입니다</h1>

        <div class="text-center text-gray-600 space-y-2">
            <p><span class="font-bold">날씨:</span> ${description}</p>
            <p><span class="font-bold">현재 온도:</span> ${temp}°C</p>
            <p><span class="font-bold">체감 온도:</span> ${feelsLike}°C</p>
            <p><span class="font-bold">최저 기온:</span> ${tempMin}°C</p>
            <p><span class="font-bold">최고 기온:</span> ${tempMax}°C</p>
            <p><span class="font-bold">습도:</span> ${humidity}%</p>
            <p><span class="font-bold">기압:</span> ${pressure} hPa</p>
            <p><span class="font-bold">풍향:</span> ${windDeg}°</p>
            <p><span class="font-bold">풍속:</span> ${windSpeed} m/s</p>
        </div>
    </div>

    <!-- 뒤로가기 버튼 -->
    <div>
        <button class="btn btn-info mt-4" type="button" onclick="history.back()">뒤로가기</button>
    </div>
</div>
</body>

<%@ include file="../common/foot.jspf"%>
