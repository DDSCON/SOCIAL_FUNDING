<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
   
<!--에디  -->
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="/resources/editor/css/froala_editor.min.css" rel="stylesheet" type="text/css">
<link href="/resources/editor/css/froala_style.min.css" rel="stylesheet" type="text/css">
<link href="/resources/css/web.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/resources/editor/js/plugins/froala_editor.min.js"></script>
<script src="/resources/editor/js/plugins/tables.min.js"></script>
<script src="/resources/editor/js/plugins/lists.min.js"></script>
<script src="/resources/editor/js/plugins/colors.min.js"></script>
<script src="/resources/editor/js/plugins/media_manager.min.js"></script>
<script src="/resources/editor/js/plugins/font_family.min.js"></script>
<script src="/resources/editor/js/plugins/font_size.min.js"></script>
<script src="/resources/editor/js/plugins/block_styles.min.js"></script>
<script src="/resources/editor/js/plugins/video.min.js"></script>
   
   
   
   
  
   


 <link href="/resources/css/newProject.css" rel="stylesheet" type="text/css"> 
   <!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
 <script src="https://d1pqmsyqo4bi9.cloudfront.net/assets/application-99a028af18a1635104582bae8067c1e4.js" type="text/javascript"></script>

<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/css/bootstrap.min.css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery.supercal.js"></script>
<!-- <script src="/resources/bootstrap/js/bootstrap-select.js"></script>
<script src="/resources/bootstrap/js/bootstrap-select.min.js"></script> 
<link href="/resources/bootstrap/css/bootstrap-select.css" rel="stylesheet">
<link href="/resources/bootstrap/css/bootstrap-select.min.js" rel="stylesheet">  --> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<title>프로젝트 만들기 </title>

<style type="text/css">




</style>






<!-- 에디터 -->
   <script>
      $(function(){
        $('#description').editable({inlineMode: false})

        $('form').submit(function () {
          console.log($(this).find('textarea').val());
          return true;
        })
      });
  </script>  

<!-- 완료버튼 -->
<script type="text/javascript">
 
function commit() {
	var email_chcek = $("#email_check_input").val(); 
	
	if(email_chcek == 0){
		
		alert("이메일 인증을 하세요.");
		
	} else {
		
		$('#project_form').attr('action', '/insertProject').submit();
		
	}
    

}

function freeview() {





	var gsWin = window.open('about:blank','payviewer');

	var frm =document.project_form;

	frm.action = '/projectInfoFreeView';

	frm.target ="payviewer";

	frm.method ="post";

	frm.submit();

	


	 $('#project_form').attr('action', '/projectInfoFreeView').submit();
	    
	


}
 
</script>

<!--  메일보내기 & 모달 스위치-->
<script type="text/javascript">

function sendMail() {
    /* 	$(document).ready(function(){
			$('.paulund_modal').paulund_modal_box();
		}); */

    var contact_detail_email = $('#contact_detail_email').val();
    $.cookie("MAIL", $("#contact_detail_email").val(), {
        expires: 30
    });
    $.ajax({
        type: "POST",
        url: "/mail",
        data: {
            contact_detail_email: contact_detail_email
        },
        dataType: "json"
            //contentType: "application/json; charset=utf-8"
    }).done(function(msg) {
        $('.ajaxLayer').hide();
        if ('Y' == msg.isSuccess) {
            $('#contact_detail_email_button').click();
            alert('메일발송이 완료되었습니다.');

            


        } else {
            alert('시스템 에러가 발생했습니다.');
        }
    });
    

}

</script>

<!-- 모달 닫기 -->
<script type="text/javascript">

function modal_close(){
	
	$(".close").click();
	
}

</script>



<!-- 파일업로드 ajax -->
<script type="text/javascript">
/* teamimageUpload_project */
function fileupload_button() {
    var form = $('form[name=fileupload_form]')[0];
    var formData = new FormData(form);


    $.ajax({
        url: '/imageUpload_project',
        data: formData,
        processData: false,
        contentType: false,
        type: 'POST',
        dataType: "json"
    }).done(function(msg) {

        $('#image').val(msg.fileName);
        $('#c_image').val(msg.newFile);
       
        	
        	$(".close").click();
        	
        
        

    })

}

</script>

<!-- team파일업로드 ajax -->
<script type="text/javascript">

function teamfileupload_button() {
    var form = $('form[name=teamfileupload]')[0];
    var formData = new FormData(form);


    $.ajax({
        url: '/teamimageUpload_project',
        data: formData,
        processData: false,
        contentType: false,
        type: 'POST',
        dataType: "json"
    }).done(function(msg) {

        $('#profile_photo').val(msg.teamfileName);
        $('#c_profile_photo').val(msg.teamnewFile);
        $(".close").click();

    })

}

</script>

<!-- video파일업로드 ajax -->
<script type="text/javascript">

function videoUpload_button() {
    var form = $('#p_video').val();
    var formData = new FormData(form);

	if(!$.trim($('#p_video').val())){
		
		alert("동영상 url을 입력하세요.")
		
	} else {
		
		$('#video').val(form);
	       
	       
        $(".close").click();
		
	}
   

        
    
}

</script>

<!-- 메일보내기 ajax -->
<script type="text/javascript">


function email_certification() {
    var email_check = $("#email_check").val()
    var email = $("#contact_detail_email").val()
    $.ajax({
        type: "POST",
        url: "/certification_mail",
        data: {
            email_check: email_check,
            email: email
        },
        dataType: "json"
            //contentType: "application/json; charset=utf-8"
    }).done(function(msg) {
        $('.ajaxLayer').hide();
        if ('Y' == msg.isSuccess) {

            alert('인증완료');

            $('#email_check_input').val("1");


        } else {
            alert('시스템 에러가 발생했습니다.');
        }
    });

}

</script>

<!--  옵션 추가 기능 (구)-->
<!-- <script type="text/javascript">
  var idx;
  var obj_table;
  function my_init() {
    idx=0;
    obj_table=document.all.option.cloneNode(true);
  }
  function afterText() {
    if (idx<4) {  //제한
        idx++;
        eval("document.all.option"+(idx>1?idx-1:"")).z("afterEnd",obj_table.outerHTML.replace("option","option"+idx));
    }
  }
  function del_table() {
    if (idx>0) {
        /* eval("document.all.option"+idx).removeChild(true); */
        
        var x = document.getElementById("option"+idx); 
        x.parentNode.removeChild(x);
        idx--;
    }
  }
</script> -->

<!--  옵션 추가 기능 -->
<script type="text/javascript">
var idx = 2;

function addOtion() {

    if (idx < 5) {

        if ($("#option" + idx).css("display") == "none") {
            jQuery('#option' + idx).css("display", "block");
            idx++;
        }

    }

};

function detOtion() {

    if (idx > 2) {
        idx -= 1;
        if ($("#option" + idx).css("display") == "block") {
            jQuery('#option' + idx).css("display", "none");



        }

    }
}
</script>

<!-- 날짜계산 -->
<script type="text/javascript">

function getInputDayLabel() {

    var newDate = new Date();
    var yy = newDate.getFullYear();
    var mm = newDate.getMonth() + 1;
    var dd = newDate.getDate();
    var toDay = yy + ", " + mm + ", " + dd;


    var tmp = $("#day").val();
    var threeDaysAgo = new Date(toDay); // 2014-03-01 - 월은 0에서부터 시작된다.
    threeDaysAgo.setDate(threeDaysAgo.getDate() - ((tmp) * (-1)));
    var yy1 = threeDaysAgo.getFullYear();
    var mm1 = threeDaysAgo.getMonth() + 1;
    var dd1 = threeDaysAgo.getDate();
    var today1 = yy1 + "-" + mm1 + "-" + dd1;
    $("#f_duration").val(today1)
	$("#f_year").val(yy1)
	$("#f_month").val(mm1)
	$("#f_day").val(dd1)

}

</script>

<!--  달력용 스크립트 -->
<script>
		 
		 $(function() {

			
			    
			  $("#messages").mouseout(function(){
			  	
			    	var String =  $(".uneditable-input").text();
			    	
			        var strarr = String.split('-');
			        $("#f_duration").val(String)
			    	$("#f_year").val(strarr[0]);
			    	$("#f_month").val(strarr[1]);
			    	$("#f_day").val(strarr[2]);
			  		
			  	

			    })
			   

			})

 
</script>









<!--  옵션 추가 기능 -->
<script type="text/javascript">
var idx = 2;

function addOtion() {

    if (idx < 5) {

        if ($("#option_in" + idx).css("display") == "none") {
            jQuery('#option_in' + idx).css("display", "block");
            idx++;
        }

    }

};

function detOtion() {

    if (idx > 2) {
        idx -= 1;
        if ($("#option_in" + idx).css("display") == "block") {
            jQuery('#option_in' + idx).css("display", "none");



        }

    }
}


</script>



<style type="text/css">
body { padding-top: 100px; }
.select_year{
	width: 150px;
	float: left;
}
.select_month{
	width: 80px;
	float: left;
}
.select_day{
	width: 80px;
}




.contact_detail_email_input
{
    width: 440px;
    float: left;
    margin-right: 15px;
}

.contact_detail_email_button
{
    width: 100px;
    padding-left: 15px;
}


</style>




</head>
<body >
  			<!-- <div class="demo6" style="margin:0 auto"></div> -->

 


  			
  			
  			
<jsp:include page="../main/top.jsp"></jsp:include>
				<div class="modal fade pg-show-modal file_upload_modal" id="modal2" tabindex="-1" role="dialog" aria-hidden="true">
				     
				    <div class="modal-dialog">
				        <div class="modal-content">
				            <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				                <h4 class="modal-title">이미지 업로드</h4>
				            </div>
				           
				            <div class="modal-body">
				            
				            	<form name ="fileupload_form" id= "fileupload_form" action="" method="POST" enctype="multipart/form-data">
				            	<input type="file" class="form-control" id="p_image" name= "p_image">
				            	</form>
				            	<!-- <input type="button" value="보내기" id="fileupload_button" onclick="fileupload_button()" >
				                <input type="file" class="form-control" placeholder="Placeholder text"> -->
				
								
								
				                <dl>
				                    <dt>업로드 가능 확장자</dt>
				                    <dd>JPG, PNG, GIF, BMP</dd>
				                </dl>
				            </div>
				           
				            <div class="modal-footer">
				                <!-- <button type="button" class="btn btn-primary" id="fileupload_button" onclick="fileupload_button()">확인</button> -->
				                <a href="javascript:fileupload_button()" class="btn btn-primary" id="fileupload_button">확인</a>
				                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				            </div>
				        </div>
				    </div>
				     
				</div>
				
				<div class="modal fade pg-show-modal file_upload_modal" id="modal3" tabindex="-1" role="dialog" aria-hidden="true">
				     
				    <div class="modal-dialog">
				        <div class="modal-content">
				            <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				                <h4 class="modal-title">동영상 업로드</h4>
				            </div>
				           
				            <div class="modal-body">
				            	
				            	<input type="text" id="p_video" name= "p_video" class="form-control"  placeholder="http://">
				            	

				            	<!-- <input type="button" value="보내기" id="fileupload_button" onclick="fileupload_button()" >
				                <input type="file" class="form-control" placeholder="Placeholder text"> -->
				
								
								
				            </div>
				           
				            <div class="modal-footer">
				                <!-- <button type="button" class="btn btn-primary" id="fileupload_button" onclick="fileupload_button()">확인</button> -->
				                <a href="javascript:videoUpload_button()" class="btn btn-primary" id="videoUpload_button">확인</a>
				                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				            </div>
				        </div>
				    </div>
				     
				</div>
				
				<div class="modal fade pg-show-modal file_upload_modal" id="modal4" tabindex="-1" role="dialog" aria-hidden="true">
				     
				    <div class="modal-dialog">
				        <div class="modal-content">
				            <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				                <h4 class="modal-title">팀이미지 업로드</h4>
				            </div>
				           
				            <div class="modal-body">
				            	<form name ="teamfileupload" id= "teamfileupload" action="/teamimageUpload_project" method="POST" enctype="multipart/form-data">
				            	<input type="file" id="p_teamimage" name= "p_teamimage">
				            	</form>
				            	
				            	<!-- <input type="button" value="보내기" id="fileupload_button" onclick="fileupload_button()" >
				                <input type="file" class="form-control" placeholder="Placeholder text"> -->
				
								
								
				                <dl>
				                    <dt>업로드 가능 확장자</dt>
				                    <dd>JPG, PNG, GIF, BMP</dd>
				                </dl>
				            </div>
				           
				            <div class="modal-footer">
				                <!-- <button type="button" class="btn btn-primary" id="fileupload_button" onclick="fileupload_button()">확인</button> -->
				                <a href="javascript:teamfileupload_button()" class="btn btn-primary" id="teamfileupload_button">확인</a>
				                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				            </div>
				        </div>
				    </div>
				     
				</div>


				<div class="modal fade pg-show-modal file_upload_modal" id="modal5" tabindex="-1" role="dialog" aria-hidden="true">
				     
				    <div class="modal-dialog">
				        <div class="modal-content">
				            <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				                <h4 class="modal-title">메일 보내기</h4>
				            </div>
				           
				            <div class="modal-body">
				            	<input type="text" id="email_check" class="form-control">
				            	<input type="button" value="인증" id="email_certification" class="btn btn-default" onclick="email_certification()">
				            	<!-- <form name ="fileupload_form" id= "fileupload_form" action="" method="POST" enctype="multipart/form-data">
				            	<input type="file" class="form-control" id="p_image" name= "p_image">
				            	</form> -->
				            	<!-- <input type="button" value="보내기" id="fileupload_button" onclick="fileupload_button()" >
				                <input type="file" class="form-control" placeholder="Placeholder text"> -->
				
								
								
				            </div>
				           
				            <div class="modal-footer">
				                <!-- <button type="button" class="btn btn-primary" id="fileupload_button" onclick="fileupload_button()">확인</button> -->
				                <a href="javascript:modal_close()" class="btn btn-primary" id="fileupload_button">확인</a>
				                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				            </div>
				        </div>
				    </div>
				     
				</div>



<div class="container" style="padding-bottom: 100px;">

	<ul class="nav nav-tabs nav-justified">
	  <li><a href="#home" data-toggle="tab">프로젝트</a></li>
	  <li><a href="#profile" data-toggle="tab">옵션</a></li>
	  <li><a href="#messages" data-toggle="tab">상세입력</a></li>
	</ul>
	
	<div class="row tab-content">
	
	  <div class="tab-pane active" id="home">
		
		
  		<div class="col-md-6 ">
  		<form id="project_form" name="project_form" action="" method="post">
	  		<c:if test="${ !empty allMember}">
				<c:forEach var="allMember" items="${allMember}">
					<input type="hidden" name = "m_seq" value="${allMember.seq}"> 
				</c:forEach>
			</c:if>
		
			<input type="hidden" id ="image" name="image">
			<input type="hidden" id ="c_image" name="c_image" value="0">
				
				
				
			
				<div>
					<input type="hidden" value="" id="f_year" name="f_year">
					<input type="hidden" value="" id="f_month" name="f_month">
					<input type="hidden" value="" id="f_day" name="f_day">
					<!-- <input type="text" value="" name="f_duration" id="f_duration_hidden"> -->
					<input type="hidden" value="" id="f_duration" name="f_duration"><br/><br>
					
					
				</div>
				<br>
				
			
  		
  		
  		
  		
  			
  			<div class="form-group">
			    <label class="control-label" for="formInput29">프로젝트 이미지</label>
			    <button type="button" class="btn btn-default btn-block" id="image_button" name="image_button"  data-toggle="modal" data-target="#modal2">업로드</button>
			   
			</div>
			
			
			
			
			
			
			
			
  			<div class="form-group">
			    <label class="control-label" for="formInput29">프로젝트 제목</label>
			    <input type="text" class="form-control" id="title" name="title" placeholder="프로젝트 제목">
			</div>			

  			<div class="form-group">
  				<label class="control-label" for="formInput29">프로젝트 소개</label>
  				<textarea rows="5"class="form-control" name="blurb" id="blurb" cols=""></textarea>
  			</div>
  			<div class="form-group">
  			<label class="control-label" for="formInput29">카테고리</label><br>
				
				<select class="form-control" id="category" name="category">			 
					<c:if test="${ !empty categorys}">
					<c:forEach var="categorys" items="${categorys}">
					<option><c:out value="${categorys.name}"></c:out></option>
					</c:forEach>
					</c:if>
				</select><br>
  			</div>
  			<label for="exampleInputPassword1">프로젝트 주소</label>
	  			
	  			<div>	
					<div id="wrap" style="display: none; border: 1px solid; width: 450px; height: 300px; margin: 5px 0; position: relative; -webkit-overflow-scrolling: touch;">
						<img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1" onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>
				
					<input type="text" onclick="sample3_execDaumPostcode()" class="form-control d_form large" id="location_address" name="location_address" placeholder="주소">
		  			<label for="exampleInputPassword1">상세주소</label>
		  			<input type="text" class="form-control location" id="inputPassword1" name="location" placeholder="상세주소"><br>
					<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
				</div>
  			
  			
  			<label for="exampleInputPassword1">프로젝트 기간</label><br>
			
				<div class="demo6"></div>

  			<label for="exampleInputPassword1">목표 금액</label>
  			<input type="text" class="form-control" id="f_goal" name="f_goal" placeholder="원">
  			<!-- </form> -->
  		</div>
		<div class="col-md-6 "></div>
	  </div>
	  <div class="tab-pane" id="profile">
	  
		
  		<div class="col-md-6 ">
  		<!-- <form id="project_form" action="" method="post"> -->
  		 옵션<br>
			<!-- <input type="button" value="추가" onclick="addOtion()"> -->
			<a href="javascript:addOtion()" class="btn btn-sm btn-info"><span class="glyphicon glyphicon-plus"></span> 추가</a>
			<a href="javascript:detOtion()" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-minus"></span> 지우기</a>
			<br>
			
			<select class="form-control select_year"  id="o_year" name="o_year">
				<% for (int i = 1950 ;  i < 2020; i++) { %>
				<option value="<%=i%>"><%=i%></option>
				<% } %>
			</select>
			<select class="form-control select_month"  id="o_month" name="o_month">
				<% for (int i = 1;  i < 13; i++) { %>
				<option value="<%=i%>"><%=i%></option>
				<% } %>
			</select>
			<select class="form-control select_day"  id="o_day" name="o_day">
				<% for (int i = 1 ;  i < 32; i++) { %>
				<option value="<%=i%>"><%=i%></option>
				<% } %>
			</select>
			<div id="option_in1">
				<input type="hidden" id="o_money0" name = "o_money0" value="1000">
				<input type="hidden" id="o_description0" name = "o_description0" value="옵션을 받지 않고 후원">
				
				
	  			<input type="text" class="form-control" id="o_money1" name="o_money1" value="0" >
	  			<textarea rows="5"class="form-control" id="o_description1" name="o_description1"cols=""></textarea>
				<br>
			</div>
			<!-- option 끝 -->
			<div id="option_in2">
				<input type="text" class="form-control" id="o_money2" name="o_money2" value="0" >
	  			<textarea rows="5"class="form-control" id="o_description2" name="o_description2"cols=""></textarea>
				<br>
			</div>
			<!-- option 끝 -->
			<div id="option_in3">
				<input type="text" class="form-control" id="o_money3" name="o_money3" value="0" >
	  			<textarea rows="5"class="form-control" id="o_description3" name="o_description3"cols=""></textarea>
				<br>
			</div>
			<!-- option 끝 -->
			<div id="option_in4">
				<input type="text" class="form-control" id="o_money4" name="o_money4" value="0" >
	  			<textarea rows="5"class="form-control" id="o_description4" name="o_description4"cols=""></textarea>
				<br>
			</div>
			<!-- option4 끝 -->
			<!-- </form> -->
  		</div>	  
	  	<div class="col-md-6 "></div>
	  </div>
	  
	  <div class="tab-pane" id="messages">

		
  		<div class="col-md-6 ">
  		<!-- <form id="project_form" action="" method="post"> -->
  			 프로젝트 동영상<br>
			<input type="hidden" id ="video" name="video" value="0">
			
			
			
  			<button type="button" class="btn btn-default btn-block" id="addvideo" name="addvideo"  data-toggle="modal" data-target="#modal3">업로드</button>
			<br>
			 에디터<br>
			
 			<textarea id="description" name="description" placeholder="Type your text here...">  </textarea>


			<br>
			 각오<br>
			
			<textarea rows="5"class="form-control" name="risk_and_challenge" id="risk_and_challenge" cols=""></textarea>
			<br>
			 프로필 사진<br>
			<input type="hidden" id ="profile_photo" name="profile_photo">
			<input type="hidden" id ="c_profile_photo" name="c_profile_photo" value="0">
			<button type="button" class="btn btn-default btn-block" id="profile_photo" name="profile_photo"  data-toggle="modal" data-target="#modal4">업로드</button>
			
			<br>
			 이름<br>
			<input type="text" class="form-control" id="team_name" name="team_name" placeholder="팀이름">
			
			<br>
			 소개<br>
			
			<textarea rows="5"class="form-control" name="team_Biography" id="team_Biography" cols=""></textarea>
			<br>
			 facebook<br>
			 <input type="text" class="form-control" id="facebook" name="facebook" placeholder="facebook"><br>
			
			<br>
			 website<br>
			
			 <input type="text" class="form-control" id="web_site" name="web_site" placeholder="website"><br>
			<br>
			 소통<br>
			<input type="hidden" id="email_check_input" value="0">
			<button type="button" style="display: none;" class="btn btn-default btn-block" id="contact_detail_email_button" name="contact_detail_email_button"  data-toggle="modal" data-target="#modal5">업로드</button>
			
			<div class="form-group">
			    
			    <input type="text" class="form-control contact_detail_email_input" id="contact_detail_email" name="contact_detail_email" placeholder="e-mail" >
			    <input type="button" class="form-control paulund_modal contact_detail_email_button btn-info" onclick="sendMail()" value="인증">
			</div>

			<input type="text" class="form-control" id="contact_detail_phone" name="contact_detail_phone" placeholder="phone"><br>
			<br>
			<input type="button" class="form-control paulund_modal contact_detail_email_button btn-info" value="미리보기" onclick="freeview()" style="float: left; margin-right: 220px;" >
			<input type="button" class="form-control paulund_modal contact_detail_email_button btn-info" value="완료" onclick="commit()" style="float: left;margin-right: 35px;">
			<input type="reset" class="form-control paulund_modal contact_detail_email_button btn-info" value="취소">
  		</div>
  		<div class="col-md-6 "></div>
	  </div>


	
</div>
</div>


<jsp:include page="../main/footer.jsp"></jsp:include>

</body>
</html>
<script>
			
			
			
			
			$('.demo6').supercal({

				
				transition: 'carousel-vertical',
				
				});
</script>



<script>
					
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

