<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
        <script src="assets/js/jquery.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="assets/js/ie10-viewport-bug-workaround.js"></script> 
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/css/bootstrap.min.css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/profile1.css">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
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
			function commit() {
				$('#form_send').attr('action', '/account/updatamember_detail').submit();
			}
		</script> 
		
		<script>
		function verifynotify2(fields1, fields2, result_ids, match_htmls, nomatch_htmls, nomal_htmls) {
			
		  this.fields1 = fields1;
		  this.fields2 = fields2;
		  this.nomal_htmls = nomal_htmls;
		  this.result_ids = result_ids;
		  this.match_htmls = match_htmls;
		  this.nomatch_htmls = nomatch_htmls;
		  this.check2 = function() {
		    if (!this.result_ids) { return false; }
		    if (!document.getElementById){ return false; }
		    t = document.getElementById(this.result_ids);
		    if (!t){ return false; }
		    
		    if(this.fields1.value == ""){
				
				t.innerHTML = this.nomal_htmls;
			}
			else if (this.fields1.value != "" && this.fields1.value == this.fields2.value) {
		      t.innerHTML = this.match_htmls;
		    } else {
		      t.innerHTML = this.nomatch_htmls;
		    }
		  }
		}
		function verifyInput2() {
		  verify2 = new verifynotify2();
		  verify2.fields1 = document.password_form2.profile_pw;
		  verify2.fields2 = document.password_form2.profile_pw1;
		  verify2.result_ids = "password_result2";
		  verify2.nomal_htmls = "<span style=\"color:black\">비밀번호를 입력하세요<\/span>";
		  verify2.match_htmls = "<span style=\"color:blue\">패스워드가 확인되었습니다.<\/span>";
		  verify2.nomatch_htmls = "<span style=\"color:red\">패스워드를 정확하게 입력하세요.<\/span>";
		  // Update the result message
		  verify2.check2();
		}
		function addLoadEvent2(func) {
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
		addLoadEvent2(function() {
		  verifyInput2();
		});
		</script>
		
    </head>
<body>

	<jsp:include page="../main/top.jsp"></jsp:include>
 	

 <div class="container b_con">
            <div class="">
                <h1>프로필 설정</h1>
                <hr/>
            </div>
            <div class="b-main">
                <div class="col-md-3 text-center">
                
                    <p class="p-name text-right">이름 :&nbsp;</p>
                    <p class="p-name text-right">비밀번호 :&nbsp;</p>
                    <p class="p-name text-right">비밀번호 확인 :&nbsp;</p>
                  	<p class="p-name text-right"></p>
                    <p class="p-name text-right">SNS :&nbsp;</p>
                    <p class="p-name text-right">전화번호 :&nbsp;</p>
                    <p class="p-name p-add text-right">주소 :&nbsp;</p>
                </div>
            <form action="" method="post" id="form_send" name="password_form2">
                <div class="col-md-9">
                <c:forEach var="getAllmember" items="${getAllmember}">
					<input type="hidden" name="seq" value="${getAllmember}">
				 </c:forEach>
                    <input type="text" class="form-control name_input" value="${name}" disabled="true">
                    
                    
                    <input type="password" onkeyup="verify2.check2()" placeholder="비밀번호" class="form-control name_input" name="pw" id="profile_pw">
                    <input type="password" onkeyup="verify2.check2()" placeholder="비밀번호 확인" class="form-control name_input" name="pw1" id="profile_pw1">
                    
                    <div id="password_result2"></div>
                    
                    
                    <input type="text" class="form-control name_input" placeholder="SNS" name="sns" id="sns" value="<c:forEach var="map" items="${getMemberDetail}">${map.sns}</c:forEach>">
                    <input type="text" class="form-control name_input" placeholder="전화번호" name="phone" id="phone" value="<c:forEach var="map" items="${getMemberDetail}">${map.phone}</c:forEach>">
		  			<label for="exampleInputPassword1"></label>
	  			
	  			<div>	
					<div id="wrap" style="display: none; border: 1px solid; width: 450px; height: 300px; margin: 5px 0; position: relative; -webkit-overflow-scrolling: touch;">
						<img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1" onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>
				
					<input type="text" onclick="sample3_execDaumPostcode()" class="form-control d_form large add_input" id="location_address" name="addr" placeholder="주소" value="<c:forEach var="map" items="${getMemberDetail}">${map.addr}</c:forEach>">
		  			<input type="text" class="form-control location add_input" id="location" name="addr_detail" placeholder="상세주소" value="<c:forEach var="map" items="${getMemberDetail}">${map.addr_detail}</c:forEach>"><br>
					<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
				</div>
                </div>
            </form>
            </div>
        </div>
        <div class="text-center" style="padding-bottom: 100px;">
            <button type="button" class="btn btn-default login_button" onclick="commit()" >수정</button>
        </div>
        
        <!-- Bootstrap core JavaScript
    ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
 	
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
<script>
<!--  주소검색   ----------------------------------------------------------------------------------------------------------------------------- -->
//우편번호 찾기 찾기 화면을 넣을 element
var element_wrap = document.getElementById('wrap');

function foldDaumPostcode() {
    // iframe을 넣은 element를 안보이게 한다.
    element_wrap.style.display = 'none';
}

function sample3_execDaumPostcode() {
    // 현재 scroll 위치를 저장해놓는다.
    var currentScroll = Math.max(
        document.body.scrollTop,
        document.documentElement.scrollTop);
    new daum.Postcode({
        oncomplete: function(data) {
            // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = data.address; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 기본 주소가 도로명 타입일때 조합한다.
            if (data.addressType === 'R') {
                //법정동명이 있을 경우 추가한다.
                if (data.bname !== '') {
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if (data.buildingName !== '') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
            }

            // 우편번호와 주소 및 영문주소 정보를 해당 필드에 넣는다.
            document
                .getElementById('location_address').value = data.postcode1 + "-" + data.postcode2 + " " + fullAddr;
            /* document
													.getElementById('location1').value = data.postcode2;
											document
													.getElementById('location_address').value = fullAddr;
	 */
            // iframe을 넣은 element를 안보이게 한다.
            element_wrap.style.display = 'none';

            // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
            document.body.scrollTop = currentScroll;
        },
        // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
        onresize: function(size) {
            element_wrap.style.height = size.height + "px";
        },
        width: '100%',
        height: '100%'
    }).embed(element_wrap);

    // iframe을 넣은 element를 보이게 한다.
    element_wrap.style.display = 'block';
}

</script>
<!--  주소검색	----------------------------------------------------------------------------------------------------------------------------- -->

</html>