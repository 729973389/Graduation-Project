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
        <h1 class="page-title">服务类型信息列表</h1>
    </div>
    <div class="main-content">
        <table class="table">
            <thead>
            <tr>
                <th class="text-center">类型名称</th>
                <th class="text-center">备注</th>
            </tr>
            </thead>
            <c:forEach items="${cateList}" var="cate">
                <tr align="center">
                    <td class="center">${cate.catename}</td>
                    <td class="center">${cate.memo}</td>
                    <td>
                        <a href="cate/getCateById.action?id=${cate.cateid}"><i class="fa fa-pencil"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="cate/deleteCate.action?id=${cate.cateid}" onclick="{if(confirm('确定要删除吗?')){return true;}return false;}">
                            <i class="fa fa-trash-o"></i></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <ul class="pagination">
            <li>
                <form action="cate/queryCateByCond.action" name="myform" method="post">
                    <label>查询条件: <select name="cond" style="width: 100px">
                        <option value="catename">按类型名称查询</option>
                        <option value="memo">按备注查询</option>
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
