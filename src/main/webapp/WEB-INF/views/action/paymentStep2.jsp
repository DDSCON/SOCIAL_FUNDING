<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	    
    <%
    if(session.getAttribute("email")==null)
    {
    response.sendRedirect("/");
   }
    %>
    
    
    
	<jsp:include page="../main/header.jsp"></jsp:include>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>결제</title>

<script type="text/javascript" src="https://api.paygate.net/ajax/common/OpenPayAPI.js"></script>

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

#creditcard {
	padding: 10px 10px 10px 10px;
	margin: 10px 10px 10px 10px;
	text-align: left;
	border-radius: 5px;
	font-family: "RixSGo M";
	font-size: 14px;
}

#opa_form_title, #opa_form_command{
	font-size: 14px;
	background-color: white;
	display: none;
	font-family: "RixSGo M";

	
}

#opa_form_content{
	
	font-size: 14px;
	background-color: white;
	width: 300px;
	font-family: "RixSGo M";
	
}


#opa_form_content2{
	
	background-color: white;
	border: 1px solid black;
	font-family: "RixSGo M";
	font-size: 14px;

}

.pay{
	
	width:1000px;
	display:block;
}

.choose{
	padding: 10px 10px 10px 10px;
	margin: 10px 10px 10px 10px;
	border-radius: 5px;
	border: 1px solid black;
	margin-bottom: 10px;
	vertical-align: middle;
	line-height: 50px;

}

td {
   	padding: 0px 10px 00px 10px;
	margin: 0px 10px 00px 10px;
		font-family: "RixSGo M";
	font-size: 14px;
}



.project_image {

	width: 300px;
	height: auto;
	
}
#creditcardpay{
float: right;
}


.card {
    
 width : 200px;
 height : 30px;
 
 border: 1px solid  #CCCDCF ;
 border-radius:5px 5px ;
 
 	font-family: "RixSGo M";
	font-size: 14px;
}

.funded-status{

}
.carddate {
    
 width : 60px;
 height : 30px;
 
 border: 1px solid  #CCCDCF ;
 border-radius:5px 5px ;
 
  	font-family: "RixSGo M";
	font-size: 14px;
	
}


.card, .carddate:FOCUS {
 border: 1px solid #06Bfbf ;
}
 
 

</style>

<script type="text/javascript">
function startPayment() {
 doTransaction(document.PGIOForm);
}
</script> 




<script type="text/javascript">

function getPGIOresult() {
		var replycode = document.PGIOForm.elements['replycode'].value;
		var replyMsg = document.PGIOForm.elements['replyMsg'].value;
		displayStatus(getPGIOElement('ResultScreen'));

		verifyReceived(getPGIOElement('tid'), 'callbacksuccess', 'callbackfail');
	}
	function callbacksuccess() {
		if (replycode == '0000') {
			// 거래성공 경우 for transaction
			
			document.PGIOForm.action = '/action/paymentStep3';
			document.PGIOForm.submit();
		} else {
			// 거래실패 경우 for transaction

			document.PGIOForm.action = '/action/paymentStep3';
			document.PGIOForm.submit();
		}
	}
	function callbackfail() {
	
		// paygate system error
	}
	
	
	
</script>

<script>
$(document).ready(function() {
    $('#creditcardpay').click(function() {
            $('#creditcard').slideToggle("fast");
         	//$('#paychoose').fadeToggle("fast"); 
    });
    
    $('#cancel').click(function() {
      	//$('#paychoose').slideToggle("fast"); 
        $('#creditcard').fadeToggle("fast");
	});
});
</script>

<script>
function check() {
	 var cardtype = document.getElementById ("cardtype");
	 var cardnumber = $.trim($("#cardnumber").val());
	 var cardexpiremonth = $.trim($("#cardexpiremonth").val());
	 var cardexpireyear = $.trim($("#cardexpireyear").val());
	 
	 if(!cardtype.options[0].selected && cardnumber.length>0 && cardexpiremonth.length>0 && cardexpireyear.length>0) {
	
		 $('#checkform').fadeToggle("fast");
		 startPayment();
		
		
	   } else {

	     $("#checkform").html("<font color=red>&nbsp; &nbsp;결제 정보를 빠짐없이 입력하세요</font>");
	  }
	}
</script>


<script>

 function S_text_copy(z) 
{ 
	 if(z.options[z.selectedIndex].value) {  
    tmp1 = z.options[z.selectedIndex].text; 
    tmp2= z.options[z.selectedIndex].value;
    
    document.getElementById("card_company").value= tmp1;
    document.getElementById("card_company_code").value= tmp2;
    } 
}; 

</script>

</head>
<body> 

	<jsp:include page="../main/top.jsp"></jsp:include>

	<div class="main" align="center" style="width: 800px">

		<div>
			옵션 선택 > <font color="red">결제</font> > 결제 완료
		</div>
		
<table style="width: 700px;">

<tr>
<td colspan="3">
<c:forEach var="selectedproject" items="${mains}">
				<div class="op1" style="background: white">
				[${selectedproject.title}] 프로젝트에 <font color=red>&#8361;<%=request.getParameter("money")%></font>원을
					후원하시게 됩니다.
</td>
</tr>

<tr>
<td style="width: 325px;">
<a href="/projectInfo?seq=<%=request.getParameter("seq") %>"><img src="/resources/upload/${selectedproject.c_image}" class="project_image"/></a>

				
</td>
<td>
				

<%--  ${selectedproject.blurb}
 <br><br> --%>
<%=request.getParameter("o_description")%>
<br><br>
	<c:forEach var="map" items="${projectdata}">

					
					
					<c:choose><c:when test = "${map.funded == null}">
					
					아직 아무도 후원하지 않았습니다.<br>
					프로젝트의 첫번째 후원자가 되어주세요!
						<br><br>
					
					</c:when>
					<c:otherwise>
					
					
					<div class="funded-status">
								&#8361;${map.funded_money}/&#8361;${map.f_goal_money}</br>
								${100*map.funded/map.f_goal}%
								
										<div class="stat">
								<span style="width: ${100*map.funded/map.f_goal}%;"></span>
								
							</div>
							
							</div>
					
							<div class="funded-people">${map.count}명 후원중</div>
					
					</c:otherwise>
					</c:choose>
					
						
						
							
							
				
				
				
				</c:forEach>
		
</c:forEach>				
				
				

<c:forEach var="selectedproject" items="${mains}">				
<div id="paychoose">

    <input class="btn btn-default" type="button" value="체크/신용카드 결제" id="creditcardpay">
    <form method="POST" action="https://www.sandbox.paypal.com/cgi-bin/webscr" style="width: 100px; float: right;">
<input type=hidden name="cmd" value="_xclick" size="50" />
<input type=hidden name="business" value="ganjangsauce-facilitator@gmail.com" size="50" />
<input type=hidden name="amount" value="<%= Float.parseFloat(request.getParameter("money"))/1000 %>" size="50" />
<input type=hidden name="item_name" value="[${selectedproject.title}] 프로젝트 후원" size="50" />
<c:forEach var="payment" items="${payinfo}">
<input type=hidden name="return" value="http://211.183.2.145/action/paymentStep3" size="50" />
<input type=hidden name="notify_url" value="http://211.183.2.145/action/paymentStep3" size="50" />
<input type="hidden" name="rm" value="2">
</c:forEach>
<input type=hidden name="cancel_return" value="http://211.183.2.145/action/paymentStep1?seq=<%=request.getParameter("seq") %>" size="50" />
<input type=hidden name="charset" value="UTF-8" size="50" />
<input type=hidden name="currency_type" value="USD" size="50" />				
<input class="btn btn-default" type="button" value="페이팔 결제" onclick="submit();">
</form>
</div>	

</td>
</tr>


</table>				
				

<div id="creditcard" style="background: white; display:none; width:600px;">
<form name="PGIOForm" method="POST" align="left">

<input type=hidden size="10" name="mid" value="domestic"/>
<input type=hidden name="langcode" value="KR">
<input type=hidden size=8 name="charset" value="UTF-8"/>
<input type=hidden name=paymethod value="100">
<input type=hidden size=10 name="unitprice" value="<%=request.getParameter("money")%>"/>
<input type=hidden size=10 name=goodcurrency value="WON" >
<input type=hidden size="26" name="goodname" value="[${selectedproject.title}] 프로젝트 후원"/>
<input type=hidden size="26" name="receipttoname" value="Funday"/>
<input type=hidden size="26" name="receipttoemail" value="dev@paygate.net"/>
<input type=hidden size="26" name="tid" value=""/>
<input type=hidden size="26"  name="replycode" value=""/>
<input type=hidden size="26" name="replyMsg" value=""/>

</c:forEach>



&nbsp; &nbsp;<label>카드사&nbsp; &nbsp;&nbsp;&nbsp;</label><select name="cardtype" id="cardtype" class="card" onkeypress="return enter2next(event, 'detectPayMethod_getBASICCardType2()')"  onchange="S_text_copy(this)" >

<option value="310">비씨(BC)카드</option>
<option value="310">MG새마을체크카드</option>
<option value="310">우체국(BC)카드</option>
<option value="310">KDB산업은행카드</option>
<option value="310">상호저축은행</option>
<option value="310">현대증권</option>
<option value="410">신한(LG)카드</option>
<option value="510">삼성카드</option>
<option value="610">현대카드</option>
<option value="110">국민(KB)카드</option>
<option value="710">롯데카드</option>
<option value="210">하나카드(구,외환)</option>
<option value="912">농협(NH)카드</option>
<option value="923">씨티카드</option>
<option value="916">하나카드(구,하나SK)</option>
<option value="913">우리카드</option>
<option value="918">광주카드</option>
<option value="920">전북카드</option>
<option value="925">수협카드</option>
<option value="610">신협(현대)카드</option>
<option value="921">제주카드</option>
<option value="511">삼성올앳카드</option>
<option id="cardcompanycode" name="cardcompanycode"   value="<c:forEach var="getpayinfo" items="${payinfo}">${getpayinfo.card_company_code}</c:forEach>" selected="selected"><c:forEach var="getpayinfo" items="${payinfo}">${getpayinfo.card_company}</c:forEach></option>
</select>






&nbsp; &nbsp;&nbsp; &nbsp;<label>만기(월[ex_07])&nbsp; &nbsp;&nbsp;&nbsp;</label><input name="cardexpiremonth" class="carddate" id="cardexpiremonth" value="<c:forEach var="getpayinfo" items="${payinfo}">${getpayinfo.card_expire_month}</c:forEach>" size="2" />
 

<br><br>
&nbsp; &nbsp;<label>카드번호&nbsp; &nbsp;</label><input name="cardnumber"  id="cardnumber" class="card" value="<c:forEach var="getpayinfo" items="${payinfo}">${getpayinfo.card_number}</c:forEach>" size="16"/>
&nbsp; &nbsp;&nbsp; &nbsp;<label>만기(년[ex_2015])&nbsp; &nbsp;</label><input name="cardexpireyear" class="carddate" id="cardexpireyear" value="<c:forEach var="getpayinfo" items="${payinfo}">${getpayinfo.card_expire_year}</c:forEach>" size="4" />

<c:forEach var="getpayinfo" items="${payinfo}">
			<input type="hidden" id="card_company" name="card_company" value="${getpayinfo.card_company}" />
			<input type="hidden" id="card_company_code" name="card_company_code" value="${getpayinfo.card_company_code}" />
</c:forEach>
	
		

<input type="hidden" name="seq" value="<%=request.getParameter("seq") %>" />
<input type="hidden" name="m_seq" value="${seq}"/>
<input type="hidden" name="p_seq" value="<%=request.getParameter("seq") %>" />

			
</form>
 

 
 
 
<div id="checkform"> </div>

<div id="PGIOscreen" style="width: 300px;   float: left;"></div>

<div align="right" >
<input type="button" class="btn btn-danger" id="payclick" value="결제" onclick='check()' />
<input type="button" class="btn btn-default" id="cancel" value="취소" />
</div>



</div>


	

		<input type="hidden" name="seq" value="<%=request.getParameter("seq") %>" />

			<input type="hidden" name="m_seq" value="${seq}"/>
			<%-- <input type="text" name="email" value="${email}" /> --%>
			<input type="hidden" name="p_seq" value="<%=request.getParameter("seq") %>" />
			<input type="hidden" name="option_no" value="<%=request.getParameter("option_no") %>" />
			<input type="hidden" name="o_description" value="<%=request.getParameter("o_description") %>" />
			<input type="hidden" name="pay_money" value="<%=request.getParameter("money")%>" />
			
			
			<c:forEach var="getpayinfo" items="${payinfo}">
			<input type="hidden" id="card_company" name="card_company" value="${getpayinfo.card_company}" />
			<input type="hidden" id="card_company_code" name="card_company_code" value="${getpayinfo.card_company_code}" />
			<input type="hidden" name="card_num" value="${getpayinfo.card_number}" /> 
			<input type="hidden" name="cardexpiremonth" value="${getpayinfo.card_expire_month}" />
			<input type="hidden" name="cardexpireyear" value="${getpayinfo.card_expire_year}" />
			</c:forEach>
			
			
		
		<% session.setAttribute("m_seq", session.getAttribute("seq") ); %>
		<% session.setAttribute("p_seq", request.getParameter("seq") ); %>
		<% session.setAttribute("option_no", request.getParameter("option_no") ); %>
		<% session.setAttribute("pay_money", request.getParameter("money") ); %>
		<% session.setAttribute("o_description", request.getParameter("o_description") ); %> 




	
	
</div>
	

	
	<jsp:include page="../main/footer.jsp"></jsp:include>

</body>
</html>