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
<jsp:include page="../main/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/css/bootstrap.min.css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/js/bootstrap.min.js"></script>
<link href="/resources/css/index1.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="../resources/css/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="../resources/owl-carousel/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="../resources/owl-carousel/owl.theme.css">
<link rel="stylesheet" type="text/css"
	href="../resources/owl-carousel/owl.transitions.css">
<script type="text/javascript"
	src="../resources/owl-carousel/owl.carousel.js"></script>
<script src="http://code.jquery.com/ui/1.11.3/jquery-ui.js"></script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>  <!--이거지우면 탭기능안됨  -->


<script>
	<c:forEach var="map" items="${ourProjectView1}">
	$(function() {
		// run the currently selected effect
		function runEffect() {
			// most effect types need no options passed by default
			var options = {};
			// run the effect
			$("#toggled-${map.seq}").toggle("puff", options, 500);
		}
		;
		// set effect from select menu value
		$(".toggles-${map.seq}").click(function() {
			runEffect();
		});
	});
	</c:forEach>
	<c:forEach var="map" items="${ourProjectView2}">
	$(function() {
		// run the currently selected effect
		function runEffect() {
			// most effect types need no options passed by default
			var options = {};
			// run the effect
			$(".toggled-${map.seq}").toggle("puff", options, 50);
		}
		;
		// set effect from select menu value
		$(".toggles-${map.seq}").click(function() {
			runEffect();
		});
	});
	</c:forEach>

	$(document).ready(function() {

		$("#owl-demo-1").owlCarousel({
			items : 4,
			lazyLoad : true,
			navigation : true
		});

		$("#owl-demo-2").owlCarousel({
			items : 4,
			lazyLoad : true,
			navigation : true
		});

	});
</script>
<style>
.op_view {
	display: none;
	width: 100%;
	margin: 0px auto;
	position: absolute;
	background-color: #ffffff;
	z-index: 1000;
}

.op_view div {
	position: relative;
	max-width: 1020px;
}

.page_title {

	padding-top: 50px;
	max-width: 1170px;
	margin: 0 auto;
}

.title {
	padding-top: 50px;
}

.our-project-detail {
	text-align: center;
	margin:5px;
}
.our-project-detail  tbody{
	float: left;
}

#owl-demo-1 .item {
	margin: 5px;
}

#owl-demo-2 .item {
	margin: 5px;
}

.item img {
	display: block;
	height: 100%;
}

tr {
	overflow: scroll;
}

hr.style-six {
    border: 0;
    height: 0;
    border-top: 1px solid rgba(0, 0, 0, 0.1);
    border-bottom: 1px solid rgba(255, 255, 255, 0.3);
    
}



</style>


<script type="text/javascript">



function sendMessage(m_p_seq,p_seq) {

	n = m_p_seq+"_"+p_seq;	
	
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

<!-- Modal -->
<c:forEach var="order" items="${ourProjectView}">
<div class="modal fade" id="myModal${order.m_p_seq}_${order.p_seq}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title">${order.name}님과의 대화</h4>
      </div>
      <div class="modal-body">
           
      <c:forEach var="message" items="${message}">
      <c:if test = "${((order.p_seq == message.p_seq) && (order.m_p_seq == message.m_seq && sessionScope.seq == message.recipient) || (order.m_p_seq == message.recipient  && sessionScope.seq == message.m_seq))}">
      
      <c:choose>
     
   <c:when test = "${(order.p_seq == message.p_seq) && (order.m_p_seq == message.m_seq)}">
     <div id="sangdae">
      <b>${order.name}님</b><br> ${message.context } <br><font color="#dcdcdc">${message.reg_date }</font><br>  
       </div>    
      </c:when>
     
      

      <c:when test = "${(order.p_seq == message.p_seq) && (order.m_p_seq == message.recipient)}">
            <div id="na" style="text-align: right;">
     ${message.context } <br><font color="#dcdcdc">${message.reg_date }</font><br>    
          </div>  
      </c:when>
      </c:choose>
		
		
      </c:if>
      
      </c:forEach>
      
      
     <div id="text${order.m_p_seq}_${order.p_seq}" style="text-align: right;"> </div>	

	<br><br>

           <input type="hidden" id="send_m_seq" name="send_m_seq" value="${sessionScope.seq}" />
      <input type="hidden" id="send_p_seq${order.m_p_seq}_${order.p_seq}" name="send_p_seq" value="${order.p_seq}" />
      <input type="hidden" id="send_recipient${order.m_p_seq}_${order.p_seq}" name="send_recipient" value="${order.m_p_seq}" />
        <input type="hidden" id="reg_date${order.m_p_seq}_${order.p_seq}" name="reg_date" value="지금" />
      
      <input type="text" id="send_message${order.m_p_seq}_${order.p_seq}" name="send_message" value="" autocomplete="off"" size="55" style="vertical-align:middle; line-height: 30px;" />
      <input type="hidden" value="${order.m_p_seq}_${order.p_seq}" id="all">
		<button type="button" class="btn btn-danger" onclick="sendMessage('${order.m_p_seq}','${order.p_seq}')" style="float:right;">메시지 보내기</button>
		
		
		
      </div>
      <div class="modal-footer">



      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</c:forEach>

	<div class="title">
		<h2 class="page_title">나의 후원현황<hr></h2>
		
	</div>

	<div class="container">
	
		<div class="row">
			<h2>후원중 프로젝트</h2>

			<c:forEach var="map" items="${ourProjectView1}">
				<div class="op_view" id="toggled-${map.seq}">

					<table class="our-project-detail">
					<tbody>
						<tr>
							<td>
								<div class="project_box">
									<a class="item-list-link" href="/projectInfo?seq=${map.seq}">
										<div class="thumbnail main_project_box">
											<div class="mina_project_box_c">
												<img src="/resources/upload/${map.c_image}" alt="">
											</div>
											<div>
												<div class="caption">
													<h3>${map.title}</h3>
													<p>${map.blurb}</p>

												</div>
												<div class="percent_box">
													<c:forEach var="map1" items="${allProjectCard}">
														<c:if test="${map.seq == map1.p_seq}">
															<div class="funded-status">
																&#8361;${map1.funded}/&#8361;${map1.f_goal}</br>
																${map1.current_rate}%
															</div>
															<div class="stat">
																<span style="width: ${map1.current_rate}%;"></span>
															</div>
															<div class="funded-people">
																<span> <c:choose>
																		<c:when test="${map1.d_day < '0'}">
																		종료된 프로젝트
																	</c:when>
																		<c:otherwise>
																		${map1.d_day} 일 남음
																	</c:otherwise>
																	</c:choose>
																</span> ${map1.count}명 후원중
															</div>
														</c:if>
													</c:forEach>
												</div>
											</div>
										</div>
									</a>
								</div>
							</td>
							<td>
								<div>
									<table>
									<tbody>
										<tr>
											<td>후원일자</td>
											<td>옵션번호</td>
											<td>후원금액</td>
											
											<td>메시지</td>
										</tr>
										<c:forEach var="order" items="${ourProjectView}">

											<c:if test="${map.seq == order.p_seq}">
												<tr>
													<td>${order.pay_date}</td>
													<td>${order.option_no}</td>
													<td>${order.pay_money}</td>
												
													<td>
																				
													<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#myModal${order.m_p_seq}_${order.p_seq}">메시지</button>
													
													
													
													</td>
													
							
												</tr>
											</c:if>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</td>
							<td>
								<p class="toggles-${map.seq}">닫기</p>
							</td>
						</tr>
					</tbody>
					</table>

				</div>
			</c:forEach>
			<div id="owl-demo-1" class="owl-carousel">
				<c:forEach var="map" items="${ourProjectView1}">
					<div class="project_box item">

						<a class="item-list-link toggles-${map.seq} lazyOwl">
							<div class="thumbnail main_project_box">
								<div class="mina_project_box_c">
									<img src="/resources/upload/${map.c_image}"
										alt="Lazy Owl Image">
								</div>
								<div>
									<div class="caption">
										<h3>${map.title}</h3>
										<p>${map.blurb}</p>

									</div>
									<div class="percent_box">

										<c:forEach var="map1" items="${allProjectCard}">
											<c:if test="${map.seq == map1.p_seq }">
												<div class="funded-status">
													&#8361;${map1.funded}/&#8361;${map1.f_goal}</br>
													${map1.current_rate}%
												</div>
												<div class="stat">
													<span style="width: ${map1.current_rate}%;"></span>
												</div>
												<div class="funded-people">
													<span> <c:choose>
															<c:when test="${map1.d_day < '0'}">
																		종료된 프로젝트
																	</c:when>
															<c:otherwise>
																		${map1.d_day} 일 남음
																	</c:otherwise>
														</c:choose>
													</span> ${map1.count}명 후원중
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
						</a>

					</div>
				</c:forEach>
			</div>
		</div>
		<hr>
		<div class="row">
			<h2>종료한 프로젝트</h2>

			<c:forEach var="map" items="${ourProjectView2}">
				<div class="op_view toggled-${map.seq}">

					<table class="our-project-detail">
					<tbody>
						<tr>
							<td>
								<div class="project_box">
									<a class="item-list-link" href="/projectInfo?seq=${map.seq}">
										<div class="thumbnail main_project_box">
											<div class="mina_project_box_c">
												<img src="/resources/upload/${map.c_image}" alt="">
											</div>
											<div>
												<div class="caption">
													<h3>${map.title}</h3>
													<p>${map.blurb}</p>

												</div>
												<div class="percent_box">

													<c:forEach var="map1" items="${allProjectCard}">
														<c:if test="${map.seq == map1.p_seq }">
															<div class="funded-status">
																&#8361;${map1.funded}/&#8361;${map1.f_goal}</br>
																${map1.current_rate}%
															</div>
															<div class="stat">
																<span style="width: ${map1.current_rate}%;"></span>
															</div>
															<div class="funded-people">
																<span> <c:choose>
																		<c:when test="${map1.d_day < '0'}">
																		종료된 프로젝트
																	</c:when>
																		<c:otherwise>
																		${map1.d_day} 일 남음
																	</c:otherwise>
																	</c:choose>
																</span> ${map1.count}명 후원중
															</div>
														</c:if>
													</c:forEach>
												</div>
											</div>
										</div>
									</a>
								</div>
							</td>
							<td>
								<div>
									<table>
									<tbody>
										<tr>
											<td>후원일자</td>
											<td>옵션번호</td>
											<td>후원금액</td>
											<td>메시지</td>
										</tr>
										<c:forEach var="order" items="${ourProjectView}">

											<c:if test="${map.seq == order.p_seq}">
												<tr>
													<td>${order.pay_date}</td>
													<td>${order.option_no}</td>
													<td>${order.pay_money}</td>
													<td>	<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#myModal${order.m_p_seq}_${order.p_seq}">메시지</button></td>
													
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
									</table>
								</div>
							</td>
							<td>
								<p class="toggles-${map.seq}">닫기</p>
							</td>
						</tr>
						</tbody>
					</table>

				</div>
			</c:forEach>
			<div id="owl-demo-2" class="owl-carousel">
				<c:forEach var="map" items="${ourProjectView2}">
					<div class="project_box item">

						<a class="item-list-link toggles-${map.seq} lazyOwl">
							<div class="thumbnail main_project_box">
								<div class="mina_project_box_c">
									<img src="/resources/upload/${map.c_image}"
										alt="Lazy Owl Image">
								</div>
								<div class="caption">
									<h3>${map.title}</h3>
									<p>${map.blurb}</p>

								</div>
								<div class="percent_box">
									<c:forEach var="map1" items="${allProjectCard}">
										<c:if test="${map.seq == map1.p_seq }">
											<div class="funded-status">
												&#8361;${map1.funded}/&#8361;${map1.f_goal}</br>
												${map1.current_rate}%
											</div>
											<div class="stat">
												<span style="width: ${map1.current_rate}%;"></span>
											</div>
											<div class="funded-people">
												<span> <c:choose>
														<c:when test="${map1.d_day < '0'}">
																		종료된 프로젝트
																	</c:when>
														<c:otherwise>
																		${map1.d_day} 일 남음
																	</c:otherwise>
													</c:choose>
												</span> ${map1.count}명 후원중
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</a>

					</div>
				</c:forEach>
			</div>


		</div>
	</div>
	<%--
	<div class="popProject">
		<div class="mini-header">
			<span>우리의 프로젝트</span>
		</div>

		<div class="project-list">
			<c:forEach var="map" items="${ourProjectView1}">
				<div class="op_view" id="toggled-${map.seq}">
					<table class="our-project-detail">
						<tr>
							<td>
								<div class="project-card">
									<a class="item-list-link" href="/projectInfo?seq=${map.seq}">
										<img src="/resources/upload/${map.c_image}"
										onError="this.src='/resources/images/1.jpg';" />
										<div class="content">
											<p>${map.title}</p>
											<p>${map.blurb}</p>
										</div>
										<div class="funded-status">
											&#8361;${map.funded}/&#8361;${map.f_goal}</br>
											${map.current_rate}%
										</div>
										<div class="stat">
											<span style="width: ${map.current_rate}%;"></span>
										</div>
										<div class="funded-people">
											<span> <c:choose>
													<c:when test="${map.d_day < '0'}">
											종료된 프로젝트
										</c:when>
													<c:otherwise>
											${map.d_day} 일 남음
										</c:otherwise>
												</c:choose>
											</span> ${map.count}번 후원함
										</div>
									</a>
								</div>
							</td>
							<td>
								<div>
									<table>
										<tr>
											<td>후원일자</td>
											<td>옵션번호</td>
											<td>후원금액</td>
											<td>주소입력</td>
										</tr>
										<c:forEach var="order" items="${ourProjectView}">

											<c:if test="${map.seq == order.p_seq}">
												<tr>
													<td>${order.pay_date}</td>
													<td>${order.option_no}</td>
													<td>${order.pay_money}</td>
													<td>주소입력</td>
												</tr>
											</c:if>
										</c:forEach>
									</table>
								</div>
							</td>
							<td>
								<p class="toggles-${map.seq}">닫기</p>
							</td>
						</tr>
					</table>
				</div>
			</c:forEach>

			<ul class="item-list">
				<c:forEach var="map" items="${ourProjectView1}">

					<li class="toggles-${map.seq}">
						<div class="project-card">
							<a class="item-list-link" href="#"> <img alt="not yet"
								src="/resources/upload/${map.c_image}" />
								<div class="content">
									<p>${map.title}</p>
									<p>${map.blurb}</p>
								</div>
								<div class="funded-status">
									&#8361;${map.funded}/&#8361;${map.f_goal}</br> ${map.current_rate}%
								</div>
								<div class="stat">
									<span style="width: ${map.current_rate}%;"></span>
								</div>
								<div class="funded-people">
									<span> <c:choose>
											<c:when test="${map.d_day < '0'}">
											종료된 프로젝트
										</c:when>
											<c:otherwise>
											${map.d_day} 일 남음
										</c:otherwise>
										</c:choose>
									</span> ${map.count}번 후원함
								</div>
							</a>
						</div>
					</li>

				</c:forEach>
			</ul>

		</div>
	</div>
	<div class="popProject">
		<div class="mini-header">
			<span>종료한 프로젝트</span>
		</div>
		<div class="project-list">
			<c:forEach var="map" items="${ourProjectView2}">
				<div class="op_view toggled-${map.seq}">
					<table class="our-project-detail">
						<tr>
							<td>
								<div class="project-card">
									<a class="item-list-link" href="/projectInfo?seq=${map.seq}">
										<img src="/resources/upload/${map.c_image}"
										onError="this.src='/resources/images/1.jpg';" />
										<div class="content">
											<p>${map.title}</p>
											<p>${map.blurb}</p>
										</div>
										<div class="funded-status">
											&#8361;${map.funded}/&#8361;${map.f_goal}</br>
											${map.current_rate}%
										</div>
										<div class="stat">
											<span style="width: ${map.current_rate}%;"></span>
										</div>
										<div class="funded-people">
											<span> <c:choose>
													<c:when test="${map.d_day < '0'}">
											종료된 프로젝트
										</c:when>
													<c:otherwise>
											${map.d_day} 일 남음
										</c:otherwise>
												</c:choose>
											</span> ${map.count}번 후원함
										</div>
									</a>
								</div>
							</td>
							<td>
								<div>
									<table>
										<tr>
											<td>후원일자</td>
											<td>옵션번호</td>
											<td>후원금액</td>
											<td>주소입력</td>
										</tr>
										<c:forEach var="order" items="${ourProjectView}">

											<c:if test="${map.seq == order.p_seq}">
												<tr>
													<td>${order.pay_date}</td>
													<td>${order.option_no}</td>
													<td>${order.pay_money}</td>
													<td>주소입력</td>
												</tr>
											</c:if>
										</c:forEach>
									</table>
								</div>
							</td>
							<td>
								<p class="toggles-${map.seq}">닫기</p>
							</td>
						</tr>
					</table>
				</div>
			</c:forEach>
			<ul class="item-list">
				<c:forEach var="map" items="${ourProjectView2}">
					<li class="toggles-${map.seq}">
						<div class="project-card">
							<a class="item-list-link"> <img
								src="/resources/upload/${map.c_image}"
								onError="this.src='/resources/images/1.jpg';" />
								<div class="content">
									<p>${map.title}</p>
									<p>${map.blurb}</p>
								</div>
								<div class="funded-status">
									&#8361;${map.funded}/&#8361;${map.f_goal}</br> ${map.current_rate}%
								</div>
								<div class="stat">
									<span style="width: ${map.current_rate}%;"></span>
								</div>
								<div class="funded-people">
									<span> <c:choose>
											<c:when test="${map.d_day < '0'}">
											종료된 프로젝트
										</c:when>
											<c:otherwise>
											${map.d_day} 일 남음
										</c:otherwise>
										</c:choose>
									</span> ${map.count}번 후원함
								</div>
							</a>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>

 --%>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>