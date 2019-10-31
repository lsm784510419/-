<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/14/014
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>列表展示页面</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/DataTables-1.10.18/css/jquery.dataTables.css">


    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/DataTables-1.10.18/js/jquery.dataTables.js"></script>
</head>
<body>
<!-- 模态框（Modal） -->
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
    新增
</button>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>--%>
                <h4 class="modal-title" id="myModalLabel">
                    新增页面
                </h4>
                <div>
                    <form action="/user/add.do" method="post">
                        账号：<input type="text" name="userName"/><br/>
                        真实姓名:<input type="text" name="realName"/><br/>
                        密码：<input type="password" name="password"/><br/>
                        性别：<input type="radio" name="sex" value="0"/>女
                              <input type="radio" name="sex" value="1"/>男<br/>

                        年龄：<input type="text" name="age"/><br/>
                        电话：<input type="text" name="phone"/><br/>
                        邮箱：<input type="text" name="email"/><br/>
                        <button type="submit" class="btn btn-primary">新增用户</button>
                        <button type="reset" class="btn btn-info">重置信息</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>






<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>--%>
                <h4 class="modal-title" id="myModalLabel">
                    修改页面
                </h4>
                <div>
                    <form action="/user/update.do" method="post">
                        <input type="hidden" name="id" id="id"/>
                        账号：<input type="text" name="userName" id="userName"/><br/>
                        真实姓名:<input type="text" name="realName"id="realName"/><br/>
                        密码：<input type="password" name="password" id="password"/><br/>
                        性别：<input type="radio" name="sex" value="0"/>女
                        <input type="radio" name="sex" value="1" />男<br/>

                        年龄：<input type="text" name="age" id="age"/><br/>
                        电话：<input type="text" name="phone" id="phone"/><br/>
                        邮箱：<input type="text" name="email" id="email"/><br/>
                        <button type="submit" class="btn btn-primary">修改用户</button>
                        <button type="reset" class="btn btn-info">重置信息</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<table id="example" class="display table">
    <thead>
    <tr class="danger">
        <th>id</th>
        <th>账号</th>
        <th>真实姓名</th>
        <th>性别</th>
        <th>年龄</th>
        <th>电话</th>
        <th>邮箱</th>
        <th>操作</th>
    </tr>
    </thead>
</table>
    <script>
        //获取后台准备好的JSON数据
        var table;
        table= $('#example').DataTable( {
           /* "searching":false,//关闭全局搜索
            "ordering":false,//关闭排序*/
            "aLengthMenu":[2,5,10],//自定义每页展示条数
            "serverSide": true,//开启服务器分页模式
            language: {
                url:"/js/DataTables-1.10.18/Chinese.json"
            },
            ajax:{
                url:"<%=request.getContextPath()%>/user/queryList.do",
                type:"post",
            },
            columns: [
                { data: 'id' },
                { data: 'userName'},
                { data: 'realName'},
                { data: 'sex',
                    render:function (data,type,row,meta) {
                        return data==0?"女":"男";
                    }
                },
                { data: 'age'},
                { data: 'phone'},
                { data: 'email'},

                { data: "id",render:function(data,type,row,meta){
                        var upa='<button onclick="updateUser('+data+')" class="btn btn-info" data-toggle="modal" data-target="#myModal2">修改</button>';
                        var del='<button onclick="deleteUser('+data+')" class="btn btn-danger">删除</button>';

                        return del+upa;
                    }}
            ],
        } );

        function deleteUser(id) {
        location.href="<%=request.getContextPath()%>/user/delUser.do?id="+id;
        }
        function updateUser(id) {
            $.post({
                url:"<%=request.getContextPath()%>/user/toUpdate.do",
                dataType:"json",
                data:{
                    "id":id
                },
                success:function (datas) {
                    alert(JSON.stringify(datas))
                    $("#id").val(datas.id);
                    $("#userName").val(datas.userName);
                    $("#realName").val(datas.realName);
                    $("#password").val(datas.password);
                    if (datas.sex==1){
                        $("input[name='sex'][value='1']").attr("checked",true)
                    }
                    else {
                        $("input[name='sex'][value='0']").attr("checked",true)
                    }
                    $("#age").val(datas.age);
                    $("#phone").val(datas.phone);
                    $("#email").val(datas.email);
                },
                error:function () {
                    alert("回显信息失败")
                }
            })
        }
    </script>
</body>
</html>
