<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
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
        <title>Carousel Template for Bootstrap</title>
        <!-- Bootstrap core CSS -->
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
        <!-- Custom styles for this template -->
        <link href="carousel.css" rel="stylesheet">
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
        <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
            <!-- Indicators -->
            <ol class="carousel-indicators container" >
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
        <div class="container marketing">
            <!-- Three columns of text below the carousel -->
            <!-- /.row -->
            <!-- START THE FEATURETTES -->
            <div class="row featurette">
                <div class="col-md-5">
                    <img class="featurette-image img-responsive" src="http://pinegrow.com/placeholders/img7.jpg" alt="Generic placeholder image">
                </div>
                <div class="col-md-7">
                    <h2 class="featurette-heading">Oh yeah, it's that good. <span class="text-muted">See for yourself.</span></h2>
                    <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
                </div>
                <div class="progress-bar mina_project_bar" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width:30%">
                    <span class="sr-only mina_project_bar_sr_only">30% Complete</span>
                </div>
            </div>
            <!-- /END THE FEATURETTES -->
            <!-- FOOTER -->
        </div>
        <div class="container">
            <div class="row">
                <h2>인기 프로젝트</h2>
       
				<c:forEach var="map" items="${projectCard}">
					<div class="col-md-3 col-sm-6 col-xs-12 project_box" >
					    
						<a class="item-list-link" href="/projectInfo?seq=${map.seq}">
							<div class="thumbnail main_project_box">
								<div class="mina_project_box_c">
									<img src="/resources/images/${map.c_image}.jpg" alt="">
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
            <div class="row">
                <h2>후원자가 많은 프로젝트</h2>
                <c:forEach var="map" items="${mostProjectCard}">
					<div class="col-md-3 col-sm-6 col-xs-12 project_box" >
					    
						<a class="item-list-link" href="/projectInfo?seq=${map.seq}">
							<div class="thumbnail main_project_box">
								<div class="mina_project_box_c">
									<img src="/resources/images/${map.c_image}.jpg" alt="">
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