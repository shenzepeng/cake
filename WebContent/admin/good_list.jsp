<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>商品列表</title>
<meta charset="utf-8"/>
<link rel="stylesheet" href="css/bootstrap.css"/> 
</head>
<body>
<div class="container-fluid">

	<%@include file="header.jsp" %>
	
	<div class="text-right"><a class="btn btn-warning" href="goodAdd">添加商品</a></div>
	
	<br>
		
	<ul role="tablist" class="nav nav-tabs">
        <li <c:if test='${status==0}'>class="active"</c:if> role="presentation"><a href="goodList">全部商品</a></li>
        <li <c:if test='${status==1}'>class="active"</c:if> role="presentation"><a href="goodList?status=1">条幅推荐</a></li>
        <li <c:if test='${status==2}'>class="active"</c:if> role="presentation"><a href="goodList?status=2">热销推荐</a></li>
        <li <c:if test='${status==3}'>class="active"</c:if> role="presentation"><a href="goodList?status=3">新品推荐</a></li>
    </ul>
    
    <c:if test="${status == 1}"><br><p>首页默认只显示前[1]条记录</p></c:if>
    <c:if test="${status == 2}"><br><p>首页默认只显示前[6]条记录</p></c:if>
    <c:if test="${status == 3}"><br><p>首页默认只显示前[8]条记录</p></c:if>
	
	<br>

	<table class="table table-bordered table-hover">

	<tr>
		<th width="5%">ID</th>
		<th width="10%">图片</th>
		<th width="10%">名称</th>
		<th width="20%">介绍</th>
		<th width="10%">价格</th>
		<th width="10%">类目</th>
		<th width="25%">操作</th>
	</tr>
	
	<c:forEach var="good" items="${goodList}">
         <tr>
         	<td><p>${good.id}</p></td>
         	<td><p><a href="../index/detail?goodid=${good.id}" target="_blank"><img src="../${good.cover}" width="100px" height="100px"></a></p></td>
         	<td><p><a href="../index/detail?goodid=${good.id}" target="_blank">${good.name}</a></p></td>
         	<td><p>${good.intro}</p></td>
         	<td><p>${good.price}</p></td>
         	<td><p>${good.type.name}</p></td>
			<td>
				<p>
				<c:if test="${good.topScroll}"><a class="btn btn-info" href="topDelete?type=1&goodId=${good.id}&status=${status}">移出条幅</a></c:if>
				<c:if test="${!good.topScroll}"><a class="btn btn-primary" href="topSave?type=1&goodId=${good.id}&status=${status}">加入条幅</a></c:if>
				<c:if test="${good.topLarge}"><a class="btn btn-info" href="topDelete?type=2&goodId=${good.id}&status=${status}">移出热销</a></c:if>
				<c:if test="${!good.topLarge}"><a class="btn btn-primary" href="topSave?type=2&goodId=${good.id}&status=${status}">加入热销</a></c:if>
				<c:if test="${good.topSmall}"><a class="btn btn-info" href="topDelete?type=3&goodId=${good.id}&status=${status}">移出新品</a></c:if>
				<c:if test="${!good.topSmall}"><a class="btn btn-primary" href="topSave?type=3&goodId=${good.id}&status=${status}">加入新品</a></c:if>
				</p>
				<a class="btn btn-success" href="goodEdit?id=${good.id}">修改</a>
				<a class="btn btn-danger" href="goodDelete?id=${good.id}">删除</a>
			</td>
       	</tr>
     </c:forEach>
     
</table>

<br>${pageTool}<br>
</div>
</body>
</html>