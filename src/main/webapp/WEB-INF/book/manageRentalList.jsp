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
</head>

<body style="width: 800px auto;align-content: center;" >

   <div align="center">
   <h3>대여 현황</h3>
   
   <!-- 검색 시작 -->
   <form action="getRentalList.do" method="get">
      <table class="table" style="width:800px;">
         <tr>
            <td>
               <button type="button" class="btn btn-dark" onclick="location.href='manager-page.jsp'">홈으로</button>
            </td>
            <td align="right">
               <select name="searchCondition">
                  <option value="TITLE">제목</option>
                  <option value="ID">아이디</option>
                  <option value="ISBN">ISBN</option>
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
      <th>제목</th>
      <th>대여자</th>
      <th>대여일</th>
      <th>반납일</th>
      <th>남은 기한</th>
      <th>반납 / 연장</th>
      </tr>
      <c:forEach var="rentalList" items="${rentalList }">
         <tr class="table-primary">
               <td>${rentalList.title }</td>
               <td>${rentalList.id }</td>
               <td>${rentalList.rentday }</td>
               <td>${rentalList.returnday }</td>
               		<c:choose> 
						<c:when test="${rentalList.restday >= 0}">
							<td>${rentalList.restday } 일</td>
							 <td>
				                <button type="button" class="btn btn-danger" onclick="location.href='deleteRental.do?rentalseq=${rentalList.rentalseq}&isbn=${rentalList.isbn}'">반납</button>
				                <button type="button" class="btn btn-warning" onclick="location.href='extendRental.do?rentalseq=${rentalList.rentalseq}'">연장</button>
				             </td>
						</c:when>
						<c:otherwise> 
							<td style="color: red;">${rentalList.restday } 일(연체)</td>
							<td>
				                <button type="button" class="btn btn-danger" onclick="location.href='deleteRental.do?rentalseq=${rentalList.rentalseq}&isbn=${rentalList.isbn}'">반납</button>
				             </td>
						</c:otherwise>
					</c:choose>
          </tr>
       </c:forEach>
   </table>
   <div align="right" style="width: 800px">
      <button type="button" class="btn btn-dark" onclick="location.href='manager-page.jsp'">홈으로</button>
   </div>
   </div>   
</body>
</html>