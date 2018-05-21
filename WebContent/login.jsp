<%@page import="travels.MemberDataAccessObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	MemberDataAccessObject md = MemberDataAccessObject.getInstance();
	int result = md.login(id, password);
	if(result>0){
		session.setAttribute("id", id);
		%>
		<script type="text/javascript">
		opener.location.href="index.html";
		window.close();
		</script>
		<%
	}else if(result ==0){
		%>
		<script type="text/javascript">
		alert("비밀번호가 틀렸습니다");
		history.go(-1);
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("존재하지 않는 아이디입니다");
		history.go(-1);
		</script>
		<%
	}
%>
</body>
</html>