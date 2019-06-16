<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var="kvItem" items="${treeMap}">
	<c:set var="treeItem" value="${kvItem.value}" scope="request" />
	<c:set var="resItem" value="${treeItem.resources}" scope="request" />
	<li style="list-style:${treeItem.children!=null?'disc':'circle'}">
		<div class="row">
			<div>
			<input id="res-check-${resItem.id}" name="resTree" type="checkbox" value="${resItem.id}" />
			<label for="res-check-${resItem.id}">[${resItem.typeStr}]${resItem.resname}</label>
			</div>
			
			<c:if test="${treeItem.children!=null}">
			<div style="margin-left:20px">
				<i class="fa fa-chevron-down" data-open-tag="true" onclick="toggleUL(${resItem.id},this)"></i>
			</div>
			</c:if>
		</div>
		<c:if test="${treeItem.children!=null}">
		<c:set var="treeMap" value="${treeItem.children}" scope="request" />
		<ul id="res-children-${resItem.id}">
			<c:import url="tree.jsp"/>
		</ul>
		</c:if>
	</li>
</c:forEach>