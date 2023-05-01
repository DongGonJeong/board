<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">


<!-- <title>Insert title here</title> -->
<title>로그인</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script type="text/javascript">
	
	$(function () {
		
		$("#btn_submit").click(function() {
			
			let userid = $("#userid").val();
			let pass = $("#pass").val();
			
			userid = $.trim(userid);
			pass = $.trim(pass);
			
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
			
			$.ajax({

	            type:"POST",
	            
	            data:"userid="+userid+"&pass="+pass,
	            
	            url:"loginWriteSub.do",
	            
	            dataType:"text",

	            success:function(result) {

	                if(result == "ok") {

	                    /* alert("사용 가능한 id입니다!"); */
	                    alert(userid + "님 login되었습니다!");
	                    
	                    location = "boardList.do";


	                } else {

	                    /* alert("이미 사용 중인 id입니다!"); */
	                    alert("id/pw를 다시 확인해주세요!");
	                }
	            },
	            
	            error:function() {

	                alert("오류발생");
	            }
	        });
			
			
		});
		
	});

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

	<form id="frm" name="frm">
	
		<table>
	
            <!-- <caption>회원 가입 form</caption> -->
            <caption>로그인</caption>
            
            <tr>
                <th><label for="userid">아이디</label></th>
                
                <td>
                
                    <input type="text" name="userid" id="userid" placeholder="id 입력"> 
                    
                    <!-- <button type="button" id="btn_idcheck">id 중복 체크</button> -->
                
                </td> 
            
            </tr>
            
            <tr>
                <th><label for="pass">암호</label></th>
                
                <td>
                
                    <input type="password" name="pass" id="pass"> 
                
                </td> 
            
            </tr>
          
        </table>
        
        <div class="div_button">
        
	        <button type="button" id="btn_submit">로그인</button>
        
        	<button type="reset">취소</button>
    
    </div>
        
	</form>

</body>
</html>