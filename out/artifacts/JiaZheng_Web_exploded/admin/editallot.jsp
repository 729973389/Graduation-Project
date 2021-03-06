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
    <script type="text/javascript" src="js/allot.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/selimage.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script>
</head>
<body class=" theme-blue">
<div class="content">
    <div class="header">
        <h1 class="page-title">编辑订单分派信息</h1>
    </div>
    <div class="main-content">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div id="myTabContent" class="tab-content">
                    <form action="allot/updateAllot.action" name="myform" method="post" onsubmit="return check()" class="form">

                        <div class="tab-pane active in" id="home">
                            <div class="form-group">
                                <label>订单号</label>
                                <select name="ordersid" class="form-control" id="ordersid">
                                    <c:forEach items="${ordersList}" var="orders">
                                        <option value="${orders.ordersid}" <c:if test="${orders.ordersid==allot.ordersid}">selected="selected"</c:if>>${orders.ordercode }</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="tab-pane active in" id="home">
                            <div class="form-group">
                                <label>服务人员</label>
                                <select name="employid" class="form-control" id="employid">
                                <c:forEach items="${employList}" var="employ">
<%--                                <option value="${cate.cateid}"  <c:if test="${cate.cateid==goods.cateid}">selected="selected"</c:if>>${cate.catename }</option>--%>
                                    <option value="${employ.employid}"  <c:if test="${employ.employid==allot.employid}">selected="selected"</c:if>>${employ.realname }</option>
                               </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div>
                            <input type="hidden" name="allotid" id="allotid" value="${allot.allotid}" />
                            <input type="hidden" name="addtime" id="addtime" value="${allot.addtime}" />
                            <input type="hidden" name="status" id="status" value="${allot.status}" />

                            <button type="submit" id="sub" class="btn btn-primary">提交保存</button>
                            &nbsp;&nbsp;&nbsp;
                            <button type="reset" id="res" class="btn btn-primary">取消重置</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

