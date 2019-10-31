<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/14/014
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户新增页面</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/DataTables-1.10.18/css/jquery.dataTables.css">


    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/DataTables-1.10.18/js/jquery.dataTables.js"></script>
</head>
<body>
    <form action="/user/add.do" method="post">
        账号：<input type="text" name="userName"/><br/>
        真实姓名:<input type="text" name="realName"/><br/>
        密码：<input type="password" name="password"/><br/>
         <button type="submit" class="btn btn-primary">新增用户</button>
        <button type="reset" class="btn btn-info">重置信息</button>
    </form>
</body>
</html>
