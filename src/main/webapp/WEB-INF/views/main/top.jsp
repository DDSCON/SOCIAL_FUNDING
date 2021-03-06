<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
<!--         <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content=""> -->
        <link href="/resources/css/top.css" rel="stylesheet">
        <title>Blank Template for Bootstrap</title>
        <!-- Bootstrap core CSS -->
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    
    
 <script type="text/javascript">
		function login() {
			var email = $('#email').val();
			var pw = $('#pw').val();
			$.ajax({
				type : "POST",
				url : "/login",
				data : {
					email : email,
					pw : pw
				},
				dataType : "json"
			//contentType: "application/json; charset=utf-8"
			}).done(function(msg) {
				if ('y' == msg.message) {
					
					location.href = "";

				} else {
					alert("회원이아닌경우 회원가입해주세요.");
				}
			});
		}
</script>
    
<script type="text/javascript">
function newProject(){

	
	if(${empty sessionScope.email}){
		$('#loginButton').trigger('click');
		
	} else {
		location.replace('/newProject');
	}
	

}
</script>

<script type="text/javascript">
function logout() {
	$.ajax({
		url : "/logout",
		type: "GET"
	});
	location.href = ""
};
</script>

	<script type="text/javascript">
		var count = 0;

		function signup() {

			var name = $('#name').val();
			var email = $('#email1').val();
			var pw = $('#pw1').val();

			if (!$.trim($("#name").val())) {
				alert("이름을 입력 하세요.");
				return false;
			}
			if (!$.trim($("#email1").val())) {
				alert("영문,숫자 입력 최대 입력단어 20자를 입력하세요.");
				return false;
			}
 			if (count == "0") {
				alert("아이디 중복 체크를 해주세요.");
				return false;

			} 
			if (!$.trim($("#pw1").val())) {
				alert("비밀번호를 입력 하세요.");
				return false;
			}
			if (!$.trim($("#pw2").val())) {
				alert("비밀번호 확인을 하세요.");
				return false;
			}

			$.ajax({
				type : "POST",
				url : "/signup",
				data : {

					name : name,
					email : email,
					pw : pw

				},
				dataType : "json"
			}).done(function(msg1) {
				if ('y' == msg1.message) {
					alert("회원가입 성공");
					location.href = ""
					$('#sign').hide();
				}
			});
		}
		function hideSign() {
			$('#sign').hide();
		}
	</script>
	
	<!-- 비밀번호 일치확인 --------------------------------------------------------------------------------- -->
	<script>
		function verifynotify(field1, field2, result_id, match_html, nomal_html,
				nomatch_html) {
			this.field1 = field1;
			this.field2 = field2;
			this.nomal_html = nomal_html;
			this.result_id = result_id;
			this.match_html = match_html;
			this.nomatch_html = nomatch_html;
			this.check = function() {
				if (!this.result_id) {
					return false;
				}
				if (!document.getElementById) {
					return false;
				}
				r = document.getElementById(this.result_id);
				if (!r) {
					return false;
				}
				if(this.field1.value == ""){
					
					r.innerHTML = this.nomal_html;
				}
				else if(this.field1.value != ""
						&& this.field1.value == this.field2.value) {
					r.innerHTML = this.match_html;
				} else {
					r.innerHTML = this.nomatch_html;
				}
			}
		}
		function verifyInput() {
			verify = new verifynotify();
			verify.field1 = document.password_form.pw1;
			verify.field2 = document.password_form.pw2;
			verify.result_id = "password_result";
			verify.nomal_html = "<span style=\"color:blue\"><\/span>";
			verify.match_html = "<span style=\"color:blue\">패스워드가 확인되었습니다.<\/span>";
			verify.nomatch_html = "<span style=\"color:red\">패스워드를 정확하게 입력하세요.<\/span>";
			// Update the result message
			verify.check();
		}
		function addLoadEvent(func) {
			var oldonload = window.onload;
			if (typeof window.onload != 'function') {
				window.onload = func;
			} else {
				window.onload = function() {
					if (oldonload) {
						oldonload();
					}
					func();
				}
			}
		}
		addLoadEvent(function() {
			verifyInput();
		});
	</script>
    
    	<script>

	function checkId() {
		var email = $('#email1').val();
		
		if (!$.trim($("#email1").val())) {
			alert("E-MAIL을 입렵하세요.");
			return false;
		} else {
			
			$.ajax({
				type : "POST",
				url : "/checkId",
				data : {
					email : email
				},
				dataType : "json"
			}).done(function(msg2) {
				if ('y' == msg2.message) {
					alert("중복된 이메일입니다.");
					$("#button").attr("disabled", true);
					count = 0;
				} else {
					
					if (confirm('사용할수 있는 아이디입니다.사용하시겠습니까?')) {
						$("input[name = 'email1']").attr("readonly", true);
						$("#button").attr("disabled", false);
						count = 1;
						
					}else{
					 		
					}
				}
			});
		}
			
		}
		

	
	
</script>
<style>
	.navbar-default {
		opacity: 0.8;
	}
</style>
    </head>
    <body>
    
        <div class="modal fade pg-show-modal" id="modal1" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal_size">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">로그인</h4>
                    </div>
                    <div class="modal-body">
                        <div class="">
                            <div class="form-group">
                                <input type="text" name="email" id="email" class="form-control modal_login_email" placeholder="E-MAIL" >
                                <div id="email_result" style="position: center"> </div>
                                <input type="password" nema="pw" id="pw" class="form-control modal_login_pw" id="formInput65" placeholder="비밀번호">
                                <button type="button" onclick="login()" class="btn btn-default modal_login_button btn-primary">로그인</button>
                                <button type="button" class="btn btn-default modal_signup_button btn-success" data-toggle="collapse" data-target="#demo">회원가입</button>
                            </div>
                        </div>
                        <div id="demo" class="collapse">
                            <input type="text" class="form-control modal_login_email_sigpu" name="email1" id="email1" placeholder="E-MAIL">
                            <button type="button" class="btn btn-default idcheck_signpu" onclick="checkId()">중복확인</button>
                            <input type="hidden" name="chk_Id" id="chk_Id" value="0">
                            <input type="text" class="form-control modal_login_email" name="name" id="name" placeholder="닉네임">
                            <form name="password_form">
                            <input type="password" class="form-control modal_login_email pw1" name="pw1" id="pw1" onkeyup="verify.check()" placeholder="비밀번호">
                            <input type="password" class="form-control modal_login_email pw2" name="pw2" id="pw2" onkeyup="verify.check()" placeholder="비밀번호 확인">
                            <div id="password_result" style="position: center"> </div>
                            </form>
                            <button type="button" class="btn btn-default modal_login_button btn-primary" onclick="signup()">가입</button>
                        </div>
                    </div>
                    <div class="modal-footer">
</div>
                </div>
            </div>
        </div>
        <nav class="navbar navbar-default navbar-fixed-top top_nav alpha_nav" role="navigation">
        
            <div class="row ">
                <div class="top_logo col-md-1 col-lg-1 col-xs-1 col-sm-2 col-sm-push-0 col-xs-push-0 col-lg-push-0 col-md-push-0">
                    <a href="/"><img src="/resources/images/funday.jpg" / style="width: 241px; padding-top: 7px; padding-left: 39px;"></a>
                </div>
                <div class="top_list col-md-5 col-lg-5 col-xs-5 col-xs-push-1 col-sm-push-1 col-sm-6 col-md-push-1 col-lg-push-1">
                    <li>
                        <a href="/projectMain">프로젝트 찾아보기</a>
                    </li>
                    <li>
                        <a href="javascript:newProject()">프로젝트 만들기</a>
                    </li>
                </div>
                <div class="col-md-2 col-lg-2 col-sm-2 col-xs-2 col-sm-push-0 col-xs-push-0 col-md-push-1 col-lg-push-1 hidden-sm hidden-xs">
                    
                </div>
                <div class="col-md-4 col-lg-4 col-sm-4 col-xs-4 col-lg-pull-1 col-md-pull-1 ">
                    <div class="top_login">
                    
						<c:choose>
							<c:when test="${not empty sessionScope.email}">
								
								
  
								<div class="btn-group">
									<a href="mypageButton" data-toggle="dropdown"> ${sessionScope.name}님</a>
									<ul class="dropdown-menu" role="menu">
									    <li>
									        <a href="/account/ourProjectView">나의 후원현황</a>
									    </li>
									    <li>
									        <a href="/account/myProjectView">나의 프로젝트</a>
									    </li>
									    <li>
									        <a href="/account/profile1">나의 프로필</a>
									    </li>
									    <li class="divider"></li>
									    <li>
									        <a href="/account/profile2">결제정보 설정</a>
									    </li>
									</ul>
								</div>


								<button type="button" id="logout" onclick="logout()" class="btn btn-default login_button" data-toggle="modal">로그아웃</button>
							</c:when>
						                  
							<c:otherwise>
								<button type="button" id="loginButton" class="btn btn-default login_button"  data-toggle="modal" data-target="#modal1">로그인</button>
							</c:otherwise>
						</c:choose>
                        
                    </div>
                </div>
                
                
            </div>
            
        
        </nav>
        <!-- Bootstrap core JavaScript
    ================================================== -->

        <script src="assets/js/jquery.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        
        <script src="assets/js/ie10-viewport-bug-workaround.js"></script> 
    </body>
</html>
