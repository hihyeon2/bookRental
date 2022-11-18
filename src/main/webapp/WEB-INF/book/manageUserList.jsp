<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<title>대여 현황</title>
<style type="text/css">
th, td{
	width: 200px;
}
</style>
</head>
<body style="width: 800px auto;align-content: center;" >
	<div align="center">
	<h3>회원 관리</h3>
	
	<!-- 검색 시작 -->
	<form action="getUserList.do">
		<table class="table" style="width:800px;">
			<tr>
				<td>
					<button type="button" class="btn btn-dark" onclick="location.href='manager-page.jsp'">홈으로</button>
				</td>
				<td align="right">
					<select name="searchCondition">
						<option value="ID">아이디</option>
						<option value="NAME">이름</option>
					</select>
					<input type="text" name="searchKeyword">
					<input type="submit" value="검색">
				</td>	
			</tr>
		</table>
	</form>
	
	<!-- 목록 출력 -->
	<table class="table table-hover" style="width:800px;">
		<tr class="table-primary">
			<th scope="row">아이디</th>
			<th scope="row">이름</th>
			<th scope="row">연락처</th>
			<th scope="row">이메일</th>
		</tr>
		<c:forEach var="userList" items="${userList }">
			<tr class="table-primary">
		      	<td><a href="getUserInfo.do?id=${userList.id }">${userList.id }</a></td>
		      	<td>${userList.name }</td>
		      	<td>${userList.phone }</td>
		      	<td>${userList.mail }</td>
	    	</tr>
	    </c:forEach>
	</table>
	<!-- 목록 끝 -->
	
	<div align="right" style="width: 800px">
		<button type="button" class="btn btn-dark" onclick="location.href='manager-page.jsp'">홈으로</button>
	</div>
	</div>	
</body>
</html>