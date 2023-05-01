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
<title>entire code list</title>


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

<script type="text/javascript">

	function fn_delete(code) {
		
		if(confirm("정말 삭제하시겠습니까?")) {
			
			location = "codeDelete.do?code="+code;
		}
	}
	
	function fn_update(code) {
		
		location = "codeModifyWrite.do?code=" + code;
		
	}

</script>
</head>

<body>
	
	<table>
		<%-- <caption>code 목록</caption> --%>
		<caption>
		
			<div>code 목록</div>
			
			<!-- <div style="width:100%; text-align: left;">Total: 개</div> -->
			<div style="width:100%; text-align: left;">Total: ${resultTotal}개</div> 
			
		</caption>
		
		<colgroup>
			<col width="23%"/>
			<col width="25%"/>
			<col width="25%"/>
			
			<col width="27%"/>
		</colgroup>
		
		<tr>
			<th>일련 번호</th>
			<th>그룹명</th>
			<th>code명</th>
			
			<th>수정 or 삭제</th>
			
		</tr>
		
		<c:set var="count" value="1"/> 
		
		<%-- <c:forEach var="a" items="${resultList}"> --%>
		<c:forEach var="list" items="${resultList}">
		
			<!-- <tr> -->
			<tr align="center">
				<!-- <td></td> -->
				<td>${count}</td>
				
				<td>${list.gid}</td>
				<td>${list.name}</td>
				
				<td>
					<!-- <button type="button">수정</button> -->
					<button type="button" onclick="fn_update('${list.code}')">수정</button>
					
					<button type="button" onclick="fn_delete('${list.code}')">삭제</button>
				</td>
			</tr>
			
			<c:set var="count" value="${count+1}"/> 
		
		</c:forEach>
		
		<!-- <tr>
			<td></td>
			<td></td>
			<td></td>
		</tr> -->
	</table>

</body>
</html>