<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/2/19
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/1/26
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>后台管理</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <script src="../../js/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="../../manager_index/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="../../manager_index/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="../../manager_index/css/fontastic.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="../../manager_index/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="../../manager_index/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="../../manager_index/img/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <link type="text/css" rel="stylesheet" href="../../css/style.css"/>
</head>
<body>
<div class="page">
    <!-- Main Navbar-->
    <header class="header">
        <nav class="navbar">
            <div class="container-fluid">
                <div class="navbar-holder d-flex align-items-center justify-content-between">
                    <!-- Navbar Header-->
                    <div class="navbar-header">
                        <!-- Navbar Brand --><a href="#" class="navbar-brand d-none d-sm-inline-block">
                        <div class="brand-text d-none d-lg-inline-block"><span>Bootstrap </span><strong>Dashboard</strong></div>
                        <div class="brand-text d-none d-sm-inline-block d-lg-none"><strong>BD</strong></div></a>Bookstore
                        <!-- Toggle Button--><a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
                    </div>
                    <!-- Navbar Menu -->
                    <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                        <!-- Languages dropdown    -->
                        <li class="nav-item dropdown"><a id="languages" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link language dropdown-toggle"><img src="../../manager_index/img/flags/16/GB.png" alt="English"><span class="d-none d-sm-inline-block">English</span></a>
                            <ul aria-labelledby="languages" class="dropdown-menu">
                                <li><a rel="nofollow" href="#" class="dropdown-item"> <img src="../../manager_index/img/flags/16/DE.png" alt="English" class="mr-2">German</a></li>
                                <li><a rel="nofollow" href="#" class="dropdown-item"> <img src="../../manager_index/img/flags/16/FR.png" alt="English" class="mr-2">French                                         </a></li>
                            </ul>
                        </li>
                        <!-- Logout    -->
                        <li class="nav-item"><a class="nav-link logout" onclick="logout()"> <span class="d-none d-sm-inline">Logout</span><i class="fa fa-sign-out"></i></a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <div class="page-content d-flex align-items-stretch">
        <!-- Side Navbar -->
        <nav class="side-navbar">
            <!-- Sidebar Header-->
            <div class="sidebar-header d-flex align-items-center">
                <div class="avatar"><img src="../../manager_index/img/timg.jpg" alt="..." class="img-fluid rounded-circle"></div>
                <div class="title">
                    <h1 class="h4">Fluctlight</h1>
                    <p>Web Designer</p>
                </div>
            </div>
            <!-- Sidebar Navidation Menus--><span class="heading">Main</span>
            <ul class="list-unstyled">
                <li ><a href="/manager_index.do"> <i class="icon-home"></i>Home </a></li>
                <li ><a id="users" href="/manager_user.do"> <i class="icon-grid" ></i>Users </a> </li>
                <li ><a id="books" href="/manager_book.do"> <i class="fa fa-bar-chart"></i>Books </a></li>
                <li class="active"><a id="orders" href="#"> <i class="icon-padnote"></i>Orders </a></li>
                <%--<li><a href="#exampledropdownDropdown" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>Example dropdown </a>--%>
                <%--<ul id="exampledropdownDropdown" class="collapse list-unstyled ">--%>
                <%--<li><a href="#">Page</a></li>--%>
                <%--<li><a href="#">Page</a></li>--%>
                <%--<li><a href="#">Page</a></li>--%>
                <%--</ul>--%>
                <%--</li>--%>
                <%--<li><a href="#"> <i class="icon-interface-windows"></i>Login page </a></li>--%>
            </ul><span class="heading">Extras</span>
            <ul class="list-unstyled">
                <li> <a href="#"> <i class="icon-flask"></i>Demo </a></li>
                <li> <a href="#"> <i class="icon-screen"></i>Demo </a></li>
                <li> <a href="#"> <i class="icon-mail"></i>Demo </a></li>
                <li> <a href="#"> <i class="icon-picture"></i>Demo </a></li>
            </ul>
        </nav>
        <div class="content-inner">
            <!-- Page Header-->
            <header class="page-header">
                <div class="container-fluid">
                    <h2 class="no-margin-bottom">订单</h2>
                </div>
            </header>
            <section class="tables">
                <div class="container-fluid">
                    <div class="row">
                        <%--用户表单--%>
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-close">
                                    <div class="dropdown">
                                        <button type="button" id="closeCard1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i></button>
                                        <div aria-labelledby="closeCard1" class="dropdown-menu dropdown-menu-right has-shadow"><a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a></div>
                                    </div>
                                </div>
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">Order Table</h3>
                                </div>
                                <div class="card-body">
                                    <div class="manage">
                                        <div class="search">
                                            <form id="searchInput" method="post" action="manager_order.do" class="form-inline">
                                                <div class="form-group">
                                                    <label for="oid">订单号：</label>
                                                    <%--<input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe">--%>
                                                    <input class="form-control" type="text" id="oid" name="oid" value="${sessionScope.oid}"/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="oname">收货人：</label>
                                                    <%--<input type="email" class="form-control" id="exampleInputEmail2" placeholder="jane.doe@example.com">--%>
                                                    <input class="form-control" type="text" class="text" id="oname" name="oname" value="${sessionScope.oname}"/>
                                                </div>
                                                <%--订单号：<input class="form-control" type="text" class="text" id="oid" name="oid" /> 收货人：<input class="form-control" type="text" class="text" id="oname" name="oname" /> --%>
                                                <input type="button" onclick="submit()" class="btn btn-info" value="搜索">
                                            </form>
                                        </div>
                                        <div class="spacer"></div>
                                        <table class="table table-hover">
                                            <c:forEach items="${bookOrders}" var="bookOrder">
                                                <tr class="active ">
                                                    <td class="first w4 c">订单号:${bookOrder.oid}</td>
                                                    <td class="w1 c">${bookOrder.date}</td>
                                                    <td class="w1 c">收货人:${bookOrder.oname}</td>
                                                    <td>收货地址：${bookOrder.adress}</td>
                                                    <td class="w1 c"><a href="orderModifyPage.do?oid=${bookOrder.oid}">修改</a> <a
                                                            href="delserchBookOrder.do?oid=${bookOrder.oid}">删除</a></td>
                                                </tr>
                                                <c:forEach items="${bookOrder.orderDetails}" var="orderDetail">
                                                    <c:forEach items="${books }" var="book">
                                                        <c:if test="${book.bid==orderDetail.bookId }">
                                                            <tr>
                                                                <td class="first w4 c">${book.bname }</td>
                                                                <td class="w1 c"><img height="80" width="80" src="../../images/product/${book.image}"></td>
                                                                <td class="w1 c">数量：${orderDetail.bookNum }</td>
                                                                <td>￥${book.pirce*orderDetail.bookNum }</td>
                                                                <td class="w1 c">${bookOrder.status }</td>
                                                            </tr>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </c:forEach>
                                        </table>
                                        <div class="pager">
                                            <ul class="clearfix">
                                                <c:choose>
                                                    <c:when test="${pageInfo.hasPreviousPage}">
                                                        <li><a href="manager_order.do?pageNum=1">首页</a></li>
                                                        <li><a href="manager_order.do?pageNum=${pageInfo.prePage }">上一页</a></li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li><span>首页</span></li>
                                                        <li><span>上一页</span></li>
                                                    </c:otherwise>
                                                </c:choose>

                                                <c:forEach var="index" begin="1" end="${pageInfo.pages }">

                                                    <li
                                                            <c:if test="${index==pageInfo.pageNum}">class="current"</c:if>><a
                                                            href="manager_order.do?pageNum=${index }">${index }</a></li>
                                                </c:forEach>

                                                <c:choose>
                                                    <c:when test="${pageInfo.hasNextPage}">
                                                        <li><a href="manager_order.do?pageNum=${pageInfo.nextPage }">下一页</a></li>
                                                        <li><a href="manager_order.do?pageNum=${pageInfo.pages }">尾页</a></li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li><span>下一页</span></li>
                                                        <li><span>尾页</span></li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <div class="clear"></div>
            <footer class="main-footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6">
                            <p>Copyright &copy; 2019. Louxt. All rights reserved.</p>
                        </div>
                        <div class="col-sm-6 text-right">
                            <p></p>
                            <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
</div>

<!-- JavaScript files-->
<script src="../../manager_index/vendor/jquery/jquery.min.js"></script>
<script src="../../manager_index/vendor/popper.js/umd/popper.min.js"> </script>
<script src="../../manager_index/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="../../manager_index/vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="../../manager_index/vendor/chart.js/Chart.min.js"></script>
<script src="../../manager_index/vendor/jquery-validation/jquery.validate.min.js"></script>
<script src="../../manager_index/js/charts-home.js"></script>
<script type="text/javascript" src="../../scripts/function-manage.js"></script>
<%--<!-- Main File-->--%>
<script src="../../manager_index/js/front.js"></script>
<%--js--%>
<script type="text/javascript" src="../../manager_index/js/manager_order.js"></script>
<script src="../../manager_index/js/manager_index.js" ></script>

</body>

</html>

