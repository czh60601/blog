<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../banner.jsp"%>
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">角色管理</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="${rootUrl}/proxybill/index">首页</a></li>
              <li class="breadcrumb-item">权限管理</li>
              <li class="breadcrumb-item active">角色管理</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <style>
    .outer-container,.ulcontent {
	    height: 550px;
	}
	.outer-container {
	    position: relative;
	    overflow: hidden;
	}
	.inner-container {
	    position: absolute; left: 0;
	    overflow-x: hidden;
	    overflow-y: scroll;
	}
	
	 /* for Chrome */
	.inner-container::-webkit-scrollbar {
	    display: none;
	}
    </style>
    <!-- Main content -->
    <div class="content">
      <div class="row">
      <c:if test="${logUser.hasItem('rbac.role','edit')}">
      <div class="col-3">
      	<!-- Profile Image -->
		<div class="card card-primary card-outline">
		  <div class="card-body box-profile">
		  	<h4>资料修改</h4>
		  	<hr>
		  	<form id="info-form">
			  	<div class="form-group">
			  		<label>ID</label>
			  		<input id="info-id" type="text" name="id" readonly class="form-control" />
			  	</div>
		  		<div class="form-group">
			  		<label>角色名</label>
			  		<input id="info-rolename" type="text" name="rolename" class="form-control" />
			  	</div>
		  		<div class="form-group">
			  		<label>信息</label>
			  		<input id="info-info" type="text" name="info" class="form-control" />
			  	</div>
		  		<div class="form-group">
			  		<label>上级角色</label>
			  		<select id="info-parent" name="parent" class="form-control">
			  			<c:forEach var="roleItem" items="${roleList}">
			  			<option value="${roleItem.id}">${roleItem.rolename}</option>
			  			</c:forEach>
			  		</select>
			  	</div>
			  	<div class="form-group">
			  		<label for="info-family">家族树</label>
			  		<select id="info-family" name="family"class="form-control select2" multiple="multiple" data-placeholder="设置家族树，用于子集查询" >
						<c:forEach var="roleItem" items="${roleList}">
			  			<option value="${roleItem.id}">${roleItem.rolename}</option>
			  			</c:forEach>
					</select>
			  	</div>
			  	<div class="input-group">
			  		<span id="check-admin" class="btn btn-success" onclick="checkPower('admin')"><i class="fa fa-fw fa-check"></i></span>
                  	<label class="input-group-text" for="check-admin">是否管理员<i class="fa fa-fw fa-question-circle" title="管理员要验证白名单"></i></label>
                  	<input id="edit-admin" type="checkbox" name="admin" class="hidden" />
			  	</div>
		  	</form>
		  	<hr>
		  	<div class="form-group">
		  		<div class="offset-10 col-2">
		  		<input type="button" class="btn btn-primary" onclick="doRoleUpdate(ResultEnum.TYPE_UPDATE,'info')" value="保存" />
		  		</div>
		  	</div>
		  </div>
		  <!-- /.card-body -->
		</div>
		<!-- /.card -->
      </div>
      </c:if>
      <c:if test="${logUser.hasItem('rbac.role','fkset')}">
      <div class="col-4">
      	<!-- Profile Image -->
		<div class="card card-primary card-outline">
		  <div class="card-body box-profile">
		  	<h4>权限管理</h4>
		  	<hr>
		  	<form id="tree-form">
		  	<div class="outer-container">
		  	<div class="inner-container col-12">
		  	<ul class="ulcontent">
		  		<c:if test="${rootTree!=null}">
		  		<c:set var="treeMap" value="${rootTree.children}" scope="request" />
		  		<c:import url="tree.jsp"/>
		  		</c:if>
		  		<li style="color:#fff;"><!-- 用于解决最后一项显示不全的问题,误删 --></li>
		  	</ul>
		  	</div>
		  	</div>
		  	</form>
		  	<hr>
			<c:if test="${logUser.hasItem('rbac.role','fkset')}">
		  	<div class="form-group">
		  		<div class="offset-10 col-2">
		  		<input type="button" class="btn btn-primary" onclick="fkSet()" value="保存" />
		  		</div>
		  	</div>
		  	</c:if>
		  </div>
		  <!-- /.card-body -->
		</div>
		<!-- /.card -->
      </div>
      </c:if>
      <div class="col-5">
      	<!-- Profile Image -->
		<div class="card card-primary card-outline">
		  <div class="card-body box-profile">
		    <table class="table table-hover table-striped">
		    	<thead>
		    		<tr>
		    			<th colspan="999">
		    			<form action="${rootUrl}/background/rbac/role" method="post">
		    			<div class="offset-7 col-5">
      						<c:if test="${logUser.hasItem('rbac.role','edit')}">
			                <input type="button" class="btn btn-info" value="新增" onclick="addNew()" />
			                </c:if>
							<input type="submit" class="btn btn-primary" value="刷新"/>
							<c:if test="${logUser.hasItem('rbac.role','reinit')}">
							<a href="${rootUrl}/background/rbac/role/reinit" target="_blank" class="btn btn-warning">权限重载</a>
							</c:if>
		              	</div>
		              	</form>
		    			</th>
		    		</tr>
		    		<tr>
		    			<th width="10%">ID</th>
		    			<th width="20%">角色名</th>
		    			<th width="20%">角色</th>
		    			<th width="20%">是否管理员</th>
      					<c:if test="${logUser.hasItem('rbac.role','edit')}">
		    			<th width="20%">操作</th>
		    			</c:if>
		    		</tr>
		    	</thead>
	    	 </table>
		    <div style="overflow-y: scroll;height: 600px">
		    <table class="table table-hover table-striped">
		    	<tbody>
		    		<c:forEach var="roleItem" items="${roleList}">
		    			<tr>
			    			<td width="10%">${roleItem.id}</td>
			    			<td width="20%">${roleItem.rolename}</td>
			    			<td width="20%">${roleItem.pname}</td>
			    			<td width="20%"><span class="badge badge-${roleItem.admin?'success':'info'}">${roleItem.admin?"是":"否"}</span></td>
      						<c:if test="${logUser.hasItem('rbac.role','edit')}">
			    			<td width="20%"><span class="btn btn-sm btn-info" onclick="getInfo(${roleItem.id})">查看详情</span></td>
			    			</c:if>
			    		</tr>
		    		</c:forEach>
		    	</tbody>
		    </table>
		  </div>
		  </div>
		  <!-- /.card-body -->
		</div>
		<!-- /.card -->
      </div>
      </div>
    </div>
    <!-- /.content -->
    <c:if test="${logUser.hasItem('rbac.role','edit')}">
    <!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content card">
			<div class="overlay">
                <i class="fa fa-refresh fa-spin"></i>
            </div>
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">
					新增角色
				</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
			</div>
			<div class="modal-body">
				<form  id="edit-form">
			  	<div class="form-group">
			  		<label for="edit-rolename">角色名 </label>
			  		<input type="text" id="edit-rolename" name="rolename" class="form-control"/>
			  	</div>
			  	<div class="form-group">
			  		<label for="edit-parent">上级角色</label>
			  		<select id="edit-parent" name="parent" class="form-control">
						<c:forEach var="roleItem" items="${roleList}">
						<option value="${roleItem.id}">${roleItem.rolename}</option>
						</c:forEach>
					</select>
			  	</div>
			  	<div class="form-group">
			  		<label for="edit-info">信息 </label>
			  		<input type="text" id="edit-info" name="info" class="form-control"/>
			  	</div>
			  	<div class="input-group">
			  		<span id="check-admin-add" class="btn btn-success" onclick="checkPower('admin-add')"><i class="fa fa-fw fa-check"></i></span>
                  	<label class="input-group-text" for="check-admin">是否管理员<i class="fa fa-fw fa-question-circle" title="管理员要验证白名单"></i></label>
                  	<input id="edit-admin-add" type="checkbox" name="admin" class="hidden" checked="checked" />
			  	</div>
			    </form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" onclick="doRoleUpdate(ResultEnum.TYPE_ADD,'edit')" class="btn btn-primary">提交更改</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
	</div>
	</c:if>
    <script type="text/javascript">
    	$('.select2').select2();
		<c:if test="${logUser.hasItem('rbac.role','edit')}">
		function checkPower(type){
			var check = $("#edit-"+type).prop("checked");
			if(check){
				$("#edit-"+type).prop("checked",false);
				//转为false
				$("#check-"+type).attr("class","btn btn-danger").children("i").attr("class","fa fa-fw fa-close");
			}else{
				$("#edit-"+type).prop("checked",true);
				//转为true
				$("#check-"+type).attr("class","btn btn-success").children("i").attr("class","fa fa-fw fa-check");
			}
		}
		<c:if test="${logUser.hasItem('rbac.role','fkset')}">
		function toggleUL(id,obj){
			$("#res-children-"+id).toggle();
			var tag = $(obj).attr("data-open-tag");
			if(tag == "true"){
				$(obj).attr("class","fa fa-chevron-left");
				$(obj).attr("data-open-tag",false);
			}else{
				$(obj).attr("class","fa fa-chevron-down");
				$(obj).attr("data-open-tag",true);
			}
		}
		
		function fkSet(){
			if($("#info-id").val()){
				try{
					$.post("${rootUrl}/background/rbac/role/fkset?roleId="+$("#info-id").val(),$("#tree-form").serialize(),function(result){
						tips(result);
					}).fail(function(){
						alert("通讯异常,请刷新重试");
					});
				}catch(err){
					alert("通讯异常,请刷新重试");
					throw err;
				}
			}else{
				alert("请选择角色")
			}
		}
		</c:if>
		function doRoleUpdate(type,objId){
			if($("#"+objId+"-rolename").val()){
				if($("#"+objId+"-parent").val()){
					try{
						$(".overlay").show();
						$.post("${rootUrl}/background/rbac/role/edit?queryType="+type,$("#"+objId+"-form").serialize(),function(result){
							tips(result);
							if(result.code==ResultEnum.SUCCESS){
								$(".overlay").hide();
								$("#myModal").modal('hide');
							}else{
								$(".overlay").hide();
							}
						}).fail(function(){
							$(".overlay").hide();
							alert("通讯异常,请刷新重试");
						});
					}catch(err){
						$(".overlay").hide();
						alert("通讯异常,请刷新重试");
						throw err;
					}
				}else{
					alert("请选择上级角色");
				}
			}else{
				alert("请输入角色名");
			}
		}
		
		function addNew(){
			$(".overlay").hide();
			$("#myModal").modal('show');
			$("#edit-rolename").val("");
			$("#edit-parent").val("${logRole.id}");
			$("#edit-info").val("");
			$("#edit-admin-add").prop("checked",false);
			checkPower("admin-add");
		}
		
		function getInfo(id){
			try{
				$.post("${rootUrl}/background/rbac/role/edit?queryType="+ResultEnum.TYPE_INFO+"&id="+id,function(result){
					if(result.code==ResultEnum.SUCCESS){
						var info = result.data;
						$("#info-id").val(info.id);
						$("#info-rolename").val(info.rolename);
						$("#info-info").val(info.info);
						$("#info-parent").val(info.parent);
						$("#info-family").val(info.familyList).trigger('change');
						$("#edit-admin").prop("checked",!info.admin);
						checkPower("admin");
						$("input[name=resTree]").prop("checked",false);
						for(var item in info.Reslist){
							$("#res-check-"+info.Reslist[item]).prop("checked",true);
						}
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
		</c:if>
	</script>
<%@ include file="../footer.jsp"%>