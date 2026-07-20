<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="model.User"%>

<%
User user=(User)session.getAttribute("user");

if(user==null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body class="bg-light">
<%@ include file="navbar.jsp" %>
<div class="container mt-5">

<div class="card">

<div class="card-header bg-primary text-white">
<h3>My Profile</h3>
</div>

<div class="card-body">

<table class="table table-bordered">

<tr>
<th>Full Name</th>
<td><%=user.getFullName()%></td>
</tr>

<tr>
<th>Email</th>
<td><%=user.getEmail()%></td>
</tr>

<tr>
<th>Phone</th>
<td><%=user.getPhone()%></td>
</tr>

<tr>
<th>City</th>
<td><%=user.getCity()%></td>
</tr>

<tr>
<th>Role</th>
<td><%=user.getRole()%></td>
</tr>

</table>

<a href="dashboard.jsp" class="btn btn-primary">
Back to Dashboard
</a>

</div>

</div>

</div>
<%@ include file="footer.jsp" %>
</body>
</html>