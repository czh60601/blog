<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="rootUrl" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>404 Error Page</title>
	<!-- Font Awesome Icons -->
	<link rel="stylesheet" href="${rootUrl}/plugins/font-awesome/css/font-awesome.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="${rootUrl}/dist/css/adminlte.min.css">
  
	<!-- REQUIRED SCRIPTS -->
	
	<!-- jQuery -->
	<script src="${rootUrl}/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${rootUrl}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE -->
	<script src="${rootUrl}/dist/js/adminlte.js"></script>
	
	<!-- OPTIONAL SCRIPTS -->
	<script src="${rootUrl}/plugins/chart.js/Chart.min.js"></script>
	<script type="text/javascript" src="${rootUrl}/js/clipboard.min.js"></script>
	<script type="text/javascript" src="${rootUrl}/js/jquery.cookie.js"></script>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="#" class="brand-link">
      <img src="${rootUrl}/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">404 Error Page</span>
    </a>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" style="min-height: 892px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>404 Error Page</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item active">404 Error Page</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="error-page">
        <h2 class="headline text-warning"> 404</h2>

        <div class="error-content">
          <h3><i class="fa fa-warning text-warning"></i> 请求的页面或资源不存在。</h3>

          <p>
                                    您请求的页面或资源不存在,请点刷新重试。<br>
                                    刷新页面任然停留在这里,请 <a href="${rootUrl}/proxybill/index">返回首页</a>，感谢您使用本系统。
          </p>

          <form class="search-form">
            <div class="input-group">
              <input type="text" name="search" class="form-control" placeholder="Search">

              <div class="input-group-append">
                <button type="submit" name="submit" class="btn btn-warning"><i class="fa fa-search"></i>
                </button>
              </div>
            </div>
            <!-- /.input-group -->
          </form>
        </div>
        <!-- /.error-content -->
      </div>
      <!-- /.error-page -->
    </section>
    <!-- /.content -->
<%@ include file="../footer.jsp"%>
