<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../banner.jsp"%>
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">资源管理</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="${rootUrl}/background/index">首页</a></li>
              <li class="breadcrumb-item">权限管理</li>
              <li class="breadcrumb-item active">资源管理</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    
    <!-- Main content -->
    <div class="content">
    <form action="${rootUrl}/background/rbac/resources" method="post">
	  <input id="page" type="hidden" name="page" value="${query.page}" />
      <table class="table table-hover table-striped">
      	<thead>
      		<tr>
      			<th colspan="999">
      			<div class="input-group">
      				<div class="col-2">
                  	<input name="resname" class="form-control" value="${query.resname}" placeholder="请输入资源名">
                  	</div>
      				<div class="col-2">
					<input name="key" class="form-control" value="${query.key}" placeholder="请输入索引">
                  	</div>
      				<div class="col-2">
					<select name="type" class="form-control">
						<option value="0" ${query.type=='0'?'selected':''}>所有类型</option>
						<option value="1" ${query.type=='1'?'selected':''}>接口</option>
						<option value="2" ${query.type=='2'?'selected':''}>视图</option>
						<option value="3" ${query.type=='3'?'selected':''}>菜单</option>
						<option value="4" ${query.type=='4'?'selected':''}>页面</option>
						<option value="5" ${query.type=='5'?'selected':''}>操作</option>
					</select>
                  	</div>
      				<div class="col-2">
                    	<input class="btn btn-info" onclick="toPage(1)" type="submit" value="搜索" />
                    	<input class="btn btn-info" onclick="addNew()" type="button" value="增加" />
                  	</div>
				</div>
      			</th>
      		</tr>
      		<tr>
      			<td>ID</td>
      			<td>名称</td>
      			<td>索引<i class="fa fa-fw fa-question-circle" title="属于哪个页面的,用menu[.title]赋值"></i></td>
      			<td>类型<i class="fa fa-fw fa-question-circle" title="接口:后台请求无页面返回行url
视图:页面上细节数据展示控住
菜单:无页面返回型父节点菜单
页面:页面返回型菜单
操作:包含页面展示和后台地址"></i></td>
      			<td>值</td>
      			<td>地址</td>
      			<td>图标</td>
      			<td>父级<i class="fa fa-fw fa-question-circle" title="该资源包含在哪个父级资源里父级资源"></i></td>
      			<td>验证级别<i class="fa fa-fw fa-question-circle" title="登录验证/IP验证/角色验证"></i></td>
      			<c:if test="${logUser.hasItem('rbac.resources','edit')}">
      			<td>操作</td>
      			</c:if>
      		</tr>
      	</thead>
      	<tbody>
      		<c:forEach items="${query.content}" var="resItem">
      			<tr>
      				<td>${resItem.id}</td>
      				<td>${resItem.resname}</td>
      				<td>${resItem.key}</td>
      				<td>${resItem.typeStr}</td>
      				<td>${resItem.value}</td>
      				<td>${resItem.path}</td>
      				<td><i class="fa fa-fw ${resItem.ico}"></i></td>
      				<td>${resItem.flowname}</td>
      				<td>
      					<span class="badge-${resItem.logincheck?'success':'danger'}"><i class="fa fa-fw fa-${resItem.logincheck?'check':'close'}"></i></span>
      					<span class="badge-${resItem.ipcheck?'success':'danger'}"><i class="fa fa-fw fa-${resItem.ipcheck?'check':'close'}"></i></span>
      					<span class="badge-${resItem.rolecheck?'success':'danger'}"><i class="fa fa-fw fa-${resItem.rolecheck?'check':'close'}"></i></span>
      				</td>
      				<c:if test="${logUser.hasItem('rbac.resources','edit')}">
      				<td><input type="button" class="btn btn-sm btn-info" value="查看详情" onclick="getInfo(${resItem.id})"/></td>
      				</c:if>
      			</tr>
      		</c:forEach>
      	</tbody>
      	<tfoot>
			<tr>
				<td></td>
				<td></td>
				<td colspan="4">
				<input type="submit" class="btn btn-info btn-sm" onclick="toPage(1)" value="首页" />
				<input type="submit" class="btn btn-info btn-sm" onclick="toPage(${query.page-1>0?query.page-1:1})" value="上一页" />
				<span>${query.page}/${query.totalPages}</span>
				<input type="submit" class="btn btn-info btn-sm" onclick="toPage(${query.page+1<query.totalPages?query.page+1:query.totalPages})" value="下一页" />
				<input type="submit" class="btn btn-info btn-sm" onclick="toPage(${query.totalPages})" value="尾页" />
				</td>
			</tr>
		</tfoot>
      </table>
    </form>
    </div>
    <c:if test="${logUser.hasItem('rbac.resources','edit')}">
    <!-- /.content -->
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content card">
			<div class="overlay">
                <i class="fa fa-refresh fa-spin"></i>
            </div>
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">
					模态框（Modal）标题
				</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
			</div>
			<div class="modal-body">
				<form  id="edit-form" action="${rootUrl}/background/rbac/resources/edit" onsubmit="result false">
			  	<input type="hidden" id="edit-id" name="id"/>
			  	<input type="hidden" id="edit-queryType" name="queryType"/>
			  	<div class="form-group">
			  		<label for="edit-resname">资源名称 </label>
			  		<input type="text" id="edit-resname" name="resname" class="form-control"/>
			  	</div>
			  	<div id="row-origin" class="form-group">
			  		<label for="edit-key">索引 </label>
			  		<input type="text" id="edit-key" name="key" class="form-control"/>
			  	</div>
			  	<div class="form-group">
			  		<label for="edit-value">值</label>
			  		<input type="text" id="edit-value" name="value" class="form-control"/>
			  	</div>
			  	<div class="form-group">
			  		<label for="edit-path">地址</label>
			  		<input type="text" id="edit-path" name="path" class="form-control"/>
			  	</div>
			  	<div class="form-group">
			  		<label for="edit-type">类型</label>
			  		<select id="edit-type" name="type" class="form-control">
						<option value="0">请选择类型</option>
						<option value="1">接口</option>
						<option value="2">视图</option>
						<option value="3">菜单</option>
						<option value="4">页面</option>
						<option value="5">操作</option>
					</select>
			  	</div>
			  	<div class="form-group">
			  		<label for="edit-flow">父级</label>
			  		<select id="edit-flow" name="flow" class="form-control">
						<option value="0">无父级</option>
						<c:forEach var="resItem" items="${query.upres}">
						<option value="${resItem.id}">[${resItem.typeStr}]${resItem.resname}</option>
						</c:forEach>
					</select>
			  	</div>
			  	<div class="form-group">
			  		<label for="edit-ico">图标</label>
	              	<div class="input-group">
	                  	<input id="edit-ico" type="hidden" name="ico"/>
					</div>
			  	</div>
			  	<div class="form-group">
			  		<label for="edit-ico">验证级别</label>
	              	<div class="input-group">
	                    <span id="check-logincheck" class="btn btn-success" onclick="checkPower('logincheck')"><i class="fa fa-fw fa-check"></i></span>
	                  	<label class="input-group-text" for="check-login">登录</label>
	                  	<input id="edit-logincheck" type="checkbox" class="hide" name="logincheck"/>
	                    <span id="check-ipcheck" class="btn btn-success" onclick="checkPower('ipcheck')"><i class="fa fa-fw fa-check"></i></span>
	                  	<label class="input-group-text" for="check-ipcheck">IP</label>
	                  	<input id="edit-ipcheck" type="checkbox" class="hide" name="ipcheck"/>
	                    <span id="check-rolecheck" class="btn btn-success" onclick="checkPower('rolecheck')"><i class="fa fa-fw fa-check"></i></span>
	                  	<label class="input-group-text" for="check-rolecheck">角色</label>
	                  	<input id="edit-rolecheck" type="checkbox" class="hide" name="rolecheck"/>
					</div>
			  	</div>
			    </form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" onclick="doUpdate()" class="btn btn-primary">提交更改</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
	</div>
	<%@ include file="../ico.jsp"%>
	</c:if>
    <script type="text/javascript">
		function toPage(page){
			$("#page").val(page);
		}
		<c:if test="${logUser.hasItem('rbac.resources','edit')}">
		function modalShow(title,type){
			$(".overlay").hide();
			$("#edit-queryType").val(type);
			$("#myModalLabel").text(title);
			$("#myModal").modal('show');
		}
		
		function addNew(){
			$("#edit-resname").val("");
			$("#edit-key").val("");
			$("#edit-value").val("");
			$("#edit-path").val("");
			$("#edit-type").val(0);
			$("#edit-flow").val(0);
			$("#edit-ico").val("fa-circle-o")
			emojiUpdate(true);
			$("#edit-logincheck").prop("checked",false);
			checkPower("logincheck");
			$("#edit-ipcheck").prop("checked",false);
			checkPower("ipcheck");
			$("#edit-rolecheck").prop("checked",false);
			checkPower("rolecheck");
			modalShow("添加资源",ResultEnum.TYPE_ADD);
		}
		
		function doUpdate(){
			if(!$("#edit-resname").val()){
				alert("请输入资源名称");
				return;
			}
			if(!$("#edit-key").val()){
				alert("请输入索引");
				return;
			}
			if($("#edit-type").val()<1){
				alert("请选择类型");
				return;
			}
			try{
				$(".overlay").show();
				$.post($("#edit-form").attr("action"),$("#edit-form").serialize(),function(result){
					tips(result);
					if(result.code==ResultEnum.SUCCESS){
						$("#myModal").modal('hide');
					}
					$(".overlay").hide();
				}).fail(function(){
					$("#myModal").modal('hide');
					alert("通讯异常,请刷新重试");
				});
			}catch(err){
				$("#myModal").modal('hide');
				alert("通讯异常,请刷新重试");
				throw err;
			}
		}
		
		function getInfo(id){
			try{
				$.post($("#edit-form").attr("action"),"queryType=info&id="+id,function(result){
					if(result.code==ResultEnum.SUCCESS){
						var info = result.data;
						$("#edit-id").val(info.id);
						$("#edit-resname").val(info.resname);
						$("#edit-key").val(info.key);
						$("#edit-value").val(info.value);
						$("#edit-path").val(info.path);
						$("#edit-type").val(info.type);
						$("#edit-flow").val(info.flow);
						$("#edit-logincheck").prop("checked",!info.logincheck);
						checkPower("logincheck");
						$("#edit-ipcheck").prop("checked",!info.ipcheck);
						checkPower("ipcheck");
						$("#edit-rolecheck").prop("checked",!info.rolecheck);
						checkPower("rolecheck");
						$("#edit-ico").val(info.ico);
						emojiUpdate(false);
						modalShow("修改资源",ResultEnum.TYPE_UPDATE);
					}else{
						tips(result);
					}
				}).fail(function(){
					alert("通讯异常,请刷新重试");
				});
			}catch(err){
				alert("通讯异常,请刷新重试");
				throw err;
			}
		}
		
		function checkPower(type){
			var check = $("#edit-"+type).prop("checked");
			$("#edit-"+type).prop("checked",!check);
			if(check){
				//转为false
				$("#check-"+type).attr("class","btn btn-danger").children("i").attr("class","fa fa-fw fa-close");
			}else{
				//转为true
				$("#check-"+type).attr("class","btn btn-success").children("i").attr("class","fa fa-fw fa-check");
			}
		}
		
		emojiDialog("edit-ico");
		</c:if>
	</script>
<%@ include file="../footer.jsp"%>