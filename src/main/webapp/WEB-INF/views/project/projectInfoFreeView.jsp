<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
   <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<jsp:include page="../main/header.jsp"></jsp:include>  




<title><%=request.getParameter("title") %> </title>


<!--  <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css"> -->
<link href="/resources/css/form5-tabs.css" rel="stylesheet" type="text/css">
<script src="/resources/js/form5-tabs.min.js"></script>  
<link href="/resources/css/projectInfo.css" rel="stylesheet" type="text/css">
<!-- 폰트 -->
<style type="text/css">
.navbar{
width:auto;
}
.infobody{
padding-top: 152px; 
}
#updateList{
width : 580px;
overflow: inherit;
}
#updateList img{width : 580px;} 
.teams img{width:580px;
border-radius: 10px 10px 10px 10px; 
}
.fb-share-button{
float: left;
}
.teams_name{
padding-top: 50px;
padding-bottom: 50px;
}
</style>



<script>



(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.0";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>
<!-- 트위터 -->
<script>
    ! function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0],
            p = /^http:/.test(d.location) ? 'http' : 'https';
        if (!d.getElementById(id)) {
            js = d.createElement(s);
            js.id = id;
            js.src = p + '://platform.twitter.com/widgets.js';
  fjs.parentNode.insertBefore(js, fjs);
        }
    }(document, 'script', 'twitter-wjs');
</script>
  
  <!-- 팝업 -->


<!--탭 자바스크립트  -->
 <script>
  $(function(){
    $('tabs_one').tabs_one();
  });
</script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script> 





<!--타이머 자바스크립트  -->
	<script type="text/javascript" src="/resources/js/jquery.timer.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('#countDown').revolver({
			year : <%=request.getParameter("f_year")%>,	/* <c:out value="${mains.f_year}"></c:out> */
			month : <%=request.getParameter("f_month")%>,	/* <c:out value="${mains.f_month}"></c:out> */
			day : <%=request.getParameter("f_day")%>,		/* <c:out value="${mains.f_day}"></c:out> */
		});
	});
</script>

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();



$(document).ready(function() {
    

op1 = <%=request.getParameter("o_money1")%>
op2 = <%=request.getParameter("o_money2")%>
op3 = <%=request.getParameter("o_money3")%>
op4 = <%=request.getParameter("o_money4")%>
   


if(op1 === 0){
    $("#op1").remove();
    op1="100000000";

}

if(op2 === 0){
    $("#op2").remove();
    op2="200000000";

}

if(op3 === 0){
    $("#op3").remove();
    op3="300000000";

}

if(op4 === 0){
    $("#op4").remove();
    op4="400000000";
}

});

</script>
</head>
<body>

 <jsp:include page="../main/top.jsp"></jsp:include> 
 




<div class="container infobody">
	<div class="row">
	
		<div class="row">
			<div class="col-md-12" style="height: 200px;">
				<div align="center">

					<div style="font-size:1cm;"><b> <%=request.getParameter("title")%> </b> </div>
					
					<div style="padding-top: 60px; "><b><%=request.getParameter("blurb")%> </b>   </div> 

				</div>
			</div>
			<hr>
			<!--왼쪽 DIV  -->
			<div class="col-md-8" style=" height: auto;" >
<tabs_one > 
<tab>
<h2 class="heading">프로젝트 소개</h2>

<div style="width: 580px;">



	
 
	<br>

		<div class="fb-share-button" data-href="http://211.183.2.145/projectInfo?seq=<%= request.getParameter("seq") %>" data-layout="button_count"></div>
       	<div><a href="https://twitter.com/share" class="twitter-share-button">Tweet</a></div>
     	
     	
     	
     	<div><%=request.getParameter("description")%></div>
     	<div>각오 : <%=request.getParameter("risk_and_challenge")%></div>
<p>주소 :  <%=request.getParameter("location_address")%></p>
<p>상세 주소 : <%=request.getParameter("location")%></p>
<p>웹사이트 :  <a href="<%=request.getParameter("web_site")%>" target="_blank"><%=request.getParameter("web_site")%></a></p>
<p>facebook: <a href="<%=request.getParameter("facebook")%>" target="_blank"><%=request.getParameter("facebook")%></a></p>
<div align="center">
<p>혹시나 더 궁금하신 사항은 연락처  <%=request.getParameter("contact_detail_phone")%>
<br>혹은 이메일 <%=request.getParameter("contact_detail_email")%>로 문의주세요! <br> 감사합니다. </p>
</div>

</div>
</tab> 
<tab>
<h2 class="heading">업데이트</h2>
<div align="right" style="width: 580px;" class="update_btn">
<input type="button" style="display:none" id="update_btn" class="b-button js-submit-new-channel" align="center" value="업데이트하기" onclick="go_pop()">
</div>
<br>
<br>     	
     	<div id="updateList"></div>
</tab> 
<tab id="tab_move">
<h2 class="heading">문의사항</h2>
  
		<input type="hidden" value="<%= session.getAttribute("name")%>" name="m_name" id="m_name" /> 
	<%-- <input type="text" name="seq" id="seq" value="<%=request.getParameter("seq")%>"> --%>
		<textarea  class="[ form-field ] ui-textarea js-textarea-for-new-channel"  name="update_comment" id="update_comment" placeholder="댓글을 남겨주세요" rows="3"/></textarea>
		<input type="button" class="b-button js-submit-new-channel comments" id="comments" value="등록하기" onclick="formChk()">
		<br>
		<br>
		<div id="commentList" ></div>
		
		


</tab>
<tab>
<h2 class="heading">팀 소개</h3>

 <div class="teams" align="center"><font size="8"></font><img src="/resources/upload/<%=request.getParameter("profile_photo")%>"></div>
 <div class="teams_name" align="center"><b><font size="6"><%=request.getParameter("team_name")%></font></b></div>
 <div class="teams_des" align="center"><font size="4"><%=request.getParameter("team_Biography")%></font></div>
 
 
</tab>
<tab>
<h2 class="heading">펀딩 상황</h3>

     	  
     	  
<div class="container">
<div class="row">
	<div class="col-md-10 col-md-push-2" style="
    padding-top: 57px;
">

		
		
      <div class="text-size_xs">
       <pre style="width: 489px;" class="[ form-field ] ui-textarea"> 
       <p style="height: 40px;">현재 0원 후원했습니다.</p></pre>
      </div> 
	</div>
	<div class="col-md-2 col-md-pull-10" style="padding-top: 79px;padding-left: 42px;">
		<img alt="Avatar_9_medium" class="b-avatar__pic" src="/resources/images/profile.JPG" />
	</div>
</div>
</div>     	  
     	  
     	  
     	  
     	  
     	  
     	  
     	  
     	  
     	  

</tab> 
</tabs>
			</div>
			
			<!-- 오른쪽 DIV  -->
<div class="col-md-4" style="height: auto;">

	<dt style="font-size:large; ">
	
		목표 <%=request.getParameter("f_goal")%>원 중
		0% 모임
	</dt>
	<dt style="font-size:3em;">
		0원
	</dt>	
	   
	<dt style="font-size:large;">
		남은 시간
	</dt>
		<article id="countDownBox">
			<p><span id="countDown"style="font-size: 3em;" ></span></p>
		</article>
	<dt style="font-size:large;">
	후원자
	</dt>
	
	<dt style="font-size: 3em;">
	0명
	</dt>
	
	<div class="button_money" align="center" style="padding-top: 30px;">
	<a href="#" class="c-pledge_button " id="pledge_button" tabindex="2"><span class="c-pledge_button__label"> 프로젝트 밀어주기 </span>
    <span class="c-pledge_button__help"> 최소금액은 1,000원입니다.</span></a> 
	</div>


	<p class="b-pledge_blurb" align="center">
	선물은<%=request.getParameter("o_year")%>년<%=request.getParameter("o_month")%>월 <%=request.getParameter("o_day")%>일에 배송이 진행됩니다.
	</p>
	
<ul class="i-presents">

<div align="center">
    <li id="op1" class="b-panel b-panel--theme_board b-panel--rounded_yes box b-panel--selectable_yes" data-selectable="true"> 
<div class="b-panel__head" style="width: 342px;">
  <h3 class="b-panel__title">

     <font>  <%=request.getParameter("o_money1")%></font>원 이상 밀어주시는 분께
     
  </h3>
</div><!--.b-panel__head-->
<div class="b-panel__body">
  <p class="ui-present-card__description">
     <%=request.getParameter("o_description1")%>
  </p>
  <div>
    <span class="text-size_xs">
      <span class='text-theme_primary'>
      </span>
     </span>
  </div>
</div><!--.b-panel__body-->

  <div class="b-panel__foot has-pad-horiz-dot25">
      <span class="text-size_2xs">
        지급 예상 시기: 
       <%=request.getParameter("o_year")%>년 <%=request.getParameter("o_month")%>월 
        <%=request.getParameter("o_day")%>일
</span>
  </div>
 
</a>    </li>




<li id="op2" class="b-panel b-panel--theme_board b-panel--rounded_yes box b-panel--selectable_yes" data-selectable="true"> 
<div class="b-panel__head" style="width: 342px;" >
  <h3 class="b-panel__title">

     <font> <%=request.getParameter("o_description2")%></font>원 이상 밀어주시는 분께
     
  </h3>
</div><!--.b-panel__head-->
<div class="b-panel__body">
  <p class="ui-present-card__description">
     <%=request.getParameter("o_description2")%>
  </p>
  <div>
    <span class="text-size_xs">
      <span class='text-theme_primary'>
      </span>
     </span>
  </div>
</div><!--.b-panel__body-->

  <div class="b-panel__foot has-pad-horiz-dot25">
      <span class="text-size_2xs">
        지급 예상 시기: 
       <%=request.getParameter("o_year")%>년 <%=request.getParameter("o_month")%>월 
        <%=request.getParameter("o_day")%>일
</span>
  </div>
 
</a>    </li>



<li id="op3" class="b-panel b-panel--theme_board b-panel--rounded_yes box b-panel--selectable_yes" data-selectable="true"> 
<div class="b-panel__head" style="width: 342px;">
  <h3 class="b-panel__title">

     <font> <%=request.getParameter("o_description3")%> </font>원 이상 밀어주시는 분께
     
  </h3>
</div><!--.b-panel__head-->
<div class="b-panel__body">
  <p class="ui-present-card__description">
     <%=request.getParameter("o_description3")%>
  </p>
  <div>
    <span class="text-size_xs">
      <span class='text-theme_primary'>
      </span>
     </span>
  </div>
</div><!--.b-panel__body-->

  <div class="b-panel__foot has-pad-horiz-dot25">
      <span class="text-size_2xs">
        지급 예상 시기: 
      <%=request.getParameter("o_year")%>년 <%=request.getParameter("o_month")%>월 
       <%=request.getParameter("o_day")%>일
</span>
  </div>
 
</a>    </li>


<li id="op4" class="b-panel b-panel--theme_board b-panel--rounded_yes box b-panel--selectable_yes" data-selectable="true"> 
<div class="b-panel__head" style="width: 342px;">
  <h3 class="b-panel__title">

     <font> <%=request.getParameter("o_description4")%> </font>원 이상 밀어주시는 분께
     <!--  -->
  </h3>
</div><!--.b-panel__head-->
<div class="b-panel__body">
  <p class="ui-present-card__description">
     <%=request.getParameter("o_description4")%>
  </p>
  <div>
    <span class="text-size_xs">
      <span class='text-theme_primary'>
      </span>
     </span>
  </div>
</div><!--.b-panel__body-->

  <div class="b-panel__foot has-pad-horiz-dot25">
      <span class="text-size_2xs">
        지급 예상 시기: 
      <%=request.getParameter("o_year")%>년 <%=request.getParameter("o_month")%>월 
        <%=request.getParameter("o_day")%>일
</span>
  </div>
 
</a>    </li>


</div>
</ul>	
	
</div>
		</div>
	</div>		
</div>




<jsp:include page="../main/footer.jsp"></jsp:include>





</body>
</html>