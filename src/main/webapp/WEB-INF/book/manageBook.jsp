<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<title>도서 상세페이지</title>
</head>

<body>
	
	<div align="center">
	
	<h3>도서 수정</h3>
	<form action="updateBook.do">
	<input type="hidden" name="seq" value="${book.seq }">
	<table class="table table-hover" style="width:1000px;">
		<tr class="table-primary">
			<td rowspan="7" width="200px"><img src="${book.image }" height="320px"></td>
			<th scope="row" width="100px">이미지 소스</th>
			<td><input type="text" class="form-control" value="${book.image }" name="image"></td>
		</tr>
		<tr class="table-primary">
	      	<th scope="row">제목</th>
	      	<td><input type="text" class="form-control" value="${book.title }" name="title"></td>
    	</tr>
    	<tr class="table-primary">
	      	<th scope="row">ISBN</th>
	      	<td><input type="text" class="form-control" value="${book.isbn }" name="isbn"></td>
    	</tr>
    	<tr class="table-primary">
    		<th scope="row">작가</th>
	      	<td><input type="text" class="form-control" value="${book.writer }" name="writer"></td>
    	</tr>
    	<tr class="table-primary">
    		<th scope="row">출판사</th>
	      	<td><input type="text" class="form-control" value="${book.publisher }" name="publisher"></td>
    	</tr>
    	<tr class="table-primary">
    		<th scope="row">소개</th>
	      	<td><textarea class="form-control" id="exampleTextarea" rows="3" name="content">${book.content}</textarea></td>
    	</tr>
    	<tr>
    		<th></th>
    		<td align="right">
    			<button type="button" class="btn btn-dark" onclick="location.href='getBookListManage.do'">돌아가기</button>&nbsp;&nbsp;
    			<input type="submit" class="btn btn-info" value="수정">
    		</td>
    	</tr>
	</table>
	</form>
	</div>
</body>
</html>