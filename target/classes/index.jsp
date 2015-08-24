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
				<strong>Stick</strong> �� ��� �÷������� �����ϰ� ������ �� �ִ� �ǽð� ��ŷ �����Դϴ�. <a
					href="http://redis.io">Redis</a>�� <a href="http://fastcgi">FastCGI</a>,
				�׸��� C++�� ���ߵǾ� ��뷮�� �����͵� �ӵ� ���� ���� ������ ó���� �� �ְ�, �������� Ʈ���� �������� ���� ����
				�����մϴ�. �����ڴ� ���� �� �̻� ��ŷ ������ ���� ����� �ʿ䰡 �����ϴ�. ���� <strong>Stick</strong>
				�� ������ ������, �ʿ��� �� API�� ȣ���Ͽ� ������ Ȯ���ϸ� �˴ϴ�.
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