<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<!-- <title>Insert title here</title> -->
<title>암호 입력 화면(for 삭제)</title>

<script src="/myproject_new/script/jquery-1.12.4.js"></script>
<script src="/myproject_new/script/jquery-ui.js"></script>

</head>

<script>

$(function() { 
	
	$("#delBtn").click(function() {
		
		let pass = $('#pass').val();  
		/* var pass = $('#pass').val(); */  
		
		psss = $.trim(pass);
		
		if(pass == "") {
			
			alert("암호를 입력해주세요!!");
			
			$("#pass").focus();
			 
			return false;
		}
		
		/* let sendData = "unq=${unq}&pass="+pass; */
		/* var sendData = "unq=${unq}&pass="+pass; */
		
		$.ajax({

	        type:"POST",
	        
	        /* data:formData, */
	        data:"unq=${unq}&pass="+pass,
	        /* data: sendData, */
	        
	        /* url:"boardModifySave.do", */
	        url:"boardDelete.do",
	        
	        dataType:"text",
	        
	        success: function(result) {

	            /* if(result == "ok") { */
	            if(result == "1") {

	                /* alert("저장 완료"); */
	                alert("삭제 완료");

	                location = "boardList.do";

	            } else if(result == "-1") {
	            	
	            	alert("암호가 일치하지 않습니다!!");
	            	 
	            } else {

	                /* alert("저장 실패!\n다시 시도해 주세요."); */
	                alert("삭제 실패!\n다시 시도해 주세요.");
	            }
	        },
	            
	        
	        error: function() {

	            alert("**오류발생**");
	        }
	    });
		
	});
});

</script>

<body>

	<table>
	
		<tr>
		
			<th>암호 입력</th>
			
			<td><input type="password" id="pass"></td> 
			
			<td><button type="button" id="delBtn">삭제하기</button></td> 
		
		</tr>
	
	</table>

</body>
</html>