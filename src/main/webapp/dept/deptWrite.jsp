<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
<form action="deptWriteSave.do" name="frm" method="post">

	<table>
		
		<tr>
			<th>부서 번호</th>
			
			<td>
				<input type="text" name="deptno">
				<!-- <input type="text" name="abc"> -->
			</td>
		</tr>
		
		<tr>
			<th>부서 이름</th>
			
			<td>
				<input type="text" name="dname">
			</td>
		</tr>
		
		<tr>
			<th>부서 위치</th>
			
			<td>
				<input type="text" name="loc">
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