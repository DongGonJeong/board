<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<!-- <title>Insert title here</title> -->
<title>주소 목록</title>    

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

</head>

<script type="text/javascript">

	$(function () {
		
		$("#btn_send").click(function () {
			
			let addr = $("#address").val();
			alert(addr);
			
			let addr_array = addr.split(" ");
			
			let zipcode = addr_array[0].substring(1, addr_array[0].length-1);
			
			let address = addr.replace(addr_array[0], "");
			
			address = $.trim(address);
			
			/* alert(zipcode);
			
			alert(address); */
			
			opener.document.frm.zipcode.value = zipcode;
			opener.document.frm.address.value = address;
			
			self.close();
			
		});
		
		/* let addr = $("#address").val();
		alert(addr); */
		
	});
</script>

<body>

	<div style="width:100%; text-align: center;">
	
		<!-- <select name="address"> -->
		<select name="address" id="address"> 
	
			<c:forEach var="result" items="${resultList}">
			
			<option value="${result.addr}">${result.addr}</option>
			
			</c:forEach>
	
		</select>
	
		<br> <br> 
	
		<!-- <button type="button">적용하기</button> -->
		<button type="button" id="btn_send">적용하기</button>
			
	
	</div>
	
</body>
</html>