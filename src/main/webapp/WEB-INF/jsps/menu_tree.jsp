<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var="kvItem" items="${treeMenu}">
	<c:set var="treeItem" value="${kvItem.value}" scope="request" />
	<c:set var="resItem" value="${treeItem.resources}" scope="request" />
	<li class="nav-item ${treeItem.children!=null?'has-treeview':''} ${resItem.key==menu?'menu-open':''}">
		<a href="${resItem.path==null||resItem.path==''?'#':rootUrl}${resItem.path}" class="nav-link ${resItem.key==menutitle?'active':''}">
	        <i class="nav-icon fa ${resItem.ico}"></i>
	        <p>
	        	${resItem.resname}
	        <c:if test="${treeItem.children!=null}">
	          <i class="fa fa-angle-left right"></i>
	        </c:if>
	        </p>
		</a>
	<c:if test="${treeItem.children!=null}">
	<c:set var="treeMenu" value="${treeItem.children}" scope="request" />
	<ul class="nav nav-treeview">
		<c:import url="/WEB-INF/jsps/menu_tree.jsp"/>
	</ul>
	</c:if>
	</li>
</c:forEach>