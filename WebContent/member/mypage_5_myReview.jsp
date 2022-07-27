<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
}

#big {
	min-height: 100%;
	position: relative;
}

#small {
	padding-bottom: 200px; /* footer�� ���� */
}

#product_Info {
	padding:0;
	margin-left: 31%;
	width:930px;
}
#product_info_table{
border-bottom:1px solid black;
width:900px;
height:130px;
left:600px;
}
#product_info_table td{
height:200px;
text-align:center;
}
.img_myreview{
width:150px;
height:150px;
margin:0;
}
.a_tag2{
text-decoration:none;
color:black;
}
.a_tag2:hover{
background:black;
color:white;
}
</style>
</head>
<body>
	<div id="big">
		<div id="small">
			<div id="header">
				<jsp:include page="../include/header.jsp"></jsp:include>
			</div><!-- header -->
			

		
		<jsp:include page="../include/nav_mypage.jsp"/>
			<%-- <div id="mypage_div">
			<hr size="2" style="color: lightgray">
				<br>
				<span id="mypage_span">���������� </span>&nbsp;&nbsp;&nbsp; 
				<b>${sessionScope.loginUser.id}(${sessionScope.loginUser.name})</b>ȸ������ ���� ���������� �Դϴ�.
				<table id="mypage_table">
					<tr>
				<th><a href="ShopServlet?command=mypage_1" class="a_tag2">���ų���</a></th>
				<th><a href="ShopServlet?command=mypage3_1_moveAction" class="a_tag2">ȸ������</a></th>
				<th><a href="ShopServlet?command=mypage_5" class="a_tag2">�� �����ı�</a></th>
				<th><a href="ShopServlet?command=mypage_6" class="a_tag2">�� ���ǳ���</a></th>
				</table>
			</div> --%>
			<br><br><br><br><br><br>
			<div id="product_Info">
		<hr>
		<table id="product_info_table">
		
			<tr style="background:skyblue">
				<th colspan="2">��ǰ��</th>
				<th style="width:400px">��ǰ��</th>
				<th style="width:150px">�ۼ���</th>
			</tr>
		<c:forEach items="${rList}" var="review">
			<tr>
				<td><img src="${review.pImg}" class="img_myreview"></td>
				<td>${review.pName}</td>
				<td>${review.content}<br>
				<details>
					<summary>��� Ȯ���ϱ�</summary>
					<c:choose>
						<c:when test="${empty review.rReply}">
							<b>���� ����� �����ϴ�.</b>
						</c:when>
						<c:otherwise>
							<b>��� : ${review.rReply}</b>
						</c:otherwise>
					</c:choose>
				</details>
				</td>
				<td><fmt:formatDate value="${review.rDate}"></fmt:formatDate></td>
			</tr>
		</c:forEach>
		</table>
			</div>						
		</div>
		<!-- small -->
		<div id="footer">
			<jsp:include page="../include/footer.jsp"></jsp:include></div>
	</div>
	<!-- big -->
</body>
</html>