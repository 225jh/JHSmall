<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
<style>
*{
	font-family: 'Poor Story', cursive;
}
#p_container_header{
position:relative;
width:1500px;
height:200px;
margin:0 auto;
}
#logo{
position:absolute;
width:140px;
height:140px;
left:150px;
top:30px;
}
#login{
position:absolute;
right:50px;
top:0;
font-size:15px;
}
#input{
font-size: 16px;
width:325px;
padding:5px;
border:0px;
outline:none;
float:left;
}
#input_but{
width:50px;
height:32px;
border:0px;
background:gray;
outline:none;
float:right;
color:#ffffff;
}
#search{
position:absolute;
border: 1px solid lightgray;
background:#ffffff;
left:600px;
top:40px;
}
.mypage{
position:absolute;
width:100px;
height:50px;
}
.my{
left:1250px;
top:30px;
}
.jang{
left:1370px;
top:30px;
}
#category_container{
position:absolute;
left:400px;
top:130px;
}
#category_table{
text-align:center;
width:800px;
}
img{
width:100%;
height:100%;
}
#circle{
width:100%;
height:100%;
border-radius : 70%;
}
.a_tag{
size:"30px";
text-decoration:none;
color:black;
}
.a_tag:hover{
color:red;
}
</style>
</head>
<body>
<form method="post" action="ShopServlet">
<input type="hidden" name="command" value="search">
<div id="p_container_header">
	<div id="logo">
		<a href="ShopServlet?command=index" class="a_tag"><img src="https://i.imgur.com/phkA0Qo.png"></a>
	</div>
	
	<div id="login">
	<c:choose>
			<c:when test="${empty sessionScope.loginUser}">
				<a href="ShopServlet?command=login_form" class="a_tag a_tag3">로그인</a>

				<a href="ShopServlet?command=join_contract" class="a_tag a_tag3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원가입</a>
			</c:when>
	<c:otherwise>
			 	<b>${sessionScope.loginUser.name}님</b>(${sessionScope.loginUser.id}) 반갑습니다.
				<a href="ShopServlet?command=logout" class="a_tag a_tag3"><b>로그아웃</b></a>
	</c:otherwise>
	</c:choose>
	</div>
	
	<div id="search">
		<input id="input" type="search" placeholder="검색어 입력" name="search">
		<button id="input_but" type="submit">검색</button>
	</div>
	
	<div class="mypage my">
	<c:choose>
			<c:when test="${empty sessionScope.loginUser}">
				<a href="ShopServlet?command=login_form" class="a_tag a_tag3">
				<img src="https://images.assetsdelivery.com/thumbnails/drvector/drvector1510/drvector151000230.jpg">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MyPage</a>
			</c:when>
	<c:otherwise>
				<a href="ShopServlet?command=mypage_1&id=${sessionScope.loginUser.id}" class="a_tag a_tag3">
				<img src="https://images.assetsdelivery.com/thumbnails/drvector/drvector1510/drvector151000230.jpg">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MyPage</a>
	</c:otherwise>
	</c:choose>
	</div>
	<div class="mypage jang">
	<c:choose>
			<c:when test="${empty sessionScope.loginUser}">
				<a href="ShopServlet?command=login_form" class="a_tag a_tag3">
				<img src="https://cdn-icons-png.flaticon.com/512/57/57563.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cart</a>
			</c:when>
	<c:otherwise>
				<a href="ShopServlet?command=cart_list&id=${sessionScope.loginUser.id}" class="a_tag a_tag3">
				<img src="https://cdn-icons-png.flaticon.com/512/57/57563.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cart</a>
	</c:otherwise>
	</c:choose>
	</div>
	
	<div id="category_container">
		<table id="category_table">
			<tr><!-- 이미지와 카테코리명에 동일한 주소 줄 것! -->
				<th><a href="ShopServlet?command=category_list&categoryName=outer1" class="a_tag">Outter</a></th>
				<th><a href="ShopServlet?command=category_list&categoryName=top2" class="a_tag">Top</a></th>
				<th><a href="ShopServlet?command=category_list&categoryName=pants3" class="a_tag">Pants&Jeans</a></th>
				<th><a href="ShopServlet?command=category_list&categoryName=training4" class="a_tag">Training</a></th>
				<th><a href="ShopServlet?command=category_list&categoryName=shoes5" class="a_tag">Shoes</a></th>
				<th><a href="ShopServlet?command=category_list&categoryName=acc6" class="a_tag">Accessories</a></th>
			</tr>
		</table>
	</div>
</div>
</form>
</body>
</html>