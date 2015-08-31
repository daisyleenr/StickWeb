<%@page import="vo.UserVO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	UserVO user = (UserVO) session.getAttribute("user");
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
					<form class="form-inline" method="post" action="/login">
						<label class="col-sm-1 control-label" style="float: none; width: 11%; padding-right: 0px; padding-left: 0px;">Email</label>
						<input type="email" class="form-control" placeholder="Email" name="email"><br>
						<br>
						<label class="col-sm-1 control-label" style="float: none; width: 11%; padding-right: 0px; padding-left: 0px;">Password</label>
						<input type="password" class="form-control" placeholder="Password" name="passwd"><br>
						<br><br><a href="/register"><button type="button" class="btn btn-primary" style="width: 100px;">Sign up</button></a>&nbsp;&nbsp;&nbsp;<input class="btn btn-default" type="submit"
							style="width: 100px;" value="Sign in">
							
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
