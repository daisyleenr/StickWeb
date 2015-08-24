<%@page import="vo.UserVO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	UserVO user = (UserVO) session.getAttribute("user");
	String pageName = (String) request.getAttribute("pageName");
	if (pageName == null || pageName.isEmpty()) {
		pageName = "intro.jsp";
	}
%>

<!DOCTYPE HTML>
<html>
<head>
<title>Stick</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="cover.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="site-wrapper">
		<div class="site-wrapper-inner">
			<div class="cover-container">
				<div class="masthead clearfix" style="background-color: white;">
					<div class="inner">
						<a href="/"><h3 class="masthead-brand">Stick</h3></a>
						<nav>
							<ul class="nav masthead-nav">
								<li><a href="/intro">Intro</a></li>
								<li><a href="/guide">Getting Started</a></li>
								<%
									if (user == null) {
								%>
								<li class="active"><a href="/login">Sign in</a></li>
								<%
									} else {
								%>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false"><%=user.getUser_name()%> <span
										class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="/api_manage">API Management</a></li>
										<li role="separator" class="divider"></li>
										<li><a href="/login?logout=true">Logout</a></li>
									</ul></li>
								<%
									}
								%>

							</ul>
						</nav>
					</div>
				</div>
				<div>
	<form class="form-inline" method="post" action="/register">
	    
						<label class="col-sm-1 control-label" style="float: none; width: 13%; padding-right: 0px; padding-left: 0px;">Email</label><input type="email" class="form-control" id="exampleInputEmail3" placeholder="Email" name="email"><br><br>
						<label class="col-sm-1 control-label" style="float: none; width: 13%; padding-right: 0px; padding-left: 0px;">Password</label><input type="password" class="form-control" id="exampleInputPassword3" placeholder="Password" name="passwd"><br><br>
						<label class="col-sm-1 control-label" style="float: none; width: 13%; padding-right: 0px; padding-left: 0px;">Username</label><input type="text" class="form-control" id="exampleInputEmail3" placeholder="Username" name="username"><br><br>
						<label class="col-sm-1 control-label" style="float: none; width: 13%; padding-right: 0px; padding-left: 0px;">Game Title</label><input type="text" class="form-control" id="exampleInputEmail3" placeholder="GameTitle" name="title"><br><br>
	  <input class="btn btn-default" style="width: 100px;" type="submit" value="Sign Up">
</form>
</div>
				<div class="mastfoot" style="background-color: white;">
					<div class="inner">
						<p>
							by <a href="/">@Gangnam Child</a>.
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>