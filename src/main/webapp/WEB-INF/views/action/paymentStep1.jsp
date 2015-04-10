<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<%-- <%
	response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
   	response.addHeader("Pragma", "no-cache"); 
   	response.addDateHeader ("Expires", 0);
%>
 --%>

<jsp:include page="../main/header.jsp"></jsp:include>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>옵션 선택</title>
<link href="/resources/css/footer.css" media="screen" rel="stylesheet" type="text/css" />

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/css/bootstrap.min.css">
 
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/js/bootstrap.min.js"></script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>  <!--이거지우면 탭기능안됨  -->

<style type="text/css">
.main {
	padding: 50px 50px 50px 50px;
	font-family: "RixSGo M";
	font-size: 14px;
		
}

.op0, .op1, .op2, .op3, .op4 {
	padding: 10px 10px 10px 10px;
	border-radius: 5px;
	margin-bottom: 10px;
	vertical-align: middle;
	
	opacity: 0.3;
	

}

#submit{

font-family: "RixSGo M";
	font-size: 14px;
}

.op0{
	padding: 10px 10px 10px 10px;
	border-radius: 5px;
	margin-bottom: 10px;
	vertical-align: middle;
	line-height: 50px;
	opacity: 1;
}

.op, .pay {
	vertical-align: middle;
	line-height: 20px;
	padding: 10px 10px 10px 10px;
}

.money {
    
 width : 200px;
 height : 30px;
 
 
 font-weight: bold;
 border: 2px solid  #CCCDCF ;
 border-radius:5px 5px ;
}

.money:FOCUS {
 
 
 border: 2px solid crimson ;
}

td {
   	padding: 10px 10px 10px 10px;
	margin: 10px 10px 10px 10px;
		font-family: "RixSGo M";
	font-size: 14px;
}


</style>

<script type="text/javascript">
	function logincheck(){
	
		if($("#money").val()*1>=1000 && $("#money").val()!="" && ${not empty sessionScope.email} ) {
			document.getElementsByName("submit")[0].type = "submit";
			
			
	
		} 
		
		else if(${empty sessionScope.email} ){
	
			document.getElementsByName("submit")[0].type = "button";
			$('#loginButton').trigger('click');
			$(".op").html("<font color=red>로그인을 하셔야 합니다</font>");
			}
		
		
		else if($("#money").val()!="" && ${empty sessionScope.email} ){
			
			document.getElementsByName("submit")[0].type = "button";
			$('#loginButton').trigger('click');
			$(".op").html("<font color=red>로그인을 하셔야 합니다</font>");
			}
		
		else if(${not empty sessionScope.email} && $("#money").val()==""){
			
	
			document.getElementsByName("submit")[0].type = "button";
			$(".op").html("<font color=red>금액을 입력하세요</font>");
			}
		
		

					
		}; 
	
</script>


	

<script type="text/javascript">

$(document).ready(function() {
	
<c:forEach var="project_option" items="${poption}">
op1 = ${project_option.o_money1};
op2 = ${project_option.o_money2};
op3 = ${project_option.o_money3};
op4 = ${project_option.o_money4};
</c:forEach>	


if(op1 === 0){
	$(".op1").remove();
	op1="100000000";
	

}

if(op2 === 0){
	$(".op2").remove();
	op2="200000000";
	

}

if(op3 === 0){
	$(".op3").remove();
	op3="300000000";

}

if(op4 === 0){
	$(".op4").remove();
	op4="400000000";
}

});

</script>


<c:forEach var="project_option" items="${poption}">

 <script>
 $(document).ready(function() {
	 
	var no_option = document.getElementById('no_option');
	
	$('#no_option').click(function() {
	
		if(no_option.checked == true){
				
             $('.op0').show();
             $('.options').hide();
             
             document.getElementById('o_money').value="${project_option.o_money0}";
				document.getElementById('o_description').value="${project_option.o_description0}";
				document.getElementById('option_no').value="0";

     } else {
     
         	$('.op0').hide();
         	$('.options').show();
         	
         	
   
     }
 	});
 });

</script>


<script type="text/javascript">


	$(document).ready(function() {

		$("#money").focus();
		$("#money").keyup(function() {
			
			no_option = document.getElementById('no_option');
			$(".op1").css("border", "0px solid black").css("opacity", "0.3");
			$(".op2").css("border", "0px solid black").css("opacity", "0.3");
			$(".op3").css("border", "0px solid black").css("opacity", "0.3");
			$(".op4").css("border", "0px solid black").css("opacity", "0.3");
			
			
			if ($("#money").val()*1 >=  op1   && $("#money").val()*1 <  op2 && $('#no_option').prop('checked', false)) {
				$(".op1").css("border", "0px solid black").css("opacity", "1");
				$(".op").html("");
				document.getElementsByName("submit")[0].type = "submit";
				
				document.getElementById('o_money').value="${project_option.o_money1}";
				document.getElementById('o_description').value="${project_option.o_description1}";
				document.getElementById('option_no').value="1";
				
				 $(".op0").hide();
	             $(".options").show();
	             
	             
			
				
			}
			
			else if ($("#money").val()*1 >=  op2   && $("#money").val()*1 <  op3 && $('#no_option').prop('checked', false)) {
				$(".op2").css("border", "0px solid black").css("opacity", "1");
				$(".op").html("");
				document.getElementsByName("submit")[0].type = "submit";
	
	
				document.getElementById('o_money').value="${project_option.o_money2}";
				document.getElementById('o_description').value="${project_option.o_description2}";
				document.getElementById('option_no').value="2";
				
				 $(".op0").hide();
	             $(".options").show();
	             

			}

			else if ($("#money").val()*1 >=  op3  && $("#money").val()*1 <  op4 && $('#no_option').prop('checked', false)) {
				$(".op3").css("border", "0px solid black").css("opacity", "1");
				$(".op").html("");
				document.getElementsByName("submit")[0].type = "submit";
				
	
				document.getElementById('o_money').value="${project_option.o_money3}";
				document.getElementById('o_description').value="${project_option.o_description3}";
				document.getElementById('option_no').value="3";
			
				
				 $(".op0").hide();
	             $(".options").show();
	             
			
			}

			else if ($("#money").val()*1 >=  op4 && $('#no_option').prop('checked', false)) {
				$(".op4").css("border", "0px solid black").css("opacity", "1");
				$(".op").html("");
				document.getElementsByName("submit")[0].type = "submit";
				
		
				document.getElementById('o_money').value="${project_option.o_money4}";
				document.getElementById('o_description').value="${project_option.o_description4}";
				document.getElementById('option_no').value="4";
				
				 $(".op0").hide();
	             $(".options").show();
	            
			
			}
			
			
			else if ($("#money").val()=="") {
				$(".op").html("<font color=red>1,000</font>원 이상 금액을 입력하세요");
				document.getElementsByName("submit")[0].type = "button";
			}

			
			else if ($("#money").val()*1 < 1000) {
				$(".op").html("<font color=red>1,000</font>원 이상 금액을 입력하세요");
				document.getElementsByName("submit")[0].type = "button";
			}
			
			
			else if ($("#money").val()*1 < "${project_option.o_money1}" && $("#money").val()*1 >= 1000) {
				
				$(".op").html("옵션을 받으시려면 <font color=red>${project_option.o_money_one}</font>원 이상 금액을 입력하세요");
						
			
				$('#no_option').prop('checked', true);
			   	 $(".op0").show();
	             $(".options").hide();
	           
					document.getElementById('o_money').value="${project_option.o_money0}";
					document.getElementById('o_description').value="${project_option.o_description0}";
					document.getElementById('option_no').value="0";
          
			}
			
			else if ($("#money").val()*1 >= "${project_option.o_money1}" && $('#no_option').prop('checked', true)) {
			
			  	 $(".op0").show();
	             $(".options").hide();
	             
	             document.getElementById('o_money').value="${project_option.o_money0}";
					document.getElementById('o_description').value="${project_option.o_description0}";
					document.getElementById('option_no').value="0";
			}
			
				

		});

	});
		
	

</script>
</c:forEach>




<script language="javascript"> /* 엔터입력 안되게 */

function captureReturnKey(e) { 
    if(e.keyCode==13 && e.srcElement.type != 'textarea') 
    return false; 
} 
</script> 



</head>
<body>
	<jsp:include page="../main/top.jsp"></jsp:include>

	<div class="main" align="center" width="800px">

		<div class="pay"><br><br>
			<font color="red">옵션 선택</font> > 결제 > 결제 완료
		</div>

		<div>
<br><br>
			<form action="/action/paymentStep2" method="POST" onkeydown="return captureReturnKey(event)">
				<label>후원할 금액을 입력해주세요 </label> <input type="number" name="money" class="money" id="money" autocomplete="off">원
				<br><input type="checkbox" id="no_option" name="no_option" autocomplete="off"/>옵션 받지 않고 후원하기

				<br><br>
				<div class="op" style="width: 400px; height: 20px;" name="op"></div>
				<br>

				<div class="op0"
					style="width: 600px; height: 70px; background: #f9f9f7; display:none;" name="op0" >
					
						<c:forEach var="project_option" items="${poption}">
				옵션을 받지 않고 1,000원 이상 금액을 후원 
				</c:forEach>
					</div>
					
				<div class="options">	

				<div class="op1"
					style="width: 600px; background: #f9f9f7;" name="op1">
			
					<c:forEach var="project_option" items="${poption}">
					<table style="width: 600px;"><tr><td style="border-right: 1px solid; width: 150px;" >${project_option.o_money_one}원 이상</td><td>${project_option.o_description1} </td></tr></table>
				
				</c:forEach>
				</div>

				<div class="op2"
					style="width: 600px; background: #f9f9f7;" name="op2">
				
					<c:forEach var="project_option" items="${poption}">
				<table style="width: 600px;"><tr><td style="border-right: 1px solid; width: 150px;">${project_option.o_money_two}원 이상</td><td>${project_option.o_description2} </td></tr></table>
				</c:forEach>

				</div>	

				<div class="op3"
					style="width: 600px; background: #f9f9f7;" name="op3">
				
					<c:forEach var="project_option" items="${poption}">
				<table style="width: 600px;"><tr><td style="border-right: 1px solid; width: 150px;" >${project_option.o_money_three}원 이상</td><td>${project_option.o_description3} </td></tr></table>
				</c:forEach>

				</div>


				<div class="op4"
					style="width: 600px; background: #f9f9f7;" name="op4">
					<c:forEach var="project_option" items="${poption}">
					<table style="width: 600px;"><tr><td style="border-right: 1px solid; width: 150px;" >${project_option.o_money_four}원 이상</td><td>${project_option.o_description4} </td></tr></table>
					</c:forEach>
					</div>

				</div>

				<input type="hidden" name="email" value="${email}" /> 
				<input	type="hidden" name="seq" value="<%=request.getParameter("seq")%>" />
				<input	type="hidden" name="p_seq" value="<%=request.getParameter("seq")%>" />
				<% session.setAttribute("p_seq", request.getParameter("seq") ); %>
				<% session.getAttribute("seq"); %>
				<input type="hidden" id="o_money" name="o_money" value="" /> 
				<input type="hidden" id="o_description" name="o_description" value="" />
				<input type="hidden" id="option_no" name="option_no" value="" /> 
				
				<input type="button" id="submit" name="submit" class="btn btn-default" value="다음"	onclick="logincheck()" >
			</form>
		</div>

	</div>



	<jsp:include page="../main/footer.jsp"></jsp:include>

</body>
</html>