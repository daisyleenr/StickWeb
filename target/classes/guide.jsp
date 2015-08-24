<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	UserVO user = (UserVO) session.getAttribute("user");
	String pageName = (String) request.getAttribute("pageName");
	
	if(pageName == null || pageName.isEmpty()){
		pageName = "intro.jsp";
	}
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
                  <li><a href="/intro">Intro</a></li>
                  <li class="active"><a href="/guide">Getting Started</a></li>
                  <% if(user == null){ %>
                  <li><a href="/login">Sign In</a></li>
                  <%}else{ %>
                  <li class="dropdown">
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
		  <div id="markup" style="text-align: left; padding-top: 150px;">
	<h1 id="-">�����ϱ�</h1><hr>
	<h3 id="api-">API Ű �߱�</h3>
	<ol>
	<li><strong>Stick</strong> ������ <a href="http://172.16.101.45:8080/register">����</a>�ϼ���.</li>
	<li>�α��� �� ���� ����� <em>API ����</em> �޴��� �����ϼ���.</li>
	<li>������ ��ŷ ��� �̸��� �Է��� ��, <em>��� �߰�</em> ��ư�� ��������.</li>
	<li>�ش� ��ҿ� ���� Ű�� �����˴ϴ�.</li>
	</ol>
		
	
	<br><br><br>
	<h1 id="-">���ڵ� ����</h1><hr>
	<h3 id="-">����</h3>
	<p>��ŷ ��Ҹ� ������ ����, �ش� ��ҿ� ���ڵ带 �߰��� �� �ֽ��ϴ�.</p><br><br><br>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Ű</th>
				<th>Ÿ��</th>
				<th>��ġ</th>
				<th>����</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>api_key</td>
				<td>string</td>
				<td>url</td>
				<td>���� ���������� ������ ��ŷ ����� Ű�Դϴ�.</td>
			</tr>
			<tr>
				<td>id</td>
				<td>string</td>
				<td>body</td>
				<td>���ڵ��� ������ ���̵��Դϴ�.</td>
			</tr>
			<tr>
				<td>score</td>
				<td>int</td>
				<td>body</td>
				<td>��ŷ�� ����� ���ڵ��� �����Դϴ�. ��ŷ�� ������������ ���ĵ˴ϴ�.</td>
			</tr>
		</tbody>
	</table><br><br>
	<h5 id="request">Request</h5>
	<pre>POST /user/your_api_key HTTP/1.1
Host: stick.rest:9000
Content-Type: text/json
{
    "id":"record_id",
    "score":999
}</pre>
	<h5 id="response">Response</h5>
	<pre>HTTP/1.1 201 Created
Content-Type: text/json
{
    "result":"success"
}</pre><br><br><br><hr>
	<h3 id="-">��ȸ</h3>
	<p>
		���ڵ���
		<code>id</code>
		�� �̿��Ͽ� �ش� ���ڵ���
		<code>score</code>
		�� ��ȸ�� �� �ֽ��ϴ�.
	</p><br><br>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Ű</th>
				<th>Ÿ��</th>
				<th>��ġ</th>
				<th>����</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>api_key</td>
				<td>string</td>
				<td>url</td>
				<td>���� ���������� ������ ��ŷ ����� Ű�Դϴ�.</td>
			</tr>
			<tr>
				<td>id</td>
				<td>string</td>
				<td>url</td>
				<td>���ڵ��� ������ ���̵��Դϴ�.</td>
			</tr>
		</tbody>
	</table><br><br>
	<h5 id="request">Request</h5>
	<pre>GET /user/your_api_key/record_id HTTP/1.1
Host: stick.rest:9000</pre>
	<h5 id="response">Response</h5>
	<pre>HTTP/1.1 302 Found
Content-Type: text/json
{
    "score":819324
}</pre><br><br><br><hr>
	<h3 id="-">����</h3>
	<p>
		Ư�� ���ڵ���
		<code>score</code>
		�� ������ �� �ֽ��ϴ�.
	</p><br><br>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Ű</th>
				<th>Ÿ��</th>
				<th>��ġ</th>
				<th>����</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>api_key</td>
				<td>string</td>
				<td>url</td>
				<td>���� ���������� ������ ��ŷ ����� Ű�Դϴ�.</td>
			</tr>
			<tr>
				<td>id</td>
				<td>string</td>
				<td>body</td>
				<td>���ڵ��� ������ ���̵��Դϴ�.</td>
			</tr>
			<tr>
				<td>score</td>
				<td>int</td>
				<td>body</td>
				<td>��ŷ�� ����� ���ڵ��� �����Դϴ�. ��ŷ�� ������������ ���ĵ˴ϴ�.</td>
			</tr>
		</tbody>
	</table><br><br>
	<h5 id="request">Request</h5>
	<pre>PUT /user/your_api_key HTTP/1.1
Host: stick.rest:9000
Content-Type: text/json
{
    "id":"record_id",
    "score":999
}</pre>
	<h5 id="response">Response</h5>
	<pre>HTTP/1.1 200 OK
Content-Type: text/json
{
    "result":"success"
}</pre><br><br><br><hr>
	<h3 id="-">����</h3>
	<p>Ư�� ���ڵ带 ������ �� �ֽ��ϴ�.</p><br><br>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Ű</th>
				<th>Ÿ��</th>
				<th>��ġ</th>
				<th>����</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>api_key</td>
				<td>string</td>
				<td>url</td>
				<td>���� ���������� ������ ��ŷ ����� Ű�Դϴ�.</td>
			</tr>
			<tr>
				<td>id</td>
				<td>string</td>
				<td>url</td>
				<td>���ڵ��� ������ ���̵��Դϴ�.</td>
			</tr>
		</tbody>
	</table><br><br>
	<h5 id="request">Request</h5>
	<pre>DELETE /user/your_api_key/record_id HTTP/1.1
Host: stick.rest:9000</pre>
	<h5 id="response">Response</h5>
	<pre>HTTP/1.1 200 OK
Content-Type: text/json
{
    "result":"success"
}</pre><br><br><br>
	<h1 id="-">��ŷ</h1><hr>
	<h3 id="-">��ŷ ��������</h3><br><br>
	<p>���ڵ��� <code>id</code>�� �̿��Ͽ� �ش� ���ڵ��� ������ ��ȸ�� �� �ֽ��ϴ�.</p><br><br>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Ű</th>
				<th>Ÿ��</th>
				<th>��ġ</th>
				<th>����</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>api_key</td>
				<td>string</td>
				<td>url</td>
				<td>���� ���������� ������ ��ŷ ����� Ű�Դϴ�.</td>
			</tr>
			<tr>
				<td>id</td>
				<td>string</td>
				<td>url</td>
				<td>���ڵ��� ������ ���̵��Դϴ�.</td>
			</tr>
		</tbody>
	</table><br><br>
	<h5 id="request">Request</h5>
	<pre>GET /ranking/your_api_key/record_id HTTP/1.1
Host: stick.rest:9000</pre>
	<h5 id="response">Response</h5>
	<pre>HTTP/1.1 200 OK
Content-Type: text/json
{
    "rank":"2341"
}</pre><br><br><br><hr>
	
	<h3 id="-">��ŷ ������ ��������</h3><br><br><br>
<p>�޾ƿ� ������ ������ ���� �ش� ������ ���ڵ� ����� ������ �� �ֽ��ϴ�. �� ���� ��û���� �ִ� 100���� ���� ����� �޾ƿ� �� �ֽ��ϴ�.</p><br><br>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Ű</th>
				<th>Ÿ��</th>
				<th>��ġ</th>
				<th>����</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>api_key</td>
				<td>string</td>
				<td>url</td>
				<td>���� ���������� ������ ��ŷ ����� Ű�Դϴ�.</td>
			</tr>
			<tr>
				<td>start</td>
				<td>string</td>
				<td>url</td>
				<td>�޾� �� ������ ���� �����Դϴ�.</td>
			</tr>
			<tr>
				<td>end</td>
				<td>string</td>
				<td>url</td>
				<td>�޾� �� ������ �� �����Դϴ�.</td>
			</tr>
		</tbody>
	</table><br><br>
	<h5 id="request">Request</h5>
	<pre>GET /ranking/your_api_key/1/3 HTTP/1.1
Host: stick.rest:9000</pre>
	<h5 id="response">Response</h5>
	<pre>HTTP/1.1 200 OK
Content-Type: text/json
{
    "test_record_1" : {
        "score":33891,
        "rank":1
    },
    "test_record_2" : {
        "score":23459,
        "rank":2
    },
    "test_record_3" : {
        "score":975,
        "rank":3
    }
}</pre><br><br><br><hr>	


	
	
	<h1 id="introduce">Introduce</h1><hr>
	<p>
		<strong>Stick</strong> is a real-time ranking service which can be
		easily used for any kind of platform. Because it is developed using <a
			href="http://redis.io">Redis</a>, <a href="http://fastcgi">FastCGI</a>,
		and C++, it can handle large amount of data without performance
		degradation and deal with immediate increase in network traffic
		without any problems. Now developers are not need to be concerned
		about how to develop a ranking system. Just send your data to <strong>Stick</strong>,
		and call API when you need a ranking of your data.
	</p><br><br><br>
	<h1 id="getting-started">Getting started</h1><hr>
	<h3 id="acquiring-api-keys">Acquiring API keys</h3>
	<ol>
<li><a href="http://172.16.101.45:8080/register">Create</a> your <strong>Stick</strong> accout.</li>
<li>Select <em>API manage</em> menu after sign in.</li>
<li>Enter suitable ranking property name, and press <em>add property</em> button.</li>
<li>The API Keys will be automatically generated.</li>
</ol><br><br>
	<h3 id="create-ranking-properties">Create ranking properties</h3><br><br><br>
	<h1 id="record-management">Record management</h1><hr>
	<p>After creating ranking property, you can add record which have
		same property you have created previously.</p><br><br>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Key</th>
				<th>Type</th>
				<th>Location</th>
				<th>Description</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>api_key</td>
				<td>string</td>
				<td>url</td>
				<td>Ranking property key you created in dashboard.</td>
			</tr>
			<tr>
				<td>id</td>
				<td>string</td>
				<td>body</td>
				<td>Unique ID of the record.</td>
			</tr>
			<tr>
				<td>score</td>
				<td>int</td>
				<td>body</td>
				<td>Score of the record which is used to determine the ranking.
					Ranking will order by descending score.</td>
			</tr>
		</tbody>
	</table><br><br>
	<h5 id="request">Request</h5>
	<pre>POST /user/your_api_key HTTP/1.1
Host: stick.rest:9000
{
    "id":"record_id"
    "score":999
}</pre>
	<h5 id="response">Response</h5>
	<pre>HTTP/1.1 201 Created
Content-Type: text/json
{
    "result":"success"
}</pre><br><br><br><hr>
	<h3 id="read">Read</h3>
	<p>You can request a score of the record by using record id.</p><br><br>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Key</th>
				<th>Type</th>
				<th>Location</th>
				<th>Description</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>api_key</td>
				<td>string</td>
				<td>url</td>
				<td>Ranking property key you created in dashboard.</td>
			</tr>
			<tr>
				<td>id</td>
				<td>string</td>
				<td>url</td>
				<td>Unique ID of the record.</td>
			</tr>
		</tbody>
	</table><br><br>
	<h5 id="request">Request</h5>
	<pre>GET /user/your_api_key/record_id HTTP/1.1
Host: stick.rest:9000</pre>
	<h5 id="response">Response</h5>
	<pre>HTTP/1.1 302 Found
Content-Type: text/json
{
    "score":819324
}</pre><br><br><br><hr>
	<h3 id="modify">Modify</h3>
	<p>You can renew the score of the record.</p><br><br>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Key</th>
				<th>Type</th>
				<th>Location</th>
				<th>Description</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>api_key</td>
				<td>string</td>
				<td>url</td>
				<td>Ranking property key you created in dashboard.</td>
			</tr>
			<tr>
				<td>id</td>
				<td>string</td>
				<td>body</td>
				<td>Unique ID of the record.</td>
			</tr>
			<tr>
				<td>score</td>
				<td>int</td>
				<td>body</td>
				<td>Score of the record which is used to determine the ranking.
					Ranking will order by descending score.</td>
			</tr>
		</tbody>
	</table><br><br>
	<h5 id="request">Request</h5>
	<pre>PUT /user/your_api_key HTTP/1.1
Host: stick.rest:9000
{
    "id":"record_id",
    "score":999
}</pre>
	<h5 id="response">Response</h5>
	<pre>HTTP/1.1 200 OK
Content-Type: text/json
{
    "result":"success"
}</pre><br><br><br><hr>
	<h3 id="delete">Delete</h3>
	<p>You can delete a specific record.</p><br><br>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Key</th>
				<th>Type</th>
				<th>Location</th>
				<th>Description</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>api_key</td>
				<td>string</td>
				<td>url</td>
				<td>Ranking property key you created in dashboard.</td>
			</tr>
			<tr>
				<td>id</td>
				<td>string</td>
				<td>url</td>
				<td>Unique ID of the record.</td>
			</tr>
		</tbody>
	</table><br><br>
	<h5 id="request">Request</h5>
	<pre>DELETE /user/your_api_key/record_id HTTP/1.1
Host: stick.rest:9000</pre>
	<h5 id="response">Response</h5>
	<pre>HTTP/1.1 200 OK
Content-Type: text/json
{
    "result":"success"
}</pre><br><br><br>
	<h1 id="ranking">Ranking</h1><hr>

	<h3 id="-">Get ranking</h3><br><br>
	<p>By using record <code>id</code>, you can refer us to send the record's rank.</p><br><br>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Key</th>
				<th>Type</th>
				<th>Location</th>
				<th>Description</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>api_key</td>
				<td>string</td>
				<td>url</td>
				<td>Ranking property key you created in dashboard.</td>
			</tr>
			<tr>
				<td>id</td>
				<td>string</td>
				<td>url</td>
				<td>Unique ID of the record.</td>
			</tr>
		</tbody>
	</table><br><br>
	<h5 id="request">Request</h5>
	<pre>GET /ranking/your_api_key/record_id HTTP/1.1
Host: stick.rest:9000</pre>
	<h5 id="response">Response</h5>
	<pre>HTTP/1.1 200 OK
Content-Type: text/json
{
    "rank":"2341"
}</pre><br><br><br><hr>
	
	<h3 id="-">Get ranking pages</h3><br><br><br>
<p>You can get get a list of records by assigning the range of rankings. The maximum size of the list per request is 100.</p><br><br>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Key</th>
				<th>Type</th>
				<th>Location</th>
				<th>Description</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>api_key</td>
				<td>string</td>
				<td>url</td>
				<td>Ranking property key you created in dashboard.</td>
			</tr>
			<tr>
				<td>start</td>
				<td>string</td>
				<td>url</td>
				<td>The starting point of the range of rankings.</td>
			</tr>
			<tr>
				<td>end</td>
				<td>string</td>
				<td>url</td>
				<td>The ending point of the range of rankings.</td>
			</tr>
		</tbody>
	</table><br><br>
	<h5 id="request">Request</h5>
	<pre>GET /ranking/your_api_key/1/3 HTTP/1.1
Host: stick.rest:9000</pre>
	<h5 id="response">Response</h5>
	<pre>HTTP/1.1 200 OK
Content-Type: text/json
{
    "test_record_1" : {
        "score":33891,
        "rank":1
    },
    "test_record_2" : {
        "score":23459,
        "rank":2
    },
    "test_record_3" : {
        "score":975,
        "rank":3
    }
}</pre><br><br><br><hr>	


</div>
          <div class="mastfoot" style="background-color: white; position: relative;">
            <div class="inner">
              <p>by <a href="/">@Gangnam Child</a>.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>
	
	
	
