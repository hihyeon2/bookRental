<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<title>회원 정보 상세페이지</title>

<style type="text/css">
body
{
  margin: 0 auto;
  width: 300px;
}
</style>
</head>

<body style="width:1000px;">
	
	<div align="center" >
	<h3>회원 정보 상세페이지</h3>
	<hr>
	<div align="left">
		<button type="button" class="btn btn-dark" onclick="location.href='getUserList.do'">돌아가기</button>
		<br><br>
	</div>
	<table class="table table-hover" style="width:1000px;">
		<tr class="table-primary">
			<th scope="row" width="100px">이름</th>
			<td>${user.name} </td>
		</tr>
		<tr class="table-primary">
	      	<th scope="row">아이디</th>
	      	<td>${user.id }</td>
    	</tr>
    	<tr class="table-primary">
	      	<th scope="row">비밀번호</th>
	      	<td>${user.password }</td>
    	</tr>
    	<tr class="table-primary">
    		<th scope="row">전화번호</th>
	      	<td>${user.phone }</td>
    	</tr>
    	<tr class="table-primary">
    		<th scope="row">이메일</th>
	      	<td>${user.mail }</td>
    	</tr>
    	<tr class="table-primary">
    		<th scope="row">주소</th>
	      	<td>${user.address2 }</td>
    	</tr>
    	<tr class="table-primary">
    		<th scope="row">상세주소</th>
	      	<td>${user.address_detail }</td>
    	</tr>
    	<tr class="table-primary">
    		<th></th>
    		<td align="right">
    			<button type="button" class="btn btn-dark" onclick="location.href='getUserManage.do?id=${user.id }'">수정</button>
	    		<button type="button" class="btn btn-danger" onclick="location.href='deleteUserManage.do?id=${user.id }'">탈퇴</button>
	    	</td>
    	</tr>
	</table>
	</div>
</body>
</html>