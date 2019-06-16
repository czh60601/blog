<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>${projectName}</title>
	<link rel="shortcut icon" href="${rootUrl}/favicon.ico">
	<!-- bootstrap -->
	<link rel="stylesheet" href="${rootUrl}/plugins/bootstrap/css/bootstrap.min.css">
	<!-- Font Awesome Icons -->
	<link rel="stylesheet" href="${rootUrl}/plugins/font-awesome/css/font-awesome.min.css">
	<!-- select2 -->
	<link rel="stylesheet" href="${rootUrl}/plugins/select2/select2.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="${rootUrl}/dist/css/adminlte.min.css">
  
	<!-- REQUIRED SCRIPTS -->
	
	<!-- jQuery -->
	<script src="${rootUrl}/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${rootUrl}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<!-- OPTIONAL SCRIPTS -->
	<script src="${rootUrl}/plugins/chart.js/Chart.min.js"></script>
	<script type="text/javascript" src="${rootUrl}/js/clipboard.min.js"></script>
	<script type="text/javascript" src="${rootUrl}/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="${rootUrl}/js/auto-line-number.js"></script>
	<script type="text/javascript" src="${rootUrl}/js/laydate/laydate.js"></script>
	<script type="text/javascript" src="${rootUrl}/js/echarts.min.js"></script>
	<script type="text/javascript" src="${rootUrl}/plugins/select2/select2.full.min.js"></script>
	<!-- AdminLTE -->
	<script type="text/javascript" src="${rootUrl}/dist/js/adminlte.js"></script>
	<!-- qrcode.js -->
	<script type="text/javascript" src="${rootUrl}/js/jquery.qrcode.js"></script>
	<script type="text/javascript" src="${rootUrl}/js/md5.js"></script>
	<%-- 
	$(".textarea").setTextareaCount({
	   width 行号条的宽度，默认30px
		color 行号条的字体颜色，默认#FFF
		bgColor 行号条的背景颜色，默认#333
		display 行号条的类型，默认block
	}); 
	--%>
	<script type="text/javascript">
		// 对Date的扩展，将 Date 转化为指定格式的String
	    // 月(M)、日(d)、小时(H)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
	    // 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
	    Date.prototype.Format = function (fmt) { //author: meizz 
	        var o = {
	            "M+": this.getMonth() + 1, //月份 
	            "d+": this.getDate(), //日 
	            "H+": this.getHours(), //小时 
	            "m+": this.getMinutes(), //分 
	            "s+": this.getSeconds(), //秒 
	            "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
	            "S": this.getMilliseconds() //毫秒 
	        };
	        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	        for (var k in o)
	            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	        return fmt;
	    };
		function spaceDel(){
			var $obj = $(event.target);
			$obj.val($obj.val().replace(/\s/g,""));
		}
		var ResultEnum = {
				LOGOUT : -999,
				REBACKUP : -777,
				DEFAULT : -101,
				ERROR_INPUT : -5,
				EMPTY_INPUT : -4,
				SAME : -3,
				EXIST : -2,
				UNEXIST : -1,
				FAILED : 0,
				SUCCESS : 1,
				
				TYPE_SEARCH : "search",
				TYPE_ADD : "add",
				TYPE_INFO : "info",
				TYPE_DELETE : "delete",
				TYPE_UPDATE : "update",
				TYPE_REBACK : "reback"
			}
		function super_tips(result){
			var obj = result;
			
			if(result.constructor == "string".constructor){
				obj = eval("("+result+")");
			}
			
			if(obj.code==-999){
				alert(obj.msg);
				location.reload(true);
				return true;
			}
			
			return false;
		}
		function tips(result){
			if(!super_tips(result)){
				var obj = result;
				if(result.constructor == "string".constructor){
					obj = eval("("+result+")");
				}
				switch(obj.code){
					case ResultEnum.REBACKUP : alert("备份已恢复");break;
					case ResultEnum.DEFAULT : alert("服务器接收了但未处理,请检查参数输入是否正确,或者该功能还在开发中");break;
					case ResultEnum.ERROR_INPUT : alert("参数错误,请重新输入");break;
					case ResultEnum.EMPTY_INPUT : alert("参数为空,请输入必需内容");break;
					case ResultEnum.SAME : alert("与原数据相同,未做更改");break;
					case ResultEnum.EXIST : alert("对象已存在");break;
					case ResultEnum.UNEXIST : alert("对象不存在");break;
					case ResultEnum.FAILED : alert("处理失败,请重试");break;
					case ResultEnum.SUCCESS : alert("处理成功");break;
					default:alert(obj.msg?obj.msg:"状态异常请刷新重试");
				}
			}
		}
		function sleep(ms) {
		  return new Promise(resolve => setTimeout(resolve, ms));
		}
		//必须在函数前添加 async 然后在方法里用 await sleep(ms)调用sleep函数,其他方式无效，IE可能失效
		async function sleepDemo(){
			console.log(new Date().Format('YYYY-MM-dd HH:mm:ss'));
			await sleep(200);
			console.log(new Date().Format('YYYY-MM-dd HH:mm:ss'));
		}
		$(function(){
	    	$("input").on("blur",spaceDel);
		});
	</script>
	<style>
		.hidden{display:none;}
	</style>
</head>
<body class="sidebar-mini sidebar-collapse">
<div class="wrapper">