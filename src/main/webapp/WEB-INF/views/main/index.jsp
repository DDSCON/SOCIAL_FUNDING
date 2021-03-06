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
        <title>fundAY~ 즐거운 소셜펀딩 펀데이</title>
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
        	.table_box td {
        		padding: 15px;
        	}
        	
        </style>
    </head>
    <!-- NAVBAR
================================================== -->
    <body>
    <jsp:include page="../main/top.jsp"></jsp:include>
	<div class="navbar-wrapper">
		<div class="container">
		</div>
	</div>
        <!-- Carousel
    ================================================== -->
        <div id="myCarousel" class="carousel slide">
            <!-- Indicators -->
            <ol class="carousel-indicators" >
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
                <li data-target="#myCarousel" data-slide-to="4"></li>
                <li data-target="#myCarousel" data-slide-to="5"></li>
                <li data-target="#myCarousel" data-slide-to="6"></li>
                <li data-target="#myCarousel" data-slide-to="7"></li>
                <li data-target="#myCarousel" data-slide-to="8"></li>
                <li data-target="#myCarousel" data-slide-to="9"></li>
                <li data-target="#myCarousel" data-slide-to="10"></li>
                <li data-target="#myCarousel" data-slide-to="11"></li>
                <li data-target="#myCarousel" data-slide-to="12"></li>
                <li data-target="#myCarousel" data-slide-to="13"></li>
                
            </ol>
            <div class="carousel-inner">
                <div class="item active">
                	<img src="/resources/images/1.jpg" alt="First slide">
                </div>
                <c:forEach var="i" begin="2" end="13">
                <div class="item">
                    <img src="/resources/images/${i }.jpg" alt="Second slide">
                </div>
                </c:forEach>
            </div>
            <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
        </div>
        <!-- /.carousel -->
        <!-- Marketing messaging and featurettes
    ================================================== -->
        <!-- Wrap the rest of the page in another container to center all the content. -->


    

		<div class="container list_box_tabs">
				
				
			<section class="tabs">
				
					<input id="tab-1" type="radio" name="radio-set" class="tab-selector-1" checked="checked " />
					<label for="tab-1" class="tab-label-1">HEALTH</label>
				 
				<c:forEach var="map" items="${category}" begin="1" end="13">
				
					<input id="tab-${map.seq}" type="radio" name="radio-set" class="tab-selector-${map.seq}"   />
					<label for="tab-${map.seq}" class="tab-label-${map.seq}">${map.name}</label>

				</c:forEach>
				
	
				
				<div class="content">
				
					<c:forEach var="map" items="${categoryProject}" varStatus="status">
					     
					     
					    
						<div class="content-${map.seq}">
							<a href="/projectInfo?seq=${map.pSeq}">
							<table class="table_box">
								<tr>
								<td>
									<img src="/resources/upload/${map.c_image}" onError="this.src='/resources/images/1.jpg';" style="width: 500px;"/>
								</td>
								
								<td>
									<div class="title_text_box">
										<h3>${map.title}</h3>
										${map.blurb}
									</div>
									<div>
										&#8361;${map.funded_money}/&#8361;${map.f_goal_money}</br>
										${map.current_rate}%
									</div>
									<div class="stat">
										<span style="width: ${map.current_rate}%;"></span>
									</div>
									<div >
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
								</td>
								</tr>
							</table>	
							</a>
						</div>
					 
			       	</c:forEach>
			       	
	       	 	</div>   
			</section>
	
</div>
    
    
    
    
    
    
    
            <!-- Three columns of text below the carousel -->
            <!-- /.row -->
            <!-- START THE FEATURETTES -->
		<div style="background-color:#f9f9f7;">
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

<jsp:include page="../main/footer.jsp"></jsp:include>
<!-- /.container -->
<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="assets/js/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="assets/js/ie10-viewport-bug-workaround.js"></script>