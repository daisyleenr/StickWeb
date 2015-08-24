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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="cover.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

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
                  <li class="active"><a href="/intro">Intro</a></li>
                  <li><a href="/guide">Getting Started</a></li>
                  <% if(user == null){ %>
                  <li><a href="/login">Sign in</a></li>
                  <%}else{ %>
                  <li class="dropdown">
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%=user.getUser_name() %> <span class="caret"></span></a>
			          <ul class="dropdown-menu">
			            <li><a href="/api_manage">API Management</a></li>
			            <li role="separator" class="divider"></li>
			            <li><a href="/login?logout=true">Sign in</a></li>
			          </ul>
			        </li>
			        <%} %>
                </ul>
              </nav>
            </div>
          </div>
		  <div class="inner cover">
			<h1 class="cover-heading">Stick your game.</h1>
			<p class="lead">
				<strong>Stick</strong> 은 어느 플랫폼에나 간단하게 적용할 수 있는 실시간 랭킹 서비스입니다. <a
					href="http://redis.io">Redis</a>와 <a href="http://fastcgi">FastCGI</a>,
				그리고 C++로 개발되어 대용량의 데이터도 속도 저하 없이 빠르게 처리할 수 있고, 순간적인 트래픽 증가에도 문제 없이
				대응합니다. 개발자는 이제 더 이상 랭킹 구현을 위해 고민할 필요가 없습니다. 단지 <strong>Stick</strong>
				에 정보를 보내고, 필요할 때 API를 호출하여 순위를 확인하면 됩니다.
			</p><br><br>
			<p class="lead">
				<a href="/guide" class="btn btn-lg btn-default">Learn more</a>
			</p>
		</div>
          <div class="mastfoot" style="background-color: white;">
            <div class="inner">
              <p>by <a href="/">@Gangnam Child</a>.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>