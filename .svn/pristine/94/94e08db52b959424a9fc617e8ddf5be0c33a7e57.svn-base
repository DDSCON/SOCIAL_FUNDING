<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${ !empty projects}">
<c:forEach var="projects" items="${projects}">
<hr>
<c:out value="${projects.description}" escapeXml="false"></c:out>
<div align="right"><font size="2"><c:out value="${projects.reg_date}" escapeXml="false"></font></c:out> 에 업데이트 되었습니다.</div>
</c:forEach>
</c:if> 