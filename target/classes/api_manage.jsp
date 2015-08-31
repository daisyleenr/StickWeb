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

<style>
	
table, tr, th {
	text-align: center;
}
</style>
<script>
$(document).ready(function() {
	var currParam = "";
	var currTitle = "";
	
	$("#paramAdd").click(function(){
		var queryString = "param=" + $(".form-control").val();
		$.ajax({
			url: "api_manage?cmd=param_add",
			type: "POST",
			data: queryString,
			success: function(){
				location.reload();
			}
		});
	});
	
	$(".paramRemove").click(function(){
		var queryString = "param=" + this.getAttribute("id");
		
		$.ajax({
			url: "api_manage?cmd=param_remove",
			type: "POST",
			data: queryString,
			success: function(){
				location.reload();
			}
		});
	});
	
	$(".openModal").click(function(){
		currParam = this.getAttribute("id");
		$("#myModal").modal();
	});
	
	$("#dbUpload").click(function(){
		$("#currParam").attr("value",currParam);
		$("#form_dbUpload").submit();
	});
	
});
</script>
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
                  <% if(user == null){ %>
                  <li><a href="/login">Sign in</a></li>
                  <%}else{ %>
                  <li class="active" class="dropdown">
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%=user.getUser_name() %> <span class="caret"></span></a>
			          <ul class="dropdown-menu">
			            <li><a href="/api_manage">API Management</a></li>
			            <li role="separator" class="divider"></li>
			            <li><a href="/login?logout=true">Logout</a></li>
			          </ul>
			        </li>
			        <%} %>
                </ul>
              </nav>
            </div>
          </div>
		  <div class="inner cover">
			<div>
	<%if(user != null){ %>
	<p style="text-align: left;">Number of Parameter: <%=user.getParamList().size() %></p>
	<table class="table table-hover">
	<thead>
		<tr><th>Title</th><th>Parameter</th><th>Create At</th><th>Number of Records</th><th></th><th></th></tr></thead>
	<tbody>
		<% for(int i=0; i<user.getParamList().size(); i++){ %>
			<tr>
				<td><%=user.getParamList().get(i).getTitle() %> </td>
				<td><%=user.getParamList().get(i).getParameter() %> </td>
				<td><%=user.getParamList().get(i).getCreated_at() %></td>
				<td><%=user.getParamList().get(i).getNumberOfRecord() %></td>
				<td><button type="button" class="openModal btn btn-primary btn-sm" id="<%=user.getParamList().get(i).getParameter()%>">DB Upload</button></td>
				<td><button type="button" class="paramRemove btn btn-danger btn-sm" id="<%=user.getParamList().get(i).getParameter()%>">Delete</button></td>
			</tr>
		<%} %>
	</tbody>
		
	</table>
	<form class="form-inline">
	<input type="text" class="form-control" id="exampleInputEmail3" placeholder="Parameter name" id="paramAddValue">
	&nbsp;&nbsp;<button type="button" class="btn btn-default btn-sm" id="paramAdd">Add Parameter</button>
	</form>
	<%} %>
</div>
		</div>
          <div class="mastfoot" style="background-color: white;">
            <div class="inner">
              <p>by <a href="/">@Gangnam Children</a>.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
          <h4 class="modal-title">Database Upload</h4>
        </div>
        <div class="modal-body">
			<form class="form-inline" action="/upload" method="post" enctype="multipart/form-data" id="form_dbUpload">
				<div class="form-group">
					<input type="file" name="uploadFile">
					<input type="hidden" name="currParam" id="currParam">
					<p class="help-block"></p>
				</div>
			</form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
		  <button type="button" class="btn btn-primary" data-dismiss="modal" id="dbUpload">Upload</button>
        </div>
      </div>
    </div>
  </div>
</body>
</html>

