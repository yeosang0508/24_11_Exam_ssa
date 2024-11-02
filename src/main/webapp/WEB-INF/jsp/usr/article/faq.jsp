<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="FAQ"></c:set>
<%@ include file="../common/head.jspf"%>

<hr />

<script type="text/javascript">
	function submitQuestion() {
		const question = $('#question').val().trim();

		if (question.length === 0) {
			alert('질문을 입력해 주세요.');
			return;
		}

		$.ajax({
			type : 'POST',
			url : '/usr/article/getAsk',
			data : {
				question : question
			},
			success : function(answer) {
				// 서버에서 받은 답변 처리
				$('#answerSection').show();
				$('#answerText').text(answer);
			},
			error : function() {
				alert('오류가 발생했습니다. 다시 시도해 주세요.');
			}
		});
	}
</script>

<section class="mt-24 text-xl px-4">
<div class="mx-auto">
    <div style="display: flex; justify-content: center;">
        <label class="form-control">
            <div class="label">
                <span class="label-text">질문을 입력하세요 :</span>
            </div>
            <div class="flex items-center w-full space-x-2">
                <textarea id="question" class="textarea textarea-bordered textarea-lg w-full max-w-xs" placeholder="질문을 입력해주세요."></textarea>
                <button type="button" style="margin-left: 10px;" class="btn btn-outline btn-info" onclick="submitQuestion()">질문하기</button>
            </div>
        </label>
    </div>

    <!-- 답변 표시 영역 -->
    <div id="answerSection" style="display: none; margin-top: 20px;">
        <h4>자동 답변:</h4>
        <p id="answerText" style="color: red;"></p>
    </div>

    <div class="btns">
        <button class="btn" type="button" onclick="history.back()">뒤로가기</button>
    </div>
</div>

</section>


<%@ include file="../common/foot.jspf"%>
