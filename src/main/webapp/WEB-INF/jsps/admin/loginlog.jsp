<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../banner.jsp"%>
<!-- Content Header (Page header) -->
<div class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1 class="m-0 text-dark">登录日志</h1>
			</div>
			<!-- /.col -->
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item">
						<a href="${rootUrl}/proxybill/index">首页</a>
					</li>
					<li class="breadcrumb-item">日志管理</li>
					<li class="breadcrumb-item active">登录日志</li>
				</ol>
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<div class="content">
	<form id="search" action="${rootUrl}/background/log/login" method="post">
		<input id="queryType" type="hidden" name="queryType" />
		<input id="page" type="hidden" name="page" value="${query.page}" />
		<div>
			<div class="row">
			<div class="input-group">
	            <input type="text" class="form-control" name="username" value="${query.username}" placeholder="用户名" />
	            <input type="text" class="form-control" name="nickname" value="${query.nickname}" placeholder="昵称" />
				<input name="sdate" type="text" autocomplete="off" value="${query.sdate}" class="form-control layer-date" placeholder="开始日期" />
				<input name="edate" type="text" autocomplete="off" value="${query.edate}" class="form-control layer-date" placeholder="结束日期" />
				<select name="logtype" class="form-control">
					<option ${query.logtype==0?'selected':''} value="0">全部</option>
					<option ${query.logtype==1?'selected':''} value="1">成功</option>
					<option ${query.logtype==-5?'selected':''} value="-5">失败</option>
				</select>
				<span class="input-group-btn">
					<button class="btn btn-info btn-flat" onclick="toPage(1)">查询</button>
				</span>
           	</div>
		</div><!-- row -->
		</div>
		<div>
		<table class="table table-hover table-striped">
			<thead>
				<tr>
					<th>用户ID</th>
	    			<th>用户名</th>
	    			<th>昵称</th>
	    			<th>IP</th>
	    			<th>时间</th>
	    			<th>结果</th>
	    			<th>域名</th>
				</tr>
			</thead>
			<tbody class="table-bordered">
			<c:forEach var="logItem" items="${query.content}">
			<tr>
				<td>${logItem.uid}</td>
				<td>${logItem.username}</td>
				<td>${logItem.nickname}</td>
				<td>${logItem.logip}</td>
				<td>${logItem.logtime}</td>
				<td><span class="badge badge-${logItem.logtype==1?'success':'danger'}">${logItem.msg}</span></td>
				<td>${logItem.loginhost}</td>
   			</tr>
   			</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td></td>
					<td>${query.content.size()}/${query.counts}</td>
					<td colspan="4">
					<input type="button" class="btn btn-info btn-sm" onclick="toPage(1)" value="首页" />
					<input type="button" class="btn btn-info btn-sm" onclick="toPage(${query.page-1>0?query.page-1:1})" value="上一页" />
					<span>${query.page}/${query.totalPages}</span>
					<input type="button" class="btn btn-info btn-sm" onclick="toPage(${query.page+1<query.totalPages?query.page+1:query.totalPages})" value="下一页" />
					<input type="button" class="btn btn-info btn-sm" onclick="toPage(${query.totalPages})" value="尾页" />
					</td>
				</tr>
			</tfoot>
		</table>
		</div>
	</form>
</div>
<!-- /.content -->
<script>
	lay(".layer-date").each(function(){
	  laydate.render({
	    elem: this,
	    trigger: 'click',
	    type: 'datetime',
           format: 'yyyy-MM-dd HH:mm:ss',
           theme: '#393D49'
	  });
	});
   	
	function toPage(page){
		$("#page").val(page);
		$("#search").submit();
	}
</script>
<%@ include file="../footer.jsp"%>