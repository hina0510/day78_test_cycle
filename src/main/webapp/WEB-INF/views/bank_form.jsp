<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function test(){
	let form={}
	let arr = $("#frm").serializeArray()
	for(var i=0; i<arr.length; i++){
		form[arr[i].name] = arr[i].value
	}
	console.log(form)
	$.ajax({
		url : "http://192.168.42.97:12345/bank/",
		type : "get",
		dataType : "json",
		data : form,
		contentType : "application/json; charset=utf-8",
		success : (data)=>{
			console.log(data+" : 전송 성공")
			if(data.key==0){
				msg="<b>가입가능성이 높다</b>"
			}else{
				msg="<b>가입가능성이 낮다</b>"
			}
			$("#result").html(msg)
		}, error : ()=>{alert("문제 발생")}
	})
}
</script>
</head>
<body>
	<h1>정기예금 가입 여부</h1> 
	<b id="result">결과를 보여줍니다</b><hr>
	<form id="frm">
	    <input type="text" name="age" placeholder="사용자 나이 입력"><br>
	    <input type="text" name="duration" placeholder="마지막 접촉 지속 시간(초)"><br>
	    <input type="text" name="campaign" 
	         placeholder="마케팅 전화를 받은 수(몇번 통화 됐는지)"><br>
	    <!-- 10일전 마지막 통화인지 20일전 마지막 통화인지를 수로 입력 -->
	    <input type="text" name="pdays" placeholder="마지막으로 통화한 일 수"><br>
	    <input type="text" name="previous" placeholder="가입 제의를 한 횟수"><br>
	    <input type="button" onclick="test()" value="click">
	</form>
</body>
</html>