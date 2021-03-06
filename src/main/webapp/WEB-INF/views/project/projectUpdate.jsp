<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업데이트</title>
<link rel="stylesheet" href="/resources/css/projectInfo.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="/resources/editor/css/froala_editor.min.css" rel="stylesheet" type="text/css">
<link href="/resources/editor/css/froala_style.min.css" rel="stylesheet" type="text/css">
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

   <script>
      $(function(){
        $('#description').editable({inlineMode: false})

        $('form').submit(function () {
          console.log($(this).find('textarea').val());
          return true;
        })
      });
  </script> 
<!-- 업데이트 아작스 -->
<script type="text/javascript">
$(document).ready(function(){
$("#upsubmit").click(function(){
	$.ajax({
		type : "POST",
		url : "/insertUpdate",
		data : {
			p_seq : <%=request.getParameter("seq")%>
			,seq : <%=request.getParameter("seq")%>
			,description : $('#description').val()
			
		},
		dataType : "html"
	}).done(function(returnData) {
		alert("등록되었습니다.");
		$(opener.document).find("#updateList").html(returnData);
		window.self.close();
	});
});
});
</script>
<script type="text/javascript">
$(document).ready(function(){
	$("#close").click(function(){
		window.self.close();
	});
});
</script>
</head>
<body>
<div align="center">
  <textarea id="description" name="description" placeholder="Type your text here...">  </textarea>
<input type="button" class="b-button js-submit-new-channel" id="upsubmit" name="upsubmit" value="등록">
<input type="button" class="b-button js-submit-new-channel" id="close" name="close" value="닫기">
</div>
</body>
</html>







