$(function () {
	$("#employee_employeeNo").validatebox({
		required : true, 
		missingMessage : '请输入用户名',
	});

	$("#employee_password").validatebox({
		required : true, 
		missingMessage : '请输入登录密码',
	});

	$("#employee_departmentObj_departmentId").combobox({
	    url:'Department/listAll',
	    valueField: "departmentId",
	    textField: "departName",
	    panelHeight: "auto",
        editable: false, //不允许手动输入
        required : true,
        onLoadSuccess: function () { //数据加载完毕事件
            var data = $("#employee_departmentObj_departmentId").combobox("getData"); 
            if (data.length > 0) {
                $("#employee_departmentObj_departmentId").combobox("select", data[0].departmentId);
            }
        }
	});
	$("#employee_name").validatebox({
		required : true, 
		missingMessage : '请输入姓名',
	});

	$("#employee_gender").validatebox({
		required : true, 
		missingMessage : '请输入性别',
	});

	$("#employee_birthDate").datebox({
	    required : true, 
	    showSeconds: true,
	    editable: false
	});

	$("#employee_telephone").validatebox({
		required : true, 
		missingMessage : '请输入联系电话',
	});

	//单击添加按钮
	$("#employeeAddButton").click(function () {
		//验证表单 
		if(!$("#employeeAddForm").form("validate")) {
			$.messager.alert("错误提示","你输入的信息还有错误！","warning");
			$(".messager-window").css("z-index",10000);
		} else {
			$("#employeeAddForm").form({
			    url:"Employee/add",
			    onSubmit: function(){
					if($("#employeeAddForm").form("validate"))  { 
	                	$.messager.progress({
							text : "正在提交数据中...",
						}); 
	                	return true;
	                } else {
	                    return false;
	                }
			    },
			    success:function(data){
			    	$.messager.progress("close");
                    //此处data={"Success":true}是字符串
                	var obj = jQuery.parseJSON(data); 
                    if(obj.success){ 
                        $.messager.alert("消息","保存成功！");
                        $(".messager-window").css("z-index",10000);
                        $("#employeeAddForm").form("clear");
                    }else{
                        $.messager.alert("消息",obj.message);
                        $(".messager-window").css("z-index",10000);
                    }
			    }
			});
			//提交表单
			$("#employeeAddForm").submit();
		}
	});

	//单击清空按钮
	$("#employeeClearButton").click(function () { 
		$("#employeeAddForm").form("clear"); 
	});
});
