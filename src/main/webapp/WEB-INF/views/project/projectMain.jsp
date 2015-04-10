<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    
 
        <link rel="stylesheet" type="text/css" href="/resources/css/demo.css" />
        <link rel="stylesheet" type="text/css" href="/resources/css/style4.css" />
		<script type="text/javascript" src="/resources/js/modernizr.custom.04022.js"></script>
		<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:700,300,300italic' rel='stylesheet' type='text/css'>

    

    
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="/resources/css/index1.css" rel="stylesheet">
        <jsp:include page="../main/header.jsp"></jsp:include>
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/css/bootstrap.min.css">
		<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="/resources/js/isotope.pkgd.min.js"></script>
        <title>fundAY 프로젝트 찾아보기</title>
        <!-- Bootstrap core CSS -->
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
        <!-- Custom styles for this template -->
        <link href="carousel.css" rel="stylesheet">
        <style>
        	.category-list {
        		padding: 10px auto;
        	}
        	.category-list-link {
        		font-family: "RixSGo B","Apple SD Gothic Neo","MalgunGothic","Dotum";
        		color: #595957;
        		font-size: 32px;
        		margin: 10px;
        		padding: 10px;
        		text-align: center;
        	}
        	.category-list-link:hover{
				background-color: #24cdef;
				color: #ffffff !important;
			}
        	.isotope {
        		margin: 2em auto;
        		max-width: 800px;
        	}
        	.isotope:after {
        		content: '';
        		display: block;
        		clear: both;
        		margin: 2em auto;
        	}
        	.item {
        		margin: 5px;
        		padding: 5px;
        	}
        </style>
    </head>
    
    
    
<body>
	<jsp:include page="../main/top.jsp"></jsp:include>
	<br>
	<br>
	<br>
	<div class="category-list">
		<div class="isotope js-isotope" data-isotope-options='{ "layoutMode": "fitRows", "itemSelector": ".item" }'>
			<c:forEach var="i" items="${category}">
			<div class="item">
				<a class="category-list-link" href="/projectCategory?category=${i.name}"><c:out value="${i.name}"/></a>
			</div>
			</c:forEach>
		</div>
	</div>
	<div class="newProject">
		 <div class="container">
		 
		         <div class="row">
                	<h2>최신 프로젝트</h2>
       
				<c:forEach var="map" items="${newProjectCard}">
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
		 
<%-- 		 
		<div class="mini-header">
			<span>최신 프로젝트</span> <a class="mini-header-link" href="#">더보기</a>
		</div>
		<div class="project-list">
			<ul class="item-list">
				<c:forEach var="map" items="${newProjectCard}">
				
						<div class="project-card">
							<a class="item-list-link" href="/projectInfo?seq=${map.seq}">
								<img alt="not yet" src="/resources/upload/${map.c_image}" onError="this.src='/resources/images/1.jpg';"/>
							<div class="content">
								<p>${map.title}</p>
								<p>${map.blurb}</p>
							</div>
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
							</a>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	</div> --%>
	<div class="popProject">	
	 <div class="container">
	 
            <div class="row">
                <h2>인기 프로젝트</h2>
       
				<c:forEach var="map" items="${projectCard}">
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
                </c:forEach>
             </div>
             
 </div>
 </div>
 
 	<div class="mostProject">
 		 <div class="container">
            <div class="row">
                <h2>후원자가 많은 프로젝트</h2>
                <c:forEach var="map" items="${mostProjectCard}">
					<div class="col-md-3 col-sm-6 col-xs-12 project_box" >
					    
						<a class="item-list-link" href="/projectInfo?seq=${map.seq}">
							<div class="thumbnail main_project_box">
								<div class="mina_project_box_c">
									<img src="/resources/upload/${map.c_image}" alt="">
								</div>
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
										<span style="width: ${100*map.funded/map.f_goal}%;"></span>
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
						</a>
					    
					</div>
                </c:forEach>
               
                
                
            </div>
        </div>
	 </div>

	
	
	
	
	
	
	
	
	
	
	<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>