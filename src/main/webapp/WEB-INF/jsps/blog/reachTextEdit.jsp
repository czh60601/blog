<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../banner.jsp"%>
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">首页</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="${rootUrl}/background/index">首页</a></li>
              <!--<li class="breadcrumb-item active">首页</li>-->
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <link rel="stylesheet" href="${rootUrl}/plugins/edit-md/css/editormd.min.css" />
    
    <!-- Main content -->
    <div class="content">
     <form id="edit-form" action="" method="POST">
      <div id="edit-editormd">
          <textarea style="display:none;"></textarea>
      </div>
      </form>
    </div>
      <script src="${rootUrl}/plugins/edit-md/editormd.min.js"></script>
        <script type="text/javascript">
			var testEditor;
			function showContent(content){
				testEditor = editormd("edit-editormd", {
                      width: "90%",
                      height: 740,
                      path : '${rootUrl}/plugins/edit-md/lib/',
                      markdown : content,
                      codeFold : true,
                      saveHTMLToTextarea : false, 
                      searchReplace : true,
                      htmlDecode : "style,script,iframe|on*", 
                      emoji : true,
                      taskList : true,
                      tocm            : true,         // Using [TOCM]
                      tex : true,                   // 开启科学公式TeX语言支持，默认关闭
                      flowChart : true,             // 开启流程图支持，默认关闭
                      sequenceDiagram : true,       // 开启时序/序列图支持，默认关闭,
                      imageUpload : true,
                      imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                      imageUploadURL : "http://www.local.cc/php/editor.md/examples/php/upload.php",
                      onload : function() {
                          console.log('onload', this);
                      }
               }); 
			}
            $(function() {
            	var pageId = null;
            	if(pageId){
            		$.post("${rootUrl}/page/getContent?pageId="+pageId,function(content){
            			showContent(content);
            		}).fail(function(){
            			showContent("请刷新页面重试");//TODO
            		});
            	}else{
                  showContent("");
                 }
            });
        </script>
    <!-- /.content -->
<%@ include file="../footer.jsp"%>