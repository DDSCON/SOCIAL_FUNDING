<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
.up_del a:hover {
text-decoration:none;
color: #000;
}
</style>
	
<script type="text/javascript">

	function showCommentTA(idx){
		$('.up_comment').filter(function(index){
			return index == idx;
		}).toggle();
	}
	
	function delComment(d_seq) {
		if (confirm("삭제하시겠습니까?") == false) {
			return false;
		}
		$.ajax({
			type : "POST",
			url : "/deleteComment",
			data : {
				d_seq : d_seq,
				p_seq :<%=request.getParameter("seq")%>
				,seq :<%=request.getParameter("seq")%>
	},
			dataType : "html"
		}).done(function(returnData) {
			alert("삭제되었습니다.");
			$("#commentList").html(returnData);

		});
	}
	
	
	
	function upComment(d_seq,idx) {
		if (confirm("수정하시겠습니까?") == false)
			return false;
		$.ajax({
			type : "POST",
			url : "/updateComment",
			data : {
				d_seq : d_seq,
				update_comment : $('.u_comment').filter(function(index){
					return index == idx;
				}).val()
				,seq : <%=request.getParameter("seq")%>
	},
			dataType : "html"
		}).done(function(msg) {
			$("#commentList").html(msg);

		});
	}

</script>

<c:if test="${ !empty comments}">
	<c:forEach var="comments" items="${comments}" varStatus="status">
<div class="container">
<div class="row">
	<div class="col-md-10 col-md-push-2" style="
    padding-top: 57px;
">
		<c:out value="${comments.m_name}"></c:out>
		<c:out value="${comments.reg_date}"></c:out>
		
		<c:if test="${ comments.m_name eq sessionScope.name}">
			<span class="up_del" >
				<a href="javascript:showCommentTA('${status.index}')" >수정</a>	
				<a href="javascript:delComment('${comments.d_seq}')" >삭제</a>
			</span> 
		</c:if>
		
		<div class="up_comment" style="display:none">
		<textarea  class="[ form-field ] ui-textarea js-textarea-for-new-channel u_comment"   wrap="hard" name="u_comment" id="u_comment" placeholder="<c:out value="${comments.update_comment}"></c:out>" rows="3" style="
    width: 489px;
"/></textarea>
		<a href="javascript:upComment('${comments.d_seq}','${status.index}')" class="b-button js-submit-new-channel" id="zbutton">수정</a>
		</div>
      <div class="text-size_xs">
       <pre style="width: 489px;" class="[ form-field ] ui-textarea"> 
       	<p><c:out value="${comments.update_comment}"></c:out></p>
       </pre>
      </div> 
	</div>
	<div class="col-md-2 col-md-pull-10" style="
    padding-top: 79px;
    padding-left: 42px;
">
		<img alt="Avatar_9_medium" class="b-avatar__pic" src="/resources/images/profile.JPG" />
	</div>
</div>
</div>

		</form>
  	</c:forEach>
</c:if> 
