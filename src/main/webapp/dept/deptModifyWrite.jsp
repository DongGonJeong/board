<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>


<style>
table {
	width: 400px;
	border-collapse: collapse;
}

th, td {
	
	border: 1px solid #cccccc;
	
	padding: 5px;
}


</style>
</head>

<body>

<!-- <form action="" name="frm" method="post"> -->
<%-- <form action="deptWriteSave.do" name="frm" method="post"> --%>
<form action="deptModifySave.do" name="frm" method="post">


	<table>
		
		<tr>
			<th>부서 번호</th>
			
			<td>
				<!-- <input type="text" name="abc"> -->
				<!-- <input type="text" name="deptno"> -->
				<%-- <input type="text" name="deptno" value="${vo.deptno}}"> --%>
				<input type="text" name="deptno" value="${vo.deptno}" readonly>
			</td>
		</tr>
		
		<tr>
			<th>부서 이름</th>
			
			<td>
				<!-- <input type="text" name="dname"> -->
				<input type="text" name="dname" value="${vo.dname}">
			</td>
		</tr>
		
		<tr>
			<th>부서 위치</th>
			
			<td>
				<!-- <input type="text" name="loc"> -->
				<input type="text" name="loc" value="${vo.loc}">
			</td>
		</tr>
		
		<tr>
			<th colspan="2">
				<button type="submit">저장</button>
			</th>
		</tr>
	
	</table>

</form>

	

</body>
</html>