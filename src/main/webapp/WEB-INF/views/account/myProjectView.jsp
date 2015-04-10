<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>

    
    <%
    if(session.getAttribute("email")==null)
    {
    response.sendRedirect("/");
   }
    %>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<jsp:include page="../main/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Expires" content="0"/> 
<meta http-equiv="Pragma" content="no-cache"/>

<title>나의 프로젝트 현황</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/css/bootstrap.min.css">
 
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/js/bootstrap.min.js"></script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>  <!--이거지우면 탭기능안됨  -->



<style type="text/css">

#notfinished, #finished{

	width: 1000px;
	padding-bottom: 30px;
	

}

#wrapper{

	width: 1000px;
	margin: 0 auto;
	padding-top: 50px;

}

#projectimage{

	float:left;
	

}

#projectstatus{

	width: 600px;
	text-align: left;
	margin-top: -20px;
	

}

.project_image{

	width: 400px;
	height: 300px;

}

 #projectimage, #noproject, #list{

	padding: 10px;
	margin: 10px;

}

.stat, .finishedstat {

	height: 4px;

}


hr.style-six {
    border: 0;
    height: 0;
    border-top: 1px solid rgba(0, 0, 0, 0.1);
    border-bottom: 1px solid rgba(255, 255, 255, 0.3);
    
}




</style>

<script>
function isEmpty(obj) {
    for(var key in obj) {
        if(obj.hasOwnProperty(key))
            return false;
    }
    return true;
}

<c:forEach var="map" items="${projectview}">

$(document).ready(function() {

	
	if (isEmpty("#notfinished")) {
            $('#notfinished').hide();
            $('#noproject').show();

    }
     
	else {
      	$('#notfinished').show();
        $('#noproject').hide();
	}
	
});


</c:forEach>


</script>

<script>
<c:forEach var="map" items="${projectview}">

$(document).ready(function() {
    $('#${map.p_seq}').click(function() {
    	
    	$('.contributerlist').hide(); 
   	    	
    	$('#${map.p_seq}contributerlist').slideToggle("fast"); 
    	    	
    	/* $('#${map.p_seq}').hide();
    	$('#${map.p_seq}cacellist').show(); */
       
         	
    });
    
    $('#${map.p_seq}cacellist').click(function() {
      	$('#${map.p_seq}contributerlist').fadeToggle("fast");
      	
    	/* $('#${map.p_seq}').show();
    	$('#${map.p_seq}cacellist').hide(); */
	});
    
	
    
});


</c:forEach>
</script> 


<script type="text/javascript">



function sendMessage(m_seq,p_seq) {

	n = m_seq+"_"+p_seq;	
	
		context = $("#send_message"+n).val()
		  m_seq =  $("#send_m_seq").val()
		  p_seq = $("#send_p_seq"+n).val()
		  recipient =  $("#send_recipient"+n).val()
		  
		  var now = new Date();
var reg_date = now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate() + " " + now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds() + " ";
		  
	

    
	
    $.ajax({
        type: "POST",
        url: "/account/sendMessage",
        
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        
        data: {
        	
        	context : context,
        	m_seq : m_seq,
        	p_seq : p_seq,
        	recipient : recipient,
        	reg_date :  reg_date
        },
        dataType: "json"
        

    }).done(function(msg) {
        $('.ajaxLayer').hide();
        if ('Y' == msg.isSuccess) {

           
        	$("#send_message"+n).val("");
        	$("#text"+n).append(msg.context+"<br>"+msg.reg_date+"<br>");



        } else {
            alert('시스템 에러가 발생했습니다.');
        }
    });

}


</script>




</head>
<body>



<jsp:include page="../main/top.jsp"></jsp:include>
<div id="wrapper">
<div id="menu"><h2>나의 프로젝트 현황</h2></div>
<hr>
<div id="main">

<div>진행 중인 프로젝트</div>
<div id="notfinished">


<c:forEach var="map" items="${projectview}">

<!-- 메시지  -->
<c:forEach var="contributer" items="${contributer}">
<div class="modal fade" id="myModal${contributer.m_seq}_${contributer.p_seq}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">${contributer.name}님과의 대화</h4>
      </div>
      <div class="modal-body">
      
 
      
      <c:forEach var="message" items="${message}">
      <c:if test = "${((contributer.p_seq == message.p_seq) && (contributer.m_seq == message.m_seq && sessionScope.seq == message.recipient) || (contributer.m_seq == message.recipient  && sessionScope.seq == message.m_seq))}">
      
      
      <c:choose>
      
     <c:when test = "${(contributer.p_seq == message.p_seq) && (contributer.m_seq == message.m_seq)}">
     <div id="sangdae">
      <b>${contributer.name}님</b><br> ${message.context } <br><font color="#dcdcdc">${message.reg_date }</font><br>  
       </div>    
      </c:when>
     
      

      <c:when test = "${(contributer.p_seq == message.p_seq) && (contributer.m_seq == message.recipient)}">
            <div id="na" style="text-align: right;">
     ${message.context } <br><font color="#dcdcdc">${message.reg_date }</font><br>    
          </div>  
      </c:when>
  
      
      </c:choose>
		
		
      </c:if>
      
      
      		
		

		          
      </c:forEach>
     
	 <div id="text${contributer.m_seq}_${contributer.p_seq}" style="text-align: right;"> </div>	

	<br><br>

           <input type="hidden" id="send_m_seq" name="send_m_seq" value="${sessionScope.seq}" />
      <input type="hidden" id="send_p_seq${contributer.m_seq}_${contributer.p_seq}" name="send_p_seq" value="${contributer.p_seq}" />
      <input type="hidden" id="send_recipient${contributer.m_seq}_${contributer.p_seq}" name="send_recipient" value="${contributer.m_seq}" />
      <input type="hidden" id="reg_date${contributer.m_seq}_${contributer.p_seq}" name="reg_date" value="지금" />
      
      <input type="text" id="send_message${contributer.m_seq}_${contributer.p_seq}" name="send_message" value="" autocomplete="off"" size="55" style="vertical-align:middle; line-height: 30px;" />
      <input type="hidden" value="${contributer.m_seq}_${contributer.p_seq}" id="all">
		<button type="button" class="btn btn-danger" onclick="sendMessage('${contributer.m_seq}','${contributer.p_seq}')" style="float:right;">메시지 보내기</button>
		
		          
		          
     
      </div>
      <div class="modal-footer">
      
      
      </div>
    </div>
  </div>
</div>
</c:forEach>
<!--  -->


    <c:if test="${map.d_day >= '0'}">
   <table>
   <tr>
   <td><div id="projectimage"><a href="/projectInfo?seq=${map.seq}"><img src="/resources/upload/${map.c_image}" class="project_image" onError="this.src='/resources/images/category/dance.jpg'" /></a></div></td>
   <td>
   
   <div id="projectstatus" >
   
    &nbsp;[${map.title}]가 <font color="red">${map.d_day}일</font> 후 종료됩니다 &nbsp;<button type="button" id="${map.p_seq}" class="btn btn-default btn-xs" style="vertical-align:middle;">후원자관리</button><button type="button" id="${map.p_seq}cacellist" class="btn btn-danger btn-xs" style="vertical-align:middle; display:none;">리스트 접기</button>

    					<br><br>
  &nbsp;&nbsp;${map.blurb}<br>
					<div class="funded-status">
					
					<c:choose><c:when test = "${map.funded == null}"><br><br>프로젝트를 아직 아무도 후원하지 않았습니다</c:when>
					
					<c:otherwise>
					
					&#8361;${map.funded_money}/&#8361;${map.f_goal_money}<br>진행률 ${100*map.funded/map.f_goal}%<br>
					
			
						${map.count}명 후원 중
					
						<div class="stat" style="width:580px;">
								<span style="width: ${100*map.funded/map.f_goal}%;"></span>
								
							</div>
										
										
							</c:otherwise>
					</c:choose>			
													
								
							</div>
		
		</div>
   
   
   
   </td>
   </tr>
   </table>

<div id="list">
<div id="${map.p_seq}contributerlist" class="contributerlist" style="display: none;">

<table style="width: 1000px;" class="table table-hover">

<tr>


<td>
후원자
</td>
<td>
이메일
</td>
<td>
후원금액
</td>
<td>
후원날짜
</td>
<td  style="width: 200px;" >
옵션
</td>
<td>
배송주소
</td>
<td>
메시지
</td>

</tr>

<c:forEach var="contributer" items="${contributer}">
 <c:if test="${contributer.p_seq == map.p_seq}">
<tr>



<td>
${contributer.name}

</td>
<td>
${contributer.email}
</td>
<td>
${contributer.pay_money}
</td>
<td>
${contributer.pay_date}
</td>
<td  style="width: 200px;" >



<c:choose>
<c:when test = "${contributer.option_no == '0' }">
옵션을 받지 않고 후원
</c:when>

<c:when test = "${contributer.option_no == '1' }">
${contributer.o_description1}
</c:when>

<c:when test = "${contributer.option_no == '2' }">
${contributer.o_description2}
</c:when>

<c:when test = "${contributer.option_no == '3' }">
${contributer.o_description3}
</c:when>

<c:when test = "${contributer.option_no == '4' }">
${contributer.o_description4}
</c:when>

</c:choose>


</td>
<td>
<c:choose>
<c:when test = "${contributer.option_no == '0' }">

</c:when>
<c:otherwise>
${contributer.addr}<br> ${contributer.addr_detail}
</c:otherwise>
</c:choose>
</td>

<td>
<!-- Button trigger modal -->
<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#myModal${contributer.m_seq}_${contributer.p_seq}">메시지</button>



</td>


</tr>
</c:if>
</c:forEach>
</table>



</div>

</div>

    </c:if>



</c:forEach>

<div id="noproject" align="center">

       진행 중인 프로젝트가 없습니다. 멋진 아이디어가 있다면 프로젝트를 진행해 보세요!<br>
    <a href="/newProject"><b><font color="crimson">프로젝트 만들기</font></b></a>

</div>


</div>



<hr>
<div>종료된 프로젝트</div>
<div id="finished">


<c:forEach var="map" items="${projectview}">


    <c:if test="${map.d_day < '0'}">
   <table>
   <tr>
   <td><div id="projectimage"><a href="/projectInfo?seq=${map.seq}"><img src="/resources/upload/${map.c_image}" class="project_image" onError="this.src='/resources/images/category/dance.jpg'" /></a></div></td>
   <td>
   
   <div id="projectstatus" >
   [${map.title}]가 종료되었습니다 &nbsp;<button type="button" id="${map.p_seq}" class="btn btn-default btn-xs" style="vertical-align:middle;">후원자관리</button><button type="button" id="${map.p_seq}cacellist" class="btn btn-danger btn-xs" style="vertical-align:middle; display:none;">리스트 접기</button> 
   
   <br><br>   ${map.blurb}<br>
					

					
					
					<div class="funded-status">
					
				<c:choose><c:when test = "${map.funded == null}"><br><br>프로젝트를 아무도 후원하지 않았습니다</c:when>
					
					<c:otherwise>
					
					&#8361;${map.funded_money}/&#8361;${map.f_goal_money}<br>진행률 ${100*map.funded/map.f_goal}%<br>
					
			
						${map.count}명이 당신의 프로젝트를 후원했습니다
					
						<div class="finishedstat" style="width:580px;">
								<span style="width: ${100*map.funded/map.f_goal}%;"></span>
								
							</div>
										
										
							</c:otherwise>
					</c:choose>			
													
													
								
							</div>
							
		</div>
   
   
   
   </td>
   </tr>
   </table>
		
	
<div id="list">
<div id="${map.p_seq}contributerlist" class="contributerlist" style="display: none;">
<table style="width: 1000px;" class="table table-hover">

<tr>

<td>

</td>
<td>
후원자
</td>
<td>
이메일
</td>
<td>
후원금액
</td>
<td>
후원날짜
</td>
<td>
옵션
</td>
<td>
배송주소
</td>
<td>
메시지
</td>


</tr>

<c:forEach var="contributer" items="${contributer}">
 <c:if test="${contributer.p_seq == map.p_seq}">
<tr>


<td>
<input type=checkbox />
</td>
<td>
${contributer.name}
</td>
<td>
${contributer.email}
</td>
<td>
${contributer.pay_money}
</td>
<td>
${contributer.pay_date}
</td>
<td>


<c:choose>
<c:when test = "${contributer.option_no == '0' }">
옵션을 받지 않고 후원
</c:when>

<c:when test = "${contributer.option_no == '1' }">
${contributer.o_description1}
</c:when>

<c:when test = "${contributer.option_no == '2' }">
${contributer.o_description2}
</c:when>

<c:when test = "${contributer.option_no == '3' }">
${contributer.o_description3}
</c:when>

<c:when test = "${contributer.option_no == '4' }">
${contributer.o_description4}
</c:when>

</c:choose>


</td>
<td>
<c:choose>
<c:when test = "${contributer.option_no == '0' }">

</c:when>
<c:otherwise>
${contributer.addr}<br> ${contributer.addr_detail}
</c:otherwise>
</c:choose>
</td>

<td>
<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#myModal${contributer.m_seq}_${contributer.p_seq}">메시지</button>
</td>


</tr>
</c:if>
</c:forEach>
</table>


</div>

</div>

    </c:if>



</c:forEach>
</div>



<!--  -->



</div>



</div>



	<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>