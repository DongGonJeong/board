<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정 화면</title>


<style type="text/css">

	table {
		width: 600px; 
		border-collapse: collapse;
	}
	
	th, td {
		border: 1px solid #cccccc;
		
		padding: 3px;   
	}
	
	body {
		font-size: 9px;
	}
	
	button {
		font-size: 9px;
    }
    
    .input1 {
    	width: 98%;
    }
    
    .textarea {
    	width: 98%;
    	height: 70px
    }

</style>

<script src="/myproject_new/script/jquery-1.12.4.js"></script>
<script src="/myproject_new/script/jquery-ui.js"></script>

</head>

<script type="text/javascript">

	 /* $(function () {
		 
		 $("#title").val("제목 입력 초기화 test");
		
	}); */	

	 
	  function fn_submit() {
		  
		  /* if($("#title").val() == "") { */
		  if($.trim($("#title").val()) == "") {
			  
			  alert("제목을 입력해주세요!");
			  
			  $("#title").focus();
			  
			  return false;
			  
		  }
		  
		  $("#title").val($.trim($("#title").val()));
		  
		 /* if($("#pass").val() == "") { */
		 if($.trim($("#pass").val()) == "") {
			 
		 
			  alert("암호를 입력해주세요!");
			  
			  $("#pass").focus();
			  
			  return false;
			  
		 }
		 
		 $("#pass").val($.trim($("#pass").val()));
		
		/* if(document.frm.title.value == "") {
			
			alert("제목을 입력해주세요!");
			
			document.frm.title.focus();
			
			return false;
			
		}
		
		if(document.frm.pass.value == "") {
			
			alert("암호를 입력해주세요!");
			
			document.frm.pass.focus();
			
			return false;
			
		} */ 
		/* ---------------------------------------------------------------- */
		
		 var formData = $("#frm").serialize();

		    $.ajax({

		        type:"POST",
		        data:formData,
		        url:"boardModifySave.do",
		        dataType:"text",
		        
		        success:function(result) {

		            /* if(result == "ok") { */
		            if(result == "1") {

		                alert("저장 완료");

		                location = "boardList.do";

		            } else if(result == "-1") {
		            	
		            	alert("암호가 일치하지 않습니다!!");
		            	 
		            } else {

		                alert("저장 실패!\n다시 시도해 주세요.");
		            }
		        },
		        error:function() {

		            alert("오류발생");
		        }
		    });
	}
</script>

<body>

	<form id="frm">
	
		<input type="hidden" name="unq" value="${boardVO.unq}">
		
		<table>
		<%-- <caption>게시판 등록</caption> --%>
		<caption>게시판 수정</caption>
		
		<tr>
			<th width="20%"><label for="title">제목</label></th>
			
			<!-- <td width="80%"><input type="text" name="title" id="title" class="input1"></td> -->
			<td width="80%"><input type="text" name="title" id="title" class="input1" value="${boardVO.title}"></td>
		</tr>
		
		<tr>
			<th><label for="pass">암호</label></th>
			
			<td><input type="password" name="pass" id="pass"></td>
		</tr>
		
		<tr>
			<th><label for="name">글쓴이</label></th>
			
			<td><input type="text" name="name" id="name" value="${boardVO.name}"></td>
		</tr>
		
		<tr>
			<th><label for="content">내용</label></th>
			
			<!-- <td><textarea name="content" id="content" class="textarea"></textarea></td> -->
			<td><textarea name="content" id="content" class="textarea">${boardVO.content}</textarea></td>
		</tr>
		
		<tr>
			<th colspan="2">
				<button type="submit" onclick="fn_submit(); return false;">저장</button>
				
				<button type="reset">취소</button>
			</th>
		</tr>
	
	</table>
	
	</form>
	
</body>
</html>