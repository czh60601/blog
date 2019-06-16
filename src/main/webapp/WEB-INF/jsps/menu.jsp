<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <c:set var="treeMenu" value="${rootMenu.children}" scope="request" />
          <c:set var="menutitle" value="${menu}.${title}" scope="application" />
          <c:import url="/WEB-INF/jsps/menu_tree.jsp"/>
          <li class="nav-item">
           <a href="${rootUrl}/proxybill/profile" class="nav-link ${menu=='index'&&title=='profile'?'active':''}">
             <i class="fa fa-user nav-icon"></i>
             <p>个人中心</p>
           </a>
          </li>
          <li class="nav-item">
           <a href="${rootUrl}/proxybill/logout" class="nav-link">
             <i class="fa fa-sign-out nav-icon"></i>
             <p>退出登录</p>
           </a>
          </li>
        </ul>
      </nav>