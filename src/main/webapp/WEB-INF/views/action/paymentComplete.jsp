<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <%
    if(session.getAttribute("email")==null)
    {
    response.sendRedirect("/");
   }
    %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>  <!--이거지우면 탭기능안됨  -->
<script type="text/javascript">
window.onload = function(){
	  document.forms['commiter'].submit()

	}

</script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 완료</title>
</head>
<body>
<form id="commiter" name = "commiter" action="/action/paymentComplete" method="POST">


</form>
<a href="clicker()" id="button12"></a>
</body>
</html>