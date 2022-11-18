<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
   href="../resources/bootstrap.css">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<title>상단 메인 배너</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
body ul, a{
font-family: 'Jua', sans-serif;
}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.do">도서관</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
        <c:choose>
         <c:when test="${empty id }">
            <a class="nav-link" href="login.do" style="font-size:18px">로그인
            <span class="visually-hidden">(current)</span>
             </a>
         </c:when>
         <c:otherwise>
             <a class="nav-link" href="logout.do" style="font-size:18px">로그아웃
             <span class="visually-hidden">(current)</span>
             </a>
         </c:otherwise>
         </c:choose>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="font-size:18px">마이페이지</a>
          <div class="dropdown-menu">
             <c:choose>
             <c:when test="${empty id }">
             <a class="dropdown-item" href="login.do" style="font-size:18px">회원정보수정</a>
            <a class="dropdown-item" href="login.do" style="font-size:18px">회원대출정보</a>
             </c:when>
             <c:otherwise>
             <a class="dropdown-item" href="getMember.do?id=${id}" style="font-size:18px">회원정보수정</a>
            <a class="dropdown-item" href="memberRental.do?id=${id}" style="font-size:18px">회원대출정보</a>
             </c:otherwise>
             </c:choose>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="getBookList.do" style="font-size:18px">도서 검색</a>
        </li>
      </ul>
<!--       <form class="d-flex"> -->
<!--         <input class="form-control me-sm-2" type="text" placeholder="Search"> -->
<!--         <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button> -->
<!--       </form> -->
    </div>
  </div>
</nav>

</body>
</html>