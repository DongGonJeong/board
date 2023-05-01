<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<%-- <% pageContext.setAttribute("newline", "\n"); %> --%>

<%-- <c:set var="content" value="${fn:replace(boardVO.content, newline, '<br>')}"/> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>게시판 등록 화면</title> -->
<title>게시판 상세 보기 화면</title>

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

	 $(function () {
		 
		 $("#title").val("제목 입력 초기화 test");
		
	});	

	 
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
		        url:"boardWriteSave.do",
		        dataType:"text",
		        success:function(data) {

		            if(data == "ok") {

		                alert("저장 완료");

		                location = "boardList.do";

		            } else {

		                alert("저장 실패! 다시 시도해 주세요.");
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
		
		<table>
		
		<%-- <caption>게시판 등록</caption> --%>
		<caption>게시판 상세 보기</caption>
		
		<tr>
			<!-- <th width="20%"><label for="title">제목</label></th> -->
			<th width="20%">제목</th>
			
			<!-- <td width="80%"><input type="text" name="title" id="title" class="input1"></td> -->
			<!-- <td width="80%"></td> -->
			<td width="80%">${boardVO.title}</td>
		</tr>
		
		<tr>
			<!-- <th><label for="name">글쓴이</label></th> -->
			<th>글쓴이</th>
			
			<!-- <td><input type="text" name="name" id="name"></td> -->
			<!-- <td></td> -->
			<td>${boardVO.name}</td>
		</tr>
		
		<tr>
			<!-- <th><label for="content">내용</label></th> -->
			<th>내용</th>
			
			<!-- <td><textarea name="content" id="content" class="textarea"></textarea></td> -->
			<!-- <td></td> -->
			<%-- <td>${boardVO.content}</td> --%>
			<%-- <td height="50">${boardVO.content}</td> --%>
			<%-- <td height="50">${content}</td> --%>
			<td height="50">${boardVO.content}</td>
			
		</tr>
		
		<tr>
			<th>등록일</th>
			
			<!-- <td></td> -->
			<td>${boardVO.rdate}</td>
		</tr>
		
		<tr>
			<th colspan="2">
				<!-- <button type="submit" onclick="fn_submit(); return false;">저장</button>
				<button type="reset">취소</button> -->
				<button type="button" onclick="location='boardList.do'">목록</button>
				<button type="button" onclick="location='boardModifyWrite.do?unq=${boardVO.unq}'">수정</button>
				<button type="button" onclick="location='passWrite.do?unq=${boardVO.unq}'">삭제</button>
			</th>
		</tr>
	
	</table>
	
	</form>
	
</body>
</html>