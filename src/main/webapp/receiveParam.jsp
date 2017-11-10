<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- ******ipin인증 서버에서 인증확인키(ipin_id) 받아오기 위한 임시페이지******* -->


<%
String ipin_id = request.getParameter("ipin_id");
%>
</head>
<body>


<form name="form1" method="post" >
			<input type="hidden" name="ipin_id" value="<%=ipin_id %>"/>
	</form>

<script>
	
	window.document.form1.target = "openWindow";
	window.document.form1.action="/gov/sendReqToGov.do";
	window.document.form1.submit();
	self.close();
	
</script>
</body>
</html>