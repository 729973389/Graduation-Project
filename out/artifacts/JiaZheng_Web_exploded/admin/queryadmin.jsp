<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%><%@ taglib prefix="c"
                                                                               uri="http://java.sun.com/jsp/jstl/core"%><jsp:include page="check_logstate.jsp"></jsp:include>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%><!doctype html>
<html lang="zh_CN">
<head>
    <base href="<%=basePath%>" />
    <title>欢迎使用后台管理系统</title>
    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">
    <script src="lib/jquery-1.11.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
    <link rel="stylesheet" type="text/css" href="stylesheets/premium.css">
</head>
<body class=" theme-blue">
<div class="content">
    <div class="header">
        <h1 class="page-title">管理用户信息列表</h1>
    </div>
    <div class="main-content">
        <table class="table">
            <thead>
            <tr><%--列表名称--%>
                <th class="text-center">用户名</th>
                <th class="text-center">密码</th>
                <th class="text-center">姓名</th>
                <th class="text-center">联系方式</th>
                <th class="text-center">角色</th>
                <th class="text-center">创建日期</th>
                <th class="text-center">操作</th>
            </tr>
            </thead>
            <c:forEach items="${adminList}" var="admin">
                <tr align="center">
                    <td class="center">${admin.username}</td>
                    <td class="center">${admin.password}</td>
                    <td class="center">${admin.realname}</td>
                    <td class="center">${admin.contact}</td>
                    <td class="center">${admin.role}</td>
                    <td class="center">${admin.addtime}</td>
                    <td>
                        <a href="admin/getAdminById.action?id=${admin.adminid}"><i class="fa fa-pencil"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="admin/deleteAdmin.action?id=${admin.adminid}" onclick="{if(confirm('确定要删除吗?')){return true;}return false;}">
                            <i class="fa fa-trash-o"></i></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <ul class="pagination">
            <li>
                <form action="admin/queryAdminByCond.action" name="myform" method="post">
                    <label>查询条件: <select name="cond" style="width: 100px">
                        <option value="username">按用户名查询</option>
                        <option value="password">按密码查询</option>
                        <option value="realname">按姓名查询</option>
                        <option value="contact">按联系方式查询</option>
                        <option value="role">按角色查询</option>
                        <option value="addtime">按创建日期查询</option>
                    </select>
                    </label>&nbsp;&nbsp;&nbsp; <label>关键字: <input type="text" name="name" required style="width: 100px" /></label>&nbsp;&nbsp;&nbsp;
                    <label><input type="submit" value="查询" class="mws-button green" /> </label>${html }
                </form>
            </li>
        </ul>
    </div>
</div>
</body>
</html>
