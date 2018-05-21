<%@ page import="travels.MemberDataAccessObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		String id = request.getParameter("id");
	%>
	<script type="text/javascript"></script>
	<%
		MemberDataAccessObject md = MemberDataAccessObject.getInstance();
		int result = md.idChk(id);
		if (result == 0) { // 사용할 수 있는 아이디
			%>
				<h2>사용할 수 있는 ID입니다</h2><p>
				<input type="button" value="닫기" onclick="opener.createaccount.id.value='<%=id %>'; window.close()">
				<%
			}else{ // 이미 사용중인 아이디
				%>
				<h2>이미 사용중인 ID입니다</h2>
				<form>
				<input type="text" name="id" required="required" autofocus="autofocus">
				<input type="submit" value="확인">
				</form>
				<%
			}
	%>
</body>
</html>