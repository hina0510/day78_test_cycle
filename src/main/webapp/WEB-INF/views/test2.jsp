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
	$.ajax({
		url : "http://192.168.42.97:12345/test/",
		type : "get",
		dataType : "json",
		data : {"name":"홍길동"},
		contentType : "application/json; charset=utf-8",
		success : (data)=>{
			//$("#result").text(data)
			$("#result").text(data.key)
			console.log(data)
		}, error : ()=>{alert("문제 발생")}
	})
}
</script>
</head>
<body>
test2
<b id="result">데이터</b><br>
<button type="button" onclick="test()">click</button>
</body>
</html>