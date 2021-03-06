<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>결제 완료</title>
<jsp:include page="../main/header.jsp"></jsp:include>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/css/bootstrap.min.css">
 
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/js/bootstrap.min.js"></script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>  <!--이거지우면 탭기능안됨  -->


<style type="text/css">
.main {
	padding: 100px 50px 50px 50px;
	margin: 0 auto;
	font-family: "RixSGo M";
	font-size: 14px;
}

.op1 {
	padding: 30px 10px 10px 10px;
	border-radius: 5px;
	margin-bottom: 10px;
	margin-top: 10px;
	vertical-align: middle;
	font-family: "RixSGo M";
	font-size: 14px;

}


.project_image {

	width: 300px;
	height: auto;
	
}

td {
   	padding: 0px 10px 00px 10px;
	margin: 0px 10px 00px 10px;
}


</style>

</head>
<body>


	<jsp:include page="../main/top.jsp"></jsp:include>

	<div class="main" align="center" style="width: 1000px">

		<div>
			옵션 선택 > 결제 > <font color="red">결제 완료</font> 
		</div>
		
<table style="width: 700px;">

<tr>
<td colspan="3">
		<c:forEach var="selectedproject" items="${mains}">
		<div class="op1" style="background: white">
				축하합니다! [${selectedproject.title}] 프로젝트에	<font color="red">&#8361;${sessionScope.pay_money}</font>원을 후원하셨습니다

</td>
</tr>

<tr>
<td style="width: 325px;">
<a href="/projectInfo?seq=${sessionScope.p_seq }"><img src="/resources/upload/${selectedproject.c_image}" class="project_image"/></a>
			
				
				
</td>
<td>
				
				<%-- ${selectedproject.blurb}<br><br> --%>
				${sessionScope.o_description}(옵션을 우편으로 받으신다면 마이페이지><a href="/account/profile1"><b>프로필 설정</b></a>에서 수령할 주소를 설정해주세요!) 
			<br><br>
			</c:forEach>
			
			
				<c:forEach var="map" items="${projectdata}">
				
					<div class="funded-status">
								&#8361;${map.funded_money}/&#8361;${map.f_goal_money}</br>
								${100*map.funded/map.f_goal}%
							</div>
							<div class="stat">
								<span style="width: ${100*map.funded/map.f_goal}%;"></span>
							</div>
							<div class="funded-people">${map.count}명 후원중<br>
							<input type="button" class="btn btn-danger" id="ourproject" value="나의 후원현황 바로가기" style="float:right" onclick="location.href='/account/ourProjectView'";/>
							
							</div>
					
							

				</c:forEach>
	
			
			
				
</td>
</tr>


</table>				
				
	
</div>
	

	
	<jsp:include page="../main/footer.jsp"></jsp:include>




<!-- ---------------------------------------------------------------------------------------------------------------------------------------------------------- -->


</body>
</html>