<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>댓글 달기</h2>
<form method="post" action="ShopServlet?command=insert_rReply&rNum=${param.rNum}">

<textarea cols="100" rows="30" name="rReply"></textarea><br><br>
<input type="submit" value="댓글 저장">

</form>
</body>
</html>