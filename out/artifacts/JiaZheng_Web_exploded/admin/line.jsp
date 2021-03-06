<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="check_logstate.jsp"></jsp:include>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="zh_CN">
<head>
    <base href="<%=basePath%>" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>欢迎使用后台管理系统</title>
    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">
    <script src="lib/jquery-1.11.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
    <link rel="stylesheet" type="text/css" href="stylesheets/premium.css">
    <script src="echart/echarts.min.js" charset="UTF-8"></script>
    <script src="echart/chartline.js" charset="UTF-8"></script>
    <script type="text/javascript" src="laydate/laydate.js" charset="utf-8"></script>
</head>
<body class=" theme-blue">
<div class="content">
    <div class="header">
        <h1 class="page-title">订单收入统计</h1>
    </div>
    <input type="hidden" name="basepath" value="<%=basePath%>">
    <input type="text" name="start" id="start" readonly="readonly" onclick="laydate()"> &nbsp;&nbsp;&nbsp;&nbsp;
    <input type="text" name="end" id="end" readonly="readonly" onclick="laydate()"> &nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" name="sub" id="sub" value="提交" />
    <div class="main-content">
        <table class="table">
            <tr>
                <td class="block-center">
                    <div class="text-center" id="chartmain" style="width: 99%; height: 688px;">
                    </div>
                </td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
