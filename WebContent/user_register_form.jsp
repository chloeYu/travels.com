<%@ page import="travels.MemberDataAccessObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function idChk(){
	var id = document.getElementById("id");
	if(id.value==null || id.value==""){
		alert("아이디를 입력하세요");
		id.focus();
		return false;
	}
	
	window.open("idChk.jsp?id="+id.value, "", "width=300 height=300");
}
</script>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
<div class="container">
	<div class="sign-up">
		<div class="signup-image">
			<img src="images/user_register_image1.jpg">
		</div>
		<div class="signup-box" >
			<form id="createaccount" name="createaccount" action="user_register.jsp" method="post">
				<div class="form-element">

					<label for="lastname">이름</label> 
					<input id="lastname" value="" name="lastname" type="text" placeholder="성" required="required"> 
					<input id="firstname" value="" name="firstname" type="text" placeholder="이름" required="required">

					<label for="id">사용자 이름</label>
					<input id="id" name="id" value="" type="text" required="required">
					<input type="button" value="중복확인" onclick="idChk()">
					
					<label for="password">비밀번호</label> 
					<input id="password" name="password" type="password" required="required">
					
					<label for="password-check">비밀번호 확인</label> 
					<input id="password-check" name="password-check" type="password" required="required">
					
					<label for="birth">생년월일</label> 
					<input id="birth" name="birthInput" type="date" required="required" placeholder="yyyy-mm-dd">
					
					<label for="gender">성별</label> 
					<select id="gender" name="gender">
					<option value="male">남성
					<option value="female">여성
					<option value="etc">기타
					<option value="hidden">공개안함
					</select>
					
					<label for="tel">휴대전화</label> 
					<input id="tel" name="tel" type="tel">
					
					<label for="email">이메일 주소</label> 
					<input id="email" name="email" type="email">
				</div>
				<input type="submit" value="회원가입">
			</form>
		</div>
	</div>
</div>
</body>
</html>