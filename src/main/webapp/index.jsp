<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/bootstrap.css">
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
body, h1, h3{
font-family: 'Jua', sans-serif;
color: black;
}
ul{
list-style: none;
}
.img{
float: left;
padding: 15px
}
nav{
margin-bottom: 15px;
}
</style>
</head>
<body style="width:1200px;text-align:center;margin: 0 auto;" >
   <header>
      <h1 style="text-align: center; padding-top: 30px; padding-bottom: 30px;"><img alt="로고" src="resources/logo.png" width="200px" height="100px"></h1>
   </header>
   <nav>
   <%@ include file="/WEB-INF/book/banner.jsp" %>
   </nav>
   
   <c:if test="${not empty id}"> 
       <span class="badge bg-info">Info</span> ${id }님, 반갑습니다.<br><br>
   </c:if>
   
<%--    <c:import url="index.do"/> --%>
<div style="float: left; width: 550px">
   <h3> " 신작 도서 안내 " </h3>
   <ul>
   <c:forEach var="newBookList" items="${newBookList }">
         <li class="img" style="width: 168.31px;height: 270px;padding: 5px;"><a style="text-decoration: none;"href="getBook.do?isbn=${newBookList.isbn }&state=${newBookList.state}"><img src="${newBookList.image }" width="140" height="200" style="margin-bottom:10px;"><br><p style="color:black;font-family: 'Jua', sans-serif;font-size:18px;">${newBookList.title }</p></a></li>
         
   </c:forEach>
    </ul>
</div>

   <h3> " 오시는 길 " </h3>
   
   <div style="width: 500px; height: 400px;text-align:center;margin: 0 auto;" id="map"></div>

   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bb47c5ab2a62810712d005d5bf9eabff"></script>

   <script>
      var mapContainer = document.getElementById('map'),
      mapOption = {
         center : new kakao.maps.LatLng(37.2681,127.0051),
         level : 3
      };
      var map = new kakao.maps.Map(mapContainer, mapOption);
      var markerPosition = new kakao.maps.LatLng(37.2681,127.0051);
      var marker = new kakao.maps.Marker({
         position : markerPosition
      });
      marker.setMap(map);
   </script>
   <br>
      <p style="font-size:18px;">경기도 수원시 팔달구 매산로2가 63-4 다성빌딩 3층&nbsp;
   </p>
</body>
</html>      