<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
window.onload = function(){
	  document.forms['commiter'].submit()

	}

</script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="commiter" name = "commiter" action="/projectInfo" method="get">
<c:forEach var="projectseq" items="${projectseq}">
			<input type="hidden" name = "seq" value="${projectseq.seq}">
			
		</c:forEach>

</form>
<a href="clicker()" id="button12"></a>
</body>
</html>