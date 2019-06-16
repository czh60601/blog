<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../banner.jsp"%>
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">系统用户管理</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="${rootUrl}/proxybill/index">首页</a></li>
              <li class="breadcrumb-item">账户管理</li>
              <li class="breadcrumb-item active">系统用户管理</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    
    <!-- Main content -->
    <div class="content">
    <div class="row">
    <div class="col-lg-12">
	  	<form id="list" action="${rootUrl}/background/user/sys/list" method="post">
	  	<input id="queryType" type="hidden" name="queryType" value="info"/>
	  	<input id="page" type="hidden" name="page" value="${query.page}" />
	    <table class="table table-hover table-striped">
	    	<thead>
	    		<tr>
	    			<c:if test="${logUser.hasItem('background.sys_user','del')}">
	    			<th>
	    				<c:if test="${delRow != null}"><span class="badge badge-danger">注销用户数:${delRow}</span></c:if>
	    			</th>
	    			</c:if>
	    			<th><input type="text" id="uid" class="form-control" value="${query.uid}" name="uid" placeholder="用户id"/></th>
	    			<th><input type="text" id="username" class="form-control" value="${query.username}" name="username" placeholder="用户名"/></th>
	    			<th><input type="text" id="nickname" class="form-control" value="${query.nickname}" name="nickname" placeholder="昵称"/></th>
	    			<th>
	    				<select id="role" name="role" class="form-control">
	    					<option value="" ${query.role==""?"selected":""}>所有角色</option>
	    				<c:forEach var="roleItem" items="${roleList}" >
	    					<option value="${roleItem.id}" ${query.role==roleItem.id?"selected":""}>${roleItem.rolename}</option>
	    				</c:forEach>
						</select>
	    			</th>
	    			<th colspan="3">
	    				<input type="submit" class="btn btn-primary btn-sm" onclick="search()" value="查询"/>
	    				<input type="button" class="btn btn-warning btn-sm" onclick="clearFomr()" value="重置"/>
	    				<c:if test="${logUser.hasItem('background.sys_user','edit')}">
	    				<input type="button" class="btn btn-info btn-sm" onclick="addNew();" value="添加"/>
	    				</c:if>
	    				<c:if test="${logUser.hasItem('background.sys_user','del')}">
	    				<input type="button" class="btn btn-danger btn-sm" onclick="deletes()" value="注销"/>
	    				</c:if>
	    			</th>
	    		</tr>
	    		<tr>
	    			<c:if test="${logUser.hasItem('background.sys_user','del')}">
	    			<th width="1%"><input type="checkbox" onclick="checkAll(this)"/></th>
	    			</c:if>
	    			<th width="10%">用户id</th>
	    			<th width="10%">用户名</th>
	    			<th width="10%">昵称</th>
	    			<th width="10%">角色</th>
	    			<th width="10%">状态</th>
	    			<th width="10%">信息</th>
	    			<c:if test="${logUser.hasItem('background.sys_user','edit')}">
	    			<th width="10%">功能</th>
	    			</c:if>
	    		</tr>
	    	</thead>
	    	<tbody>
	    		<c:forEach items="${query.content}" var="user">
	    		<tr>
	    			<c:if test="${logUser.hasItem('background.sys_user','del')}">
	    			<td><input type="checkbox" name="uids" value="${user.uid}"/></td>
	    			</c:if>
	    			<td>${user.uid}</td>
	    			<td>${user.username}</td>
	    			<td>${user.nickname}</td>
	    			<td>${user.roleName}</td>
	    			<td>
		    			<span class="badge badge-${user.status == 1?'success':'danger'}">${user.statusStr}</span>
	    			</td>
	    			<td>${user.info}</td>
	    			<c:if test="${logUser.hasItem('background.sys_user','edit')}">
	    			<td>
	    				<input type="button" onclick="getInfo(${user.uid})" class="btn btn-info" value="查看详情"/>
					</td>
					</c:if>
	    		</tr>
	    		</c:forEach>
	    	</tbody>
	    	<tfoot style="overflow-y: scroll;">
	    		<tr>
	    			<td></td>
	    			<td></td>
	    			<td></td>
	    			<td colspan="2">
	    				<input type="submit" class="btn btn-info btn-sm" onclick="toPage(1)" value="首页"/>
	    				<input type="submit" class="btn btn-info btn-sm" onclick="toPage(${query.page-1>0?query.page-1:1})" value="上一页"/>
	    				<span>${query.page}/${query.totalPages}</span>
	    				<input type="submit" class="btn btn-info btn-sm" onclick="toPage(${query.page+1<query.totalPages?query.page+1:query.totalPages})" value="下一页"/>
	    				<input type="submit" class="btn btn-info btn-sm" onclick="toPage(${query.totalPages})" value="尾页"/>
	    			</td>
	    		</tr>
	    	</tfoot>
	    </table>
	    </form>
    </div>
    <c:if test="${logUser.hasItem('background.sys_user','edit')}">
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
				<form autocomplete="off" id="edit" onsubmit="result false">
			  	<input type="hidden" id="edit-uid" name="uid"/>
			  	<input type="hidden" id="edit-queryType" name="queryType" value="add"/>
			  	<div class="form-group">
			  		<label for="edit-username">用户名 <input type="checkbox" onchange="allowEdit(this)" checked /></label>
			  		<input autocomplete="new-username" type="text" id="edit-username" name="username" class="form-control"/>
			  	</div>
			  	<div class="form-group">
			  		<label for="edit-nickname">昵称</label>
			  		<input type="text" id="edit-nickname" name="nickname" class="form-control"/>
			  	</div>
			  	<div class="form-group">
			  		<label for="edit-password">密码</label>
			  		<input autocomplete="new-password" type="password" id="edit-password" name="password" class="form-control"/>
			  	</div>
			  	<div class="form-group">
			  		<label for="edit-role">角色</label>
	   				<select id="edit-role" name="role" class="form-control">
						<option value="" selected>选择角色</option>
					<c:forEach var="roleItem" items="${roleList}" >
	   					<option value="${roleItem.id}">${roleItem.rolename}</option>
	   				</c:forEach>
					</select>
			  	</div>
			  	<div class="form-group">
			  		<div class="col-md-12">
			  		<label for="edit-info">信息</label>
			  		<textarea id="edit-info" name="info" class="form-control" rows="4" cols="5"></textarea>
				  	</div>
			  	</div>
			  	<div class="form-group">
				    <div class="col-md-12">
				    	<p id="edit-tips"></p>
			    	</div>
			    </div>
			    <div class="form-group">
			    	<ul>
			    		<li style="list-style: none;">说明</li>
			    		<li>账号,昵称,角色必填</li>
			    		<li><font color="red">如果不修改密码请留空</font></li>
			    		<li>昵称,用户名不能重复</li>
			    		<li>昵称最好是使用对应的名称,以便区分</li>
			    		<li>建议同一个<font color="red">充值代理</font>的多个账号,昵称格式<font color="red">某某某-几</font>,便于区分</li>
			    		<li><font color="red">主账号ID</font>为<font color="red">0</font>表示该账号为<font color="red">主账号</font></li>
			    	</ul>
			    </div>
			    </form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" onclick="saveUpdate()" class="btn btn-primary">提交更改</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
	</div>
    </div>
    </c:if>
    <script type="text/javascript">
    	function search(){
    		$("#page").val(1);
    		$("#queryType").val("search");
    	}
		
		<c:if test="${logUser.hasItem('background.sys_user','del')}">
		function deletes(){
			var ids = $("input[name='uids']:checked");
			if(ids.length){
				var ret = confirm("确定注销这"+ids.length+"个用户?");
				if(ret){
					$("#queryType").val("delete");
					$("#list").submit();
				}
			}else{
				alert("请勾选要注销的用户");
			}
		}

		function checkAll(obj){
			$("tbody input[type='checkbox']").prop("checked",$(obj).prop("checked"));
		}

   		$("tbody tr").click(function(event){
   			if(event.target.tagName.toUpperCase() != 'INPUT'){
    			var $ckbox = $(this).find("input[type='checkbox']");
    			$ckbox.prop("checked",!$ckbox.prop("checked"));
    			if($("input[name='uids']:not(:checked)").val()){
    				$("thead input[type='checkbox']").prop("checked",false);
    			}else{
    				$("thead input[type='checkbox']").prop("checked",true);
    			}
   			}
   		});
    	</c:if>
		
		function clearFomr(){
			$("#account").val("");
			$("#nickname").val("");
			$("#type").val("");
			$("#proxy").val("");
			$("#role").val(0);
			$("table input[type='checkbox']").prop("checked",false);
		}

		function toPage(page){
			$("#page").val(page);
		}
		<c:if test="${logUser.hasItem('background.sys_user','edit')}">
		async function modalShow(title,type){
			$(".overlay").hide();
			$("#edit-queryType").val(type);
			$("#myModalLabel").text(title);
			$("#myModal").modal('show');
			await sleep(200);
   			$("#edit-info").setTextareaCount({
			   bgColor: "none",
			   color: "blue",
			   display: "block"
			});
		}
		
    	function getInfo(id){
    		try{
	    		$.post("${rootUrl}/background/user/edit?uid="+id+"&queryType="+ResultEnum.TYPE_INFO,function(result){
					if(result.code==ResultEnum.SUCCESS){
		    			var userInfo = result.data;
		    			$("#edit-uid").val(userInfo.uid);
		    			$("#edit-username").val(userInfo.username);
		    			$("#edit-nickname").val(userInfo.nickname);
		    			$("#edit-queryType").val('update');
		    			$("#edit-role").val(userInfo.role);
		    			$("#edit-info").val(userInfo.info);
		    			$("#edit-tips").text("");
		    			$("#edit-password").val("");
		    			$("#edit-refresh").hide();
		    			$("#edit-reload").show();
		    			if($("#edit input[type=checkbox]").prop("checked")){
		    				$("#edit input[type=checkbox]").click();
		    			}
						modalShow("修改信息",ResultEnum.TYPE_UPDATE);
					}else{
						tips(result);
					}
	    		}).fail(function(){
					alert("通讯异常,请重试");
				});
			}catch(err){
				alert("通讯异常,请重试");
				throw err;
			}
    	}
    	
    	//更新
    	function saveUpdate(){
    		if(!$("#edit-username").val()){
    			$("#edit-tips").text("用户名不能为空").removeClass().addClass("badge badge-danger");
    			return;
    		}
    		if(!$("#edit-nickname").val()){
    			$("#edit-tips").text("昵称不能为空").removeClass().addClass("badge badge-danger");
    			return;
    		}
    		if(!$("#edit-role").val()){
    			$("#edit-tips").text("角色不能为空").removeClass().addClass("badge badge-danger");
    			return;
    		}
    		if($("#edit-password").val()){
    			if($("#edit-password").val().length<6||$("#edit-password").val().length>32){
    				$("#edit-tips").text("请输入6-32位密码").removeClass().addClass("badge badge-danger");
    				return;
    			}
    			$("#edit-password").val(hex_hmac_md5($("#edit-password").val(),$("#edit-username").val()));
    		}
    		try{
    			$(".overlay").show();
				$.post("${rootUrl}/background/user/edit",$("#edit").serialize(),function(result){
	    			tips(result);
					if(result.code==ResultEnum.SUCCESS){
						$("#myModal").modal('hide');
					}
					$(".overlay").hide();
	    		}).fail(function(){
					alert("通讯异常,请重试");
					$(".overlay").hide();
					if($("#edit-password").val()){
		    			$("#edit-password").val("");
		    		}
				});
			}catch(err){
				alert("通讯异常,请重试");
				$(".overlay").hide();
				if($("#edit-password").val()){
	    			$("#edit-password").val("");
	    		}
				throw err;
			}
		}
    	
		function addNew(){
			$("#edit-uid").val("");
   			$("#edit-username").val("");
   			$("#edit-nickname").val("");
    		$("#edit-password").val("");
   			$("#edit-queryType").val('add');
   			$("#edit-info").val("");
   			$("#edit-role").val("");
   			$("#edit-reload").hide();
   			$("#edit-refresh").show();
   			if(!$("#edit input[type=checkbox]").prop("checked")){
    				$("#edit input[type=checkbox]").click();
    			}
			modalShow("添加用户",ResultEnum.TYPE_ADD);
		}
		
		function allowEdit(obj){
			$("#edit-username").prop("readonly",!$(obj).prop("checked"));
		}
		</c:if>
    </script>
    </div>
    <!-- /.content -->
<%@ include file="../footer.jsp"%>
