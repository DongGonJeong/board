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
<!-- <title>Insert title here</title> -->
<title>boardList.jsp</title>

<style type="text/css">

	table {
		width: 600px; 
		border-collapse: collapse;
	}
	
	th, td {
		border: 1px solid #cccccc;
		
		padding: 3px;   
		
		line-height: 2.0;
	}
	
	body {
		font-size: 9px;
		
		font-color: #333333;
		font-family: 맑은 고딕;
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
    
    .div1 {
    	width: 600px;
    	text-align: center;
    	font-size: 15px
    }
    
    .div2 {
    
    	width: 600px;
    	text-align: left;
    	font-size: 8px;
    }
    
    a {
	
	text-decoration: none;  
	}

</style>
</head>

<body>

<%@ include file="../include/topmenu.jsp" %>

	<br><br>

	<div class="div1">일반게시판 목록</div>
	<div class="div2">게시글 total 개수: ${total}</div>
	
	<div class="div2">

		<form action="boardList.do" method="post" name="searchFrm"> 
				
			<select name="searchGubun" id="searchGubun"> 
			
				<option value="title">제목</option>
				<option value="name">글쓴이</option>
				<option value="content">내용</option>
			
			</select>
		
			<input type="text" name="searchText" id="searchText"> 
			
			<!-- <button type="submit">검색</button> -->
			<!-- <button type="submit" onclick="fn_search(); return false;">검색</button> -->
			<button type="submit">검색</button>
		
		</form>
	</div>

	<table>
	
		<tr>
			<!-- <th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>등록일</th>
			<th>조회수</th> -->
			<th width="15%">번호</th>
			<th width="40%">제목</th>
			<th width="15%">글쓴이</th>
			<th width="15%">등록일</th>
			<th width="15%">조회수</th>
			
		</tr>
		
		<%-- <c:set var="cnt" value="1" /> --%>
		<c:set var="cnt" value="${rowNumber}" />
		
		<c:forEach var="result" items="${resultList}">
		
			<!-- <tr> -->
			<tr align="center">
				<!-- <td></td> -->
				<td><c:out value="${cnt}"/></td>
				
				<%-- <td><c:out value="${result.title}"/></td> --%>
				<%-- <td align="left"><c:out value="${result.title}"/></td> --%>
				<td align="left">
					<a href="boardDetail.do?unq=${result.unq}"><c:out value="${result.title}"/></a>
				</td>
				
				<td><c:out value="${result.name}"/></td>
				<td><c:out value="${result.rdate}"/></td>
				<td><c:out value="${result.hits}"/></td>
			
			</tr>
			
			<%-- <c:set var="cnt" value="${cnt+1}" /> --%>
			<c:set var="cnt" value="${cnt-1}" /> 
		
		</c:forEach>
	</table>
	
	<div style="margin-top: 5px; text-align: center; width: 600px;">
	
		<c:forEach var="i" begin="1" end="${totalPage}">
		
			<%-- ${i } --%>
			<a href="boardList.do?viewPage=${i }">${i }</a> 
		</c:forEach>
	
	</div>
	
	<div style="margin-top: 5px; text-align: right; width: 600px;">
		<button type="button" onclick="location='boardWrite.do'">글쓰기</button>
	</div>
</body>
</html>