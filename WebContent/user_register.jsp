<%@page import="travels.MemberDataAccessObject"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="travels.Member"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>
<%
	
	// System.out.println(request.getParameter("birth") + "/" + member.getBirth());
	// int result = 0;
	// member.setBirth(request.getParameter("birth"));
	// System.out.println(request.getParameter("birth") + "/" + member.getBirth());
	Date birth = Date.valueOf(request.getParameter("birthInput"));
	member.setBirth(birth);
	MemberDataAccessObject md = MemberDataAccessObject.getInstance();
	int result = md.createMember(member, request);
	if(result>0){
		session.setAttribute("user_login_id", member.getId());
		%>
		<script type="text/javascript">
		alert("짝짝! 회원가입을 축하합니다");
		location.href="index.html";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("다시 시도해 주세요");
		history.go(-1);
		</script>
		<%
	}
%>
</body>
</html>