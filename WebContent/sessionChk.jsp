<%
	String id = session.getAttribute("id").toString();
	if(id==null || id.equals("")){
		response.sendRedirect("index.html");
		return;
	}
%>