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
<title>도서 등록</title>
</head>
<body style="width:1200px;text-align:center;margin: 0 auto;" >

   <div align="center">
   <h3>도서 수정</h3>
   <form action="insertBook.do">
   <table class="table table-hover" style="width:1000px;">
      <tr class="table-primary">
         <td rowspan="7" width="200px"><img src="https://secure.webtoolhub.com/static/resources/icons/set113/ce45f72d.png" width="330px"></td>
         <th scope="row" width="100px">이미지 소스</th>
         <td><input type="text" class="form-control" name="image"></td>
      </tr>
      <tr class="table-primary">
            <th scope="row">제목</th>
            <td><input type="text" class="form-control" name="title"></td>
       </tr>
       <tr class="table-primary">
            <th scope="row">ISBN</th>
            <td><input type="text" class="form-control" name="isbn"></td>
       </tr>
       <tr class="table-primary">
          <th scope="row">작가</th>
            <td><input type="text" class="form-control" name="writer"></td>
       </tr>
       <tr class="table-primary">
          <th scope="row">출판사</th>
            <td><input type="text" class="form-control" name="publisher"></td>
       </tr>
       <tr class="table-primary">
          <th scope="row">소개</th>
            <td><textarea class="form-control" id="exampleTextarea" rows="3" name="content"></textarea></td>
       </tr>
       <tr>
          <th></th>
          <td align="right">
             <input type="submit" class="btn btn-info" value="등록">&nbsp;&nbsp;
             <input type="reset" class="btn btn-info"  value="취소">
          </td>
       </tr>
   </table>
   </form>
   </div>
</body>
</html>