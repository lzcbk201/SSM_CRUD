<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/4
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工列表</title>
    <%
        request.setAttribute("path",request.getContextPath());
    %>
    <script type="text/javascript" src="${path}/static/js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" type="text/css"  href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap.css">
    <script TYPE="text/javascript" src="${path}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
</head>
<body>

<!-- 新增Modal -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="AddModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <%--empName输入--%>
                    <div class="form-group">
                        <label for="empName_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--Email输入--%>
                    <div class="form-group">
                        <label for="email_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_input" placeholder="Email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--gender输入--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_input" value="男" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_input" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <%--deptName选择--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId"></select>
                        </div>
                    </div>

                </form>
            </div>
            <%--提交--%>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_add_save">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 修改Modal -->
<div class="modal fade" id="empEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="EditModalLabel">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <%--empName输入--%>
                    <div class="form-group">
                        <label for="empName_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p name="empName" class="form-control-static" id="empName_edit_static" placeholder="empName">
                        </div>
                    </div>
                    <%--Email输入--%>
                    <div class="form-group">
                        <label for="email_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_edit" placeholder="Email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--gender输入--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_edit" value="男" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_edit" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <%--deptName选择--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId"></select>
                        </div>
                    </div>

                </form>
            </div>
            <%--提交--%>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_edit_save">保存</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <!--标题-->
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <!--按钮 -->
    <div class="row">
        <div class="col-md-12 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <!--查询信息 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_tables">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="check_all"></th>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <!--分页信息 -->
    <div class="row">
        <!--分页文字信息 -->
        <div class="col-md-6" id="page_info_area">

        </div>
        <!--分页条信息 -->
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>
</div>
</body>
</html>










<script type="text/javascript">
    //记录总记录数
    var totalRecord;
    var currentPage;
    //主函数
    $(function () {
        to_page(1);
    })

    //翻页
    function to_page(pn) {
        $.ajax({
            url:"${path}/emp",
            data:"pn="+pn,
            type:"get",
            success:function (result) {
                console.log(result);
                //解析数据
                build_emps_table(result);
                //解析分页信息
                biuld_page_info(result);
                //解析分页条
                biuld_page_nav(result);
            }
        })
    }

    //解析表格数据
    function build_emps_table(result) {
        //先清空
        $("#emps_tables tbody").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps,function (index,item) {
            var checkBox=$("<td><input type='checkbox' class='check_item'/></td>");
            var empIdTd=$("<td></td>").append(item.empId);
            var empNameTd=$("<td></td>").append(item.empName);
            var genderTd=$("<td></td>").append(item.gender);
            var emailTd=$("<td></td>").append(item.email);
            var deptNameTd=$("<td></td>").append(item.department.deptName);
            var EditBtn = $("<button></button>").addClass("btn btn-primary")
                .append($("<span></span>")).addClass("glyphicon glyphicon-pencil edit_btn").append("编辑").attr("edit_id",item.empId);
            var delBtn = $("<button></button>").addClass("btn btn-danger")
                .append($("<span></span>")).addClass("glyphicon glyphicon-trash delete_btn").append("删除").attr("delete_id",item.empId);
            var BtnTd = $("<td></td>").append(EditBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(checkBox).append(empIdTd).append(empNameTd)
                .append(genderTd).append(emailTd)
                .append(deptNameTd).append(BtnTd).appendTo("#emps_tables tbody");

        });
    }

    //解析分页信息
    function biuld_page_info(result) {
        $("#page_info_area").empty().append("当"+result.extend.pageInfo.pageNum+"前页,总"+result.extend.pageInfo.pages+"页,总"+result.extend.pageInfo.total+"条记录")
        totalRecord=result.extend.pageInfo.total;
        currentPage=result.extend.pageInfo.pageNum;
    }

    //解析分页条
    function biuld_page_nav(result) {
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
        ul.append(firstPageLi).append(prePageLi);
        firstPageLi.click(function () {
            to_page(1);
        })
        prePageLi.click(function () {
            to_page(result.extend.pageInfo.pageNum-1);
        })
        nextPageLi.click(function () {
            to_page(result.extend.pageInfo.pageNum+1);
        })
        lastPageLi.click(function () {
            to_page(result.extend.pageInfo.pages);
        })

        $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
            var numLi=$("<li></li>").append($("<a></a>").append(item));
            numLi.click(function () {
                to_page(item)
            })
            ul.append(numLi);
        })

        ul.append(nextPageLi).append(lastPageLi);
        var nav = $("<nav></nav>").append(ul);
        $("#page_nav_area").append(nav);
    }


    //全选/全不选
    $("#check_all").click(function () {
        $(".check_item").prop("checked",$(this).prop("checked"));
    })

    $(document).on("click",".check_item",function () {
        var flag = $(".check_item:checked").length==$(".check_item").length;
        $("#check_all").prop("checked",flag);
    })
    /*
       增删改查
     */



    //新增员工按钮事件
    $("#emp_add_modal_btn").click(function () {
        //表单重置
        reset_form("#empAddModal form");
        //获取部门信息
        getDepts("#empAddModal select");
        //弹出模态框
        $("#empAddModal").modal({
            backdrop:"static"
        });
        //(完整)重置表单
        function reset_form(element) {
            $(element)[0].reset();
            $(element).find("*").removeClass("has-error has-success");
            $(element).find(".help-block").text("");
        }


    })

    //员工名后端校验
    $("#empName_input").change(function () {
        var empName = this.value;
        $.ajax({
            url:"${path}/checkEmp",
            data:"empName="+empName,
            type:"POST",
            success:function (result) {
                if(result.code==100){
                    show_validate_msg("#empName_input","success","用户名可用(前端校验)");
                    $("#emp_add_save").attr("ajax-validate","success");
                }else{
                    show_validate_msg("#empName_input","error",result.extend.check_msg);
                    $("#emp_add_save").attr("ajax-validate","error");
                }
            }
        })
    })



    //保存员工事件
    $("#emp_add_save").click(function () {
        //校验
        if(!validate_add_form()){
            return false;
        }
        if ($(this).attr("ajax-validate")=="error"){
            return false;
        }
        //保存
        $.ajax({
            url:"${path}/emp",
            type:"POST",
            data:$("#empAddModal form").serialize(),
            success:function (result) {
                if (result.code==100){
                    //(成功)关闭模态框且显示尾页
                    $("#empAddModal").modal("hide");
                    to_page(totalRecord);
                }else{
                    //(失败)显示失败信息
                    // console.log(result);
                    if(result.extend.error.email!=undefined){
                        show_validate_msg("#email_input","error",result.extend.error.email)
                    }
                    if(result.extend.error.empName!=undefined){
                        show_validate_msg("#empName_input","error",result.extend.error.empName)
                    }
                }
            }
        })
    })

    //删除单个员工
    $(document).on("click",".delete_btn",function () {
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        var empId = $(this).attr("delete_id");
        if (confirm("确认删除'"+empName+"'吗?")){
            $.ajax({
                url:"${path}/emp/"+empId,
                type:"DELETE",
                success:function (result) {
                    to_page(currentPage);
                }

            })
        }
    })

    //批量删除员工
    $("#emp_delete_all_btn").click(function () {
        var empNames="";
        var del_ids="";
        $.each($(".check_item:checked"),function () {
            empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
            del_ids += $(this).parents("tr").find("td:eq(1)").text()+"-";
        })
        empNames = empNames.substring(0,empNames.length-1);
        if (confirm("确认删除'"+empNames+"'吗?")){
            $.ajax({
                url:"${path}/emp/"+del_ids,
                type:"DELETE",
                success:function (result) {
                    to_page(currentPage);
                }

            })
        }
    })

    //修改员工按钮事件  (创建之前就绑定)
    $(document).on("click",".edit_btn",function () {
        //获取员工信息
        getEmp($(this).attr("edit_id"));
        //获取部门信息
        getDepts("#empEditModal select");
        //弹出模态框
        $("#emp_edit_save").attr("edit_id",$(this).attr("edit_id"));
        $("#empEditModal").modal({
            backdrop:"static"
        });
    })

    //保存修改内容
    $("#emp_edit_save").click(function () {
        //邮箱校验
        var email = $("#email_edit").val();
        var regEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if(!regEmail.test(email)){
            show_validate_msg("#email_edit","error","邮箱格式不正确!!(前端校验)")
            return false;
        }else {
            show_validate_msg("#email_edit","success","");
        }

        //发送请求保存员工
        $.ajax({
            url:"${path}/emp/"+$(this).attr("edit_id"),
            type:"PUT",
            data:$("#empEditModal form").serialize(),
            success:function (result) {
                if (result.code==100){
                    $("#empEditModal").modal("hide");
                    //(成功)关闭模态框且显示尾页
                    //(失败)显示失败信息
                    // console.log(result);
                    to_page(currentPage);
                }else{
                    if(result.extend.error.email!=undefined){
                        show_validate_msg("#email_input","error",result.extend.error.email)
                    }
                    if(result.extend.error.empName!=undefined){
                        show_validate_msg("#empName_input","error",result.extend.error.empName)
                    }
                }
            }
        })
    })


    //表单提交时数据校验
    function validate_add_form() {
        // 用户名校验
        var empName = $("#empName_input").val();
        var regName = /(^[a-zA-Z0-9_-]{4,16}$)|(^[\u4E00-\u9FA5]{2,6})/;
        if(!regName.test(empName)){
            //alert("用户名可以是4-16位英文,或者2-6位中文!!");
            show_validate_msg("#empName_input","error","用户名可以是4-16位英文,或者2-6位中文!!(前端校验)")
            return false;
        }else {
            show_validate_msg("#empName_input","success","");
        }


        //邮箱校验
        var email = $("#email_input").val();
        var regEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if(!regEmail.test(email)){
            //alert("邮箱格式不正确!!");
            show_validate_msg("#email_input","error","邮箱格式不正确!!(前端校验)")
            return false;
        }else {
            show_validate_msg("#email_input","success","");
        }
        return true;
    }

    //获取员工信息
    function getEmp(id) {
        $.ajax({
            url:"${path}/emp/"+id,
            type:"GET",
            success:function (result) {
                //console.log(result);
                var empData = result.extend.emp;
                $("#empName_edit_static").text(empData.empName);
                $("#email_edit").val(empData.email);
                $("#empEditModal input[name=geder]").val([empData.gender]);
                $("#empEditModal select").val([empData.dId]);
            }

        })
    }


    //校验信息返回
    function show_validate_msg(element,status,msg) {
        $(element).parent().removeClass("has-success has-error");
        $(element).next("span").text("");
        if ("success"==status){
            $(element).parent().addClass("has-success");
            $(element).next("span").text(msg);
        }else if ("error"==status){
            $(element).parent().addClass("has-error");
            $(element).next("span").text(msg);
        }
    }

    //查询所有部门信息
    function getDepts(element) {
        $(element).empty();
        $.ajax({
            url:"${path}/depts",
            type:"get",
            success:function (result) {
                //console.log(result);
                $.each(result.extend.depts,function () {
                    var option = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                    option.appendTo(element);
                });
            }
        })
    }


</script>
