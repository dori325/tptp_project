<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:parseNumber integerOnly="true" value="${count / 10 }" var="totalPage" />
<c:if test="${(count % 10) > 0 }">
	<c:set value="${totalPage + 1 }" var="totalPage" />
</c:if>
<c:if test="${page % 10 != 0 }">
	<fmt:parseNumber integerOnly="true" value="${page / 10 }" var="startPage" />
	<c:set value="${startPage * 10 + 1}" var="startPage" />
</c:if>
<c:if test="${page % 10 == 0 }">
	<c:set value="${page - 9 }" var="startPage" />
</c:if>
<c:set var="endPage" value="${startPage + 9 }" />
<c:if test="${startPage + 10 gt totalPage }">
	<c:set var="endPage" value="${totalPage }" />
</c:if>