<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>Insert title here</title> -->
<title>회원 가입 화면</title>


  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  
  <script>
  $( function() {
	  
    /* $( "#datepicker" ).datepicker({ */
    $( "#birth" ).datepicker({
    	
      changeMonth: true,
      changeYear: true
    });
    
    $("#btn_zipcode").click(function() {
    	
    	let w = 500;
    	let h = 100;
    	let url = "post1.do";
    	
    	window.open(url, 'zipcode', 'width='+w+",height="+h);
    
		
	});
    
    $("#btn_idcheck").click(function () {
		
    	/* let userid = $("#userid").val(); */
    	var userid = $("#userid").val();
    	
    	userid = $.trim(userid);
    	
    	if(userid == "") {
    		
    		alert("id를 입력해주세요!");
    		
    		$("#userid").focus();
    		
    		return false;
    	}
    	
    	$.ajax({

            type:"POST",
            data:"userid="+userid,
            url:"idcheck.do",
            dataType:"text",

            success:function(result) {

                if(result == "ok") {

                    alert("사용 가능한 id입니다!");

                    /* location = "loginWrite.do"; */

                } else {

                    alert("이미 사용 중인 id입니다!");
                }
            },
            
            error:function() {

                alert("오류발생");
            }
        });
    	
    	
	});
    
    $("#btn_submit").click(function() {
    	
    	let userid = $("#userid").val();
    	let pass = $("#pass").val();
    	let name = $("#name").val();
    	
    	userid = $.trim(userid);
    	pass = $.trim(pass);
    	name = $.trim(name);
    	
    	if(userid == "") {
    		
    		alert("id를 입력해주세요!");
    		
    		$("#userid").focus();
    		
    		return false;
    	
    	}
    	
		if(pass == "") {
    		
    		alert("암호를 입력해주세요!");
    		
    		$("#pass").focus();
    		
    		return false;
    	
    	}
    	
		if(name == "") {
	
			alert("이름을 입력해주세요!");
	
			$("#name").focus();
	
			return false;

		}
		
		$("#userid").val(userid);
		$("#pass").val(pass);
		$("#name").val(name);
		
		let formData = $("#frm").serialize();
		
		$.ajax({

	        type:"POST",
	        data:formData,
	        url:"memberWriteSave.do",
	        dataType:"text",
	        
	        success:function(result) {

	            if(result == "ok") {

	                alert("저장 완료");

	                location = "loginWrite.do";

	            } else {

	                alert("저장 실패! 다시 시도해 주세요.");
	            }
	        },
	        error:function() {

	            alert("오류발생");
	        }
	    });
    	
	});
    
    
    
  } );
  </script>
</head>

<style>
body {

	font-size: 9pt;
	font-color: #333333;
	font-family: 맑은 고딕;
}

a {
	
	text-decoration: none;  
}

table {

	width: 600px;
	border-collapse: collapse;
}

th, td {

	border: 1px solid #cccccc;
	padding: 3px;
	
	line-height: 2.0;
}

caption {

	font-size: 15px;
	font-weight: bold;
	margin-top: 10px;
	margin-bottom: 3px;
}

.div_button {

	width: 600px;     
	text-align: center;
	margin-top: 5px;
}
</style>

<body>

<%@ include file="../include/topmenu.jsp" %>


<!-- <form id="frm"> -->
<form id="frm" name="frm">
 
<!-- <table>
	<tr>
		<th>홈</th>
		<th>게시판</th>
		<th>회원 가입</th>
		<th>로그인</th>
		<th width="25%">홈</th>
		<th width="25%">게시판</th>
		<th width="25%">회원 가입</th>
		<th width="25%">로그인</th>
		<th width="25%">홈</th>
		<th width="25%"><a href="/myproject_new/boardList.do">게시판</a></th>
		<th width="25%"><a href="/myproject_new/memberWrite.do">회원 가입</a></th>
		<th width="25%"><a href="/myproject_new/loginWrite.do">로그인</a></th>
	</tr>

</table> -->

<table>
	
	<caption>회원 가입 form</caption>
	
	<tr>
		<th><label for="userid">아이디</label></th>
		
		<td>
		
			<!-- <input type="text" name="userid" id="userid"> -->
			<input type="text" name="userid" id="userid" placeholder="id 입력"> 
			
			<button type="button" id="btn_idcheck">id 중복 체크</button>
		
		</td> 
	
	</tr>
	
	<tr>
		<th><label for="pass">암호</label></th>
		
		<td>
		
			<input type="password" name="pass" id="pass"> 
		
		</td> 
	
	</tr>
	
	<tr>
		<th><label for="name">이름</label></th>
		
		<td>
		
			<input type="text" name="name" id="name"> 
			
		</td> 
	
	</tr>
	
	<tr>
		<th><label for="gender">성별</label></th>
		
		<td>
		
			<input type="radio" name="gender" id="gender" value="M">남
			<input type="radio" name="gender" id="gender" value="F">여 
			
		</td> 
	
	</tr>
	
	<tr>
		<th><label for="birth">생년월일</label></th>
		
		<td>
		
			<!-- <input type="text" name="birth" id="birth" readonly> -->
			<input type="text" name="birth" id="birth">
			
		</td> 
	
	</tr>
	
	<tr>
		<th><label for="phone">연락처</label></th>
		
		<td>
		
			<input type="text" name="phone" id="phone">(예: 010-1234-1234) 
			
		</td> 
	
	</tr>
	
	<tr>
		<th><label for="address">주소</label></th>
		
		<td>
		
			<input type="text" name="zipcode" id="zipcode">
			
			<!-- <button type="button">우편번호 찾기</button> -->
			<button type="button" id="btn_zipcode">우편번호 찾기</button> 
			
			<br>
			
			<input type="text" name="address" id="address">
		</td> 
	
	</tr>

</table>

<!-- <div> -->
<div class="div_button">

	<!-- <button type="submit">저장</button> -->
	<!-- <button type="submit" id="btn_submit">저장</button> -->
	<button type="button" id="btn_submit">저장</button>
	
	<button type="reset">취소</button>

</div>

</form>

</body>
</html>