<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../main/header.jsp"></jsp:include>
<title><%= request.getParameter("category") %></title>
<style type="text/css">
	.isotope:after {
 		content: '';
  		display: block;
  		clear: both;
	}
</style>
<script>
	$( function() {
	  
	  $('.isotope').isotope({
	    itemSelector: '.item',
	    masonry: {
	      columnWidth: 250,
	      isFitWidth: true
	    }
	  });
	  
	});
</script>
<script type="text/javascript" src="/resources/js/isotope.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/projectCard.css">

<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/js/bootstrap.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap-select.js"></script>

<link href="/resources/bootstrap/css/bootstrap-select.css" rel="stylesheet">
<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="/resources/css/index1.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../main/top.jsp"></jsp:include>
	<div class="category">
		<div class="title">
		</div>
		<img alt="" src="/resources/images/category/<%=request.getParameter("category") %>.jpg" />
	</div>
	<div class="popProject">	
	 <div class="container">
	 
            <div class="row">
                <h2>인기 프로젝트</h2>
       
				<c:forEach var="map" items="${projectCard}">
					<c:if test="${map.funded != null }">
					<div class="col-md-3 col-sm-6 col-xs-12 project_box" >
					    
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
								
									<div class="funded-status">
										&#8361;${map.funded_money}/&#8361;${map.f_goal_money}</br>
										${map.current_rate}%
									</div>
									<div class="stat">
											<span style="width: ${map.current_rate}%;"></span>
									</div>
									<div class="funded-people">
										<span>
											<c:choose>
												<c:when test="${map.d_day < '0'}">
													종료된 프로젝트
												</c:when>
												<c:otherwise>
													${map.d_day} 일 남음
												</c:otherwise>
											</c:choose>
										</span>
									${map.count}명 후원중
									</div>
								</div>
							   </div>                  
							</div>
						</a>
					    
					</div>
					</c:if>
                </c:forEach>
             </div>
             
 </div>
 </div>
<div class="allProject">
		 <div class="container">
		 
		         <div class="row">
                	<h2>카테고리 전체 프로젝트</h2>
       
				<c:forEach var="map" items="${allProjectCard}">
					<div class="col-md-3 col-sm-6 col-xs-12 project_box" >
					    
						<a class="item-list-link" href="/projectInfo?seq=${map.seq}">
							<div class="thumbnail main_project_box">
								<div class="mina_project_box_c">
									<img alt="not yet" src="/resources/upload/${map.c_image}" onError="this.src='/resources/images/1.jpg';"/>
								</div>
								<div>
								<div class="caption">
									<h3>${map.title}</h3>
									<p>${map.blurb}</p>
									
								</div>
								<div class="percent_box">
								<c:choose>
								<c:when test="${map.funded != null}">
								
									<div class="funded-status">
										&#8361;${map.funded_money}/&#8361;${map.f_goal_money}</br>
										${map.current_rate}%
									</div>
									<div class="stat">
											<span style="width: ${map.current_rate}%;"></span>
									</div>
									<div class="funded-people">
										<span>
											<c:choose>
												<c:when test="${map.d_day < '0'}">
													종료된 프로젝트
												</c:when>
												<c:otherwise>
													${map.d_day} 일 남음
												</c:otherwise>
											</c:choose>
										</span>
									${map.count}명 후원중
									</div>								

								</c:when>
								<c:otherwise>
							<div class="funded-status">
								&#8361;0/&#8361;${map.f_goal_money}</br>
								0%
							</div>
							<div class="stat">
								<span style="width: ${map.current_rate}%;"></span>
							</div>
							<div class="funded-people">
								<span>
									<c:choose>
										<c:when test="${map.d_day < '0'}">
											종료된 프로젝트
										</c:when>
										<c:otherwise>
											${map.d_day} 일 남음
										</c:otherwise>
									</c:choose>
								</span>
								0명 후원중
							</div>
							</c:otherwise>
								</c:choose>
								

								</div>
							   </div>                  
							</div>
						</a>
					    
					</div>
                </c:forEach>
             </div>
             </div>
		 </div>	
	<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>