<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="./banner.jsp"%>
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">个人中心</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="${rootUrl}/proxybill/index">首页</a></li>
              <li class="breadcrumb-item active">个人中心</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    
    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">

            <!-- Profile Image -->
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                  <img class="profile-user-img img-fluid img-circle" src="${rootUrl}/dist/img/user2-160x160.jpg" alt="User profile picture">
                </div>
                <h3 class="profile-username text-center">${logUser.nickname}</h3>
                <p class="text-muted text-center">${logUser.roleName}</p>
                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>UID</b> <a class="float-right">${logUser.uid}</a>
                  </li>
                  <li class="list-group-item">
                    <b>用户名</b> <a class="float-right">${logUser.username}</a>
                  </li>
                </ul>
                <a href="${rootUrl}/proxybill/logout" class="btn btn-warning btn-block"><b>退出登录</b></a>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- About Me Box -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">About</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <!-- <strong><i class="fa fa-book mr-1"></i> Education</strong>
                <p class="text-muted">
                  B.S. in Computer Science from the University of Tennessee at Knoxville
                </p>
                <hr>
                <strong><i class="fa fa-map-marker mr-1"></i> Location</strong>
                <p class="text-muted">Malibu, California</p>
                <hr>
                <strong><i class="fa fa-pencil mr-1"></i> Skills</strong>
                <p class="text-muted">
                  <span class="tag tag-danger">UI Design</span>
                  <span class="tag tag-success">Coding</span>
                  <span class="tag tag-info">Javascript</span>
                  <span class="tag tag-warning">PHP</span>
                  <span class="tag tag-primary">Node.js</span>
                </p>
                <hr> -->
                <strong><i class="fa fa-file-text-o mr-1"></i> Notes</strong>
                <p class="text-muted">Welcome To Bill System.</p>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
          <div class="col-md-9">
            <div class="card">
              <div class="card-header p-2">
                <ul class="nav nav-pills">
                  <li class="nav-item"><a class="nav-link show ${tab=='pwd'?'active':''}" href="#card-password" data-toggle="tab">修改密码</a></li>
                  <li class="nav-item"><a class="nav-link show ${tab=='google'?'active':''}" href="#card-google" data-toggle="tab">Google身份验证器绑定</a></li>
                </ul>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
                  <div class="tab-pane ${tab=='pwd'?'active show':''}" id="card-password">
                    <form id="pwdEdit" class="form-horizontal" method="post">
					  <input type="hidden" name="tab" value="pwd"  />
                      <input type="hidden" value="pwdEdit" name="queryType" />
                      <div class="form-group">
                        <label for="oldpwd" class="col-sm-2 control-label">旧密码</label>
                    	<div class="row">
                        <div class="col-sm-6">
                          <input type="password" class="form-control" name="oldpwd" id="oldpwd" placeholder="请输入旧密码">
                        </div>
                        <div class="col-sm-4">
                          <span id="oldtips" class="badge badge-danger"></span>
                        </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="newpwd" class="col-sm-2 control-label">新密码</label>
                    	<div class="row">
                        <div class="col-sm-6">
                          <input type="password" class="form-control" name="newpwd" id="newpwd" placeholder="请输入新密码">
                        </div>
                        <div class="col-sm-3">
                          	<span id="newtips" class="badge badge-info">密码为6-32位,字符不限</span>
                        </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>
                    	<div class="row">
                        <div class="col-sm-6">
                          <input type="password" class="form-control" name="confirmpwd" id="confirmpwd" placeholder="请再次输入新密码">
                        </div>
                         <div class="col-sm-3">
                          	<span id="confirmtips" class="badge badge-info"></span>
                        </div>
                        </div>
                      </div>
					  <div class="form-group">
						<c:if test="${ret==1}"><span class="badge badge-success">修改成功</span></c:if>
						<c:if test="${ret==-4}"><span class="badge badge-danger">各项输入不能为空</span></c:if>
						<c:if test="${ret==-5}"><span class="badge badge-danger">两次密码不一致，请重新输入</span></c:if>
						<c:if test="${ret==0}"><span class="badge badge-danger">原密码错误,请重新输入</span></c:if>
					  </div>
                      <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                          <button type="button" onclick="doEdit()" class="btn btn-primary">提交</button>
                        </div>
                      </div>
                    </form>
                  </div>
                  <!-- /.tab-pane -->
                  <div class="tab-pane ${tab=='google'?'active show':''}" id="card-google">
                  <div class="row">
					<form id="google-key-set" class="form-horizontal col-4" style="border-right:1px solid #efefef;padding-right:5px;margin-right:5px;" method="post" onsubmit="return false">
					<input type="hidden" name="tab" value="google"  />
					<div class="form-group">
					  	<div id="googleQRCode" class="profile-user-img img-fluid" style="width: 140px;height:140px;"></div>
					</div>
					<div class="form-group">
					  	<label>用户名:</label>
					  	<label class="form-control">${logUser.username}</label>
					</div>
					<div class="form-group">
						<input type="hidden" name="googleKey" id="input-googleKey"  />
					  	<label>密   匙:</label>
					  	<label id="googleKey" class="form-control">${logUser.googleKey==null?'请点击按钮获取密匙':logUser.googleKey}</label>
					</div>
					<div class="form-group">
					  	<label for="googleCode">验证码:</label>
					  	<input id="googleCode" name="googleCode" class="form-control" placeholder="请输入6位验证码"/>
					</div>
					<div class="form-group row">
					  <div class="col-sm-offset-2 col-sm-5">
					    <button type="button" onclick="setGoogleKey()" class="btn btn-success">绑定</button>
					  </div>
					  <div class="col-sm-offset-2 col-sm-3">
						<span class="btn btn-info" onclick="getGoogleKey()">获取新密匙</span>
					  </div>
					</div>
					</form>
					<div class="col-7">
					<ul>
						<li style="list-style:none;">
						<div class="row">
							<div class="text-center col-6">
								<div id="download-android" class="profile-user-img img-fluid" style="width: 140px;height:140px;"></div>
	                			<h3 class="text-center" style="margin:5px;">Android</h3>
                			</div>
                			
							<div class="text-center col-6">
								<div id="download-ios" class="profile-user-img img-fluid" style="width: 140px;height:140px;"></div>
	                			<h3 class="text-center" style="margin:5px;">IOS</h3>
                			</div>
						</div>
						</li>
						<li style="list-style:none;">提示:</li>
						<li>在应用商店搜索<font color="green">Google Authenticator</font>,或者扫码下载</li>
						<li>打开Google身份验证器扫描左侧二维码绑定账号</li>
						<li>输入6位动态密码</li>
						<li>提交绑定</li>
						<li><a href="https://jingyan.baidu.com/article/59703552b7a0b48fc0074099.html" target="_blank">百度知道:Google身份验证器怎么用</a></li>
					</ul>
					</div>
				  </div>
                  </div>
                  <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.nav-tabs-custom -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
      <script type="text/javascript">
        var pwd = /[\s\S]{6,12}/;
		var qrcode = new QRCode(document.getElementById("googleQRCode"), {
							    text: "${logUser.googleKey==null?'请点击按钮获取密匙':logUser.googleKey}",
							    width: 128,
							    height: 128,
							    colorDark : "#000000",
							    colorLight : "#ffffff",
							    correctLevel : QRCode.CorrectLevel.H
							});
		new QRCode(document.getElementById("download-android"), {
								<%-- 更换端口时修改页面上的端口,管理地址和开放出去的代理是不同的端口. --%>
							    text: "<%=request.getScheme()+"://"+request.getServerName()+(request.getServerPort()!=80||request.getServerPort()!=443?":"+request.getServerPort():"") %>${rootUrl}/download/google_authenticator_5.0.apk",
							    width: 128,
							    height: 128,
							    colorDark : "#000000",
							    colorLight : "#ffffff",
							    correctLevel : QRCode.CorrectLevel.H
							});
		new QRCode(document.getElementById("download-ios"), {
							    text: "https://itunes.apple.com/cn/app/id388497605?mt=8",
							    width: 128,
							    height: 128,
							    colorDark : "#000000",
							    colorLight : "#ffffff",
							    correctLevel : QRCode.CorrectLevel.H
							});
		function changeDriver(obj,objId){
		console.log(objId)
			$(obj).parent("div").toggle('slow');
			$("#"+objId).parent("div").toggle('slow');
		}
      	function doEdit(){
      		if(!$("#oldpwd").val()){
      			$("#oldtips").text("旧的密码不能为空");
      			return;
      		}else{
      			$("#oldtips").text("");
      		}
      		if(!$("#newpwd").val()){
      			$("#newtips").text("旧的密码不能为空").removeClass("badge-info").addClass("badge-danger");
      			return;
      		}else{
      			$("#newtips").text("");
      		}
      		if(!pwd.test($("#newpwd").val())){
      			$("#newtips").text("请输入6-32位密码,字符不限").removeClass("badge-info").addClass("badge-danger");
      			return;
      		}else{
      			$("#newtips").text("");
      		}
      		if(!$("#confirmpwd").val()){
      			$("#confirmtips").text("请再次输入密码").removeClass("badge-info").addClass("badge-danger");
      			return;
      		}else{
      			$("#confirmtips").text("");
      		}
      		if($("#newpwd").val()!=$("#confirmpwd").val()){
      			$("#confirmtips").text("两次密码不一致请重新输入").removeClass("badge-info").addClass("badge-danger");
      			return;
      		}else{
      			$("#confirmtips").text("");
      		}
      		$("#oldpwd").val(hex_hmac_md5($("#oldpwd").val(),"${logUser.username}"));
      		$("#newpwd").val(hex_hmac_md5($("#newpwd").val(),"${logUser.username}"));
      		$("#confirmpwd").val(hex_hmac_md5($("#confirmpwd").val(),"${logUser.username}"));
      		$("#pwdEdit").submit();
      	}
      	
      	function getGoogleKey(){
			try{
	      		$.post("${rootUrl}/proxybill/googleKey",function(result){
	      			super_tips(result);
	      			if(result.code==1){
	      				qrcode.clear(); // 清除代码
						qrcode.makeCode(result.msg); // 生成另外一个二维码
	      				//$("#googleQRCode").attr("src",""+result.msg);
	      				$("#googleKey").text(result.data);
	      				$("#input-googleKey").val(result.data);
	      			}else{
	      				alert(result.msg);
	      			}
	      		}).fail(function(){
					alert("通讯异常,请刷新重试");
				});
			}catch(err){
				alert("通讯异常,请刷新重试");
				throw err;
			}
      	}
      	
      	function setGoogleKey(){
			try{
	      		$.post("${rootUrl}/proxybill/setGoogleKey",$("#google-key-set").serialize(),function(result){
	      			super_tips(result);
	      			alert(result.msg);
	      		}).fail(function(){
					alert("通讯异常,请刷新重试");
				});
			}catch(err){
				alert("通讯异常,请刷新重试");
				throw err;
			}
      	}
      </script>
    </div>
    <!-- /.content -->
<%@ include file="./footer.jsp"%>