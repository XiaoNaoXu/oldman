<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.RoomType" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>房间添加</title>
<link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
<link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
<link href="<%=basePath %>plugins/animate.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body style="margin-top:70px;">
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
	<div class="col-md-12 wow fadeInLeft">
		<ul class="breadcrumb">
  			<li><a href="<%=basePath %>index.jsp">首页</a></li>
  			<li><a href="<%=basePath %>Room/frontlist">房间管理</a></li>
  			<li class="active">添加房间</li>
		</ul>
		<div class="row">
			<div class="col-md-10">
		      	<form class="form-horizontal" name="roomAddForm" id="roomAddForm" enctype="multipart/form-data" method="post"  class="mar_t15">
				  <div class="form-group">
					 <label for="room_roomNo" class="col-md-2 text-right">房间编号:</label>
					 <div class="col-md-8"> 
					 	<input type="text" id="room_roomNo" name="room.roomNo" class="form-control" placeholder="请输入房间编号">
					 </div>
				  </div> 
				  <div class="form-group">
				  	 <label for="room_roomTypeObj_typeId" class="col-md-2 text-right">房间类型:</label>
				  	 <div class="col-md-8">
					    <select id="room_roomTypeObj_typeId" name="room.roomTypeObj.typeId" class="form-control">
					    </select>
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="room_roomName" class="col-md-2 text-right">房间名称:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="room_roomName" name="room.roomName" class="form-control" placeholder="请输入房间名称">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="room_mainPhoto" class="col-md-2 text-right">房间主图:</label>
				  	 <div class="col-md-8">
					    <img  class="img-responsive" id="room_mainPhotoImg" border="0px"/><br/>
					    <input type="hidden" id="room_mainPhoto" name="room.mainPhoto"/>
					    <input id="mainPhotoFile" name="mainPhotoFile" type="file" size="50" />
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="room_price" class="col-md-2 text-right">房间价格:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="room_price" name="room.price" class="form-control" placeholder="请输入房间价格">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="room_roomDesc" class="col-md-2 text-right">房间详情:</label>
				  	 <div class="col-md-8">
							    <textarea name="room.roomDesc" id="room_roomDesc" style="width:100%;height:500px;"></textarea>
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="room_roomState" class="col-md-2 text-right">房间状态:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="room_roomState" name="room.roomState" class="form-control" placeholder="请输入房间状态">
					 </div>
				  </div>
		          <div class="form-group">
		             <span class="col-md-2""></span>
		             <span onclick="ajaxRoomAdd();" class="btn btn-primary bottom5 top5">添加</span>
		          </div> 
		          <style>#roomAddForm .form-group {margin:5px;}  </style>  
				</form> 
			</div>
			<div class="col-md-2"></div> 
	    </div>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include> 
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/lang/zh-cn/zh-cn.js"></script>
<script>
//实例化编辑器
var room_roomDesc_editor = UE.getEditor('room_roomDesc'); //房间详情编辑器
var basePath = "<%=basePath%>";
	//提交添加房间信息
	function ajaxRoomAdd() { 
		//提交之前先验证表单
		$("#roomAddForm").data('bootstrapValidator').validate();
		if(!$("#roomAddForm").data('bootstrapValidator').isValid()){
			return;
		}
		jQuery.ajax({
			type : "post",
			url : basePath + "Room/add",
			dataType : "json" , 
			data: new FormData($("#roomAddForm")[0]),
			success : function(obj) {
				if(obj.success){ 
					alert("保存成功！");
					$("#roomAddForm").find("input").val("");
					$("#roomAddForm").find("textarea").val("");
					room_roomDesc_editor.setContent("");
				} else {
					alert(obj.message);
				}
			},
			processData: false, 
			contentType: false, 
		});
	} 
$(function(){
	/*小屏幕导航点击关闭菜单*/
    $('.navbar-collapse a').click(function(){
        $('.navbar-collapse').collapse('hide');
    });
    new WOW().init();
	//验证房间添加表单字段
	$('#roomAddForm').bootstrapValidator({
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			"room.roomNo": {
				validators: {
					notEmpty: {
						message: "房间编号不能为空",
					}
				}
			},
			"room.roomName": {
				validators: {
					notEmpty: {
						message: "房间名称不能为空",
					}
				}
			},
			"room.price": {
				validators: {
					notEmpty: {
						message: "房间价格不能为空",
					},
					numeric: {
						message: "房间价格不正确"
					}
				}
			},
			"room.roomState": {
				validators: {
					notEmpty: {
						message: "房间状态不能为空",
					}
				}
			},
		}
	}); 
	//初始化房间类型下拉框值 
	$.ajax({
		url: basePath + "RoomType/listAll",
		type: "get",
		success: function(roomTypes,response,status) { 
			$("#room_roomTypeObj_typeId").empty();
			var html="";
    		$(roomTypes).each(function(i,roomType){
    			html += "<option value='" + roomType.typeId + "'>" + roomType.typeName + "</option>";
    		});
    		$("#room_roomTypeObj_typeId").html(html);
    	}
	});
})
</script>
</body>
</html>
