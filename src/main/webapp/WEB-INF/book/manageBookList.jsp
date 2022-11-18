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
<title>도서 목록/검색</title>
</head>

<body style="width: 800px auto;align-content: center;" >
   <div align="center">
   <h3>도서 관리</h3>
   
   <!-- 검색 시작 -->
   <form action="getBookListManage.do" method="post">
      <table class="table" style="width:800px;">
         <tr>
            <td>
               <button type="button" class="btn btn-info" onclick="location.href='insertBookPage.do'">새 책 등록</button>
               <button type="button" class="btn btn-dark" onclick="location.href='manager-page.jsp'">홈으로</button>
            </td>
            <td align="right">
            <p style="color: red;font-style: italic;">✓전체 검색 옵션을 선택시 검색창을 비우고 검색버튼을 눌러주세요!</p>
            <select id="searchCondition" name="searchCondition">
                  <option value="TITLE" ${vo.searchCondition == 'TITLE' ? 'selected="selected"' : '' }>책제목</option>
                  <option value="WRITER" ${vo.searchCondition == 'WRITER' ? 'selected="selected"' : '' }>저자</option>
                  <option value="PUBLISHER" ${vo.searchCondition == 'PUBLISHER' ? 'selected="selected"' : '' }>출판사</option>
                  <option value="TITLE">전체 검색</option>
            </select>
            <input type="text" name="searchKeyword" value="${vo.searchKeyword }"> 
            <input type="submit" value="검색"></td><br>
         </tr>
      </table>
   </form>
   <!-- 검색 종료 -->
   <table class="table table-hover" style="width:800px;">
      <c:forEach var="bookList" items="${bookList }">
         <tr class="table-primary">
            <td style="height:100px" rowspan="6"><img src="${bookList.image }" width="160"></td>
               <th scope="row">제목</th>
               <td>${bookList.title }</td>
          </tr>
          <tr class="table-primary">
               <th scope="row">ISBN</th>
               <td>${bookList.isbn }</td>
          </tr>
          <tr class="table-primary">
             <th scope="row">작가</th>
               <td>${bookList.writer}</td>
          </tr>
          <tr class="table-primary">
             <th scope="row">출판사</th>
               <td>${bookList.publisher}</td>
          </tr>
          <tr class="table-primary">
             <th scope="row">소개</th>
               <td>${bookList.content}</td>
          </tr>
          <tr>
             <td>
                <button type="button" class="btn btn-dark" onclick="location.href='getBookManage.do?isbn=${bookList.isbn }'">수정</button>
             </td>
             <td>
                <button type="button" class="btn btn-danger" onclick="location.href='deleteBook.do?seq=${bookList.seq }'">삭제</button>
             </td>
          </tr>
       </c:forEach>
   </table>
   <div align="right" style="width: 800px">
      <button type="button" class="btn btn-info" onclick="location.href='insertBookPage.do'">새 책 등록</button>
      <button type="button" class="btn btn-dark" onclick="location.href='manager-page.jsp'">홈으로</button>
   </div>
   </div>
   
   <div style="text-align: center;">
         <ul class="pagination">
<!--             이전 페이지 시작 -->
            <c:if test='${map.startPage > 10}'>
            <li class="paginate_button page-item previous" id="dataTable_previous">
            <a href="getBookListManage.do?pageNum=${map.startPage-10 }" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">이전페이지</a>
            </li>
            </c:if>
<!--             이전 페이지 끝 -->

<!--             페이징 넘버링 시작 -->
            <c:forEach var="num" begin="${map.startPage }" end="${map.endPage }">
               <li class="pagination_button-item  <c:if test='${vo.pageNum eq num }'>active</c:if>">
                  <a href="getBookListManage.do?pageNum=${num }&searchKeyword=${vo.searchKeyword}&searchCondition=${vo.searchCondition}">${num }</a>
               </li>
            </c:forEach>
<!--             페이징 넘버링 끝 -->

<!--             다음 페이지 시작 -->
            <c:if test='${map.totalPages > map.endPage }'>
            <li class="paginate_button page-item next" id="dataTable_next">
            <a href="getBookListManage.do?pageNum=${vo.pageNum+map.nextFirstNumPage }" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">다음페이지</a>
            </li>
            </c:if>
<!--             다음 페이지 끝 -->
         </ul>
      </div>
   
</body>
</html>