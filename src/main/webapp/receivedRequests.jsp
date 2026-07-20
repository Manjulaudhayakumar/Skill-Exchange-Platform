<%@page import="java.util.ArrayList"%>
<%@page import="dao.ExchangeRequestDAO"%>
<%@page import="model.ExchangeRequest"%>
<%@page import="model.User"%>
<%@ page import="dao.UserDAO"%>
<%@ page import="dao.SkillDAO"%>

<%
User user = (User)session.getAttribute("user");

ExchangeRequestDAO dao = new ExchangeRequestDAO();

ArrayList<ExchangeRequest> list = dao.getReceivedRequests(user.getId());
UserDAO userDao = new UserDAO();
SkillDAO skillDao = new SkillDAO();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Received Requests</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

<%@ include file="navbar.jsp" %>

<div class="container mt-5">

<h2 class="text-center">Received Requests</h2>

<table class="table table-bordered">

<tr>

<th>Request ID</th>

<th>Sender</th>
<th>Skill</th>
<th>Message</th>

<th>Status</th>

<th>Action</th>

</tr>

<%
for(ExchangeRequest exchange : list){
%>

<tr>

<td><%=exchange.getRequestId()%></td>

<td><%=userDao.getUserNameById(exchange.getSenderId())%></td>

<td><%=skillDao.getSkillNameById(exchange.getSkillId())%></td>

<td><%=exchange.getMessage()%></td>

<td>

<%
if(exchange.getStatus().equals("Pending")){
%>

<span class="badge bg-warning text-dark">Pending</span>

<%
}else if(exchange.getStatus().equals("Accepted")){
%>

<span class="badge bg-success">Accepted</span>

<%
}else{
%>

<span class="badge bg-danger">Rejected</span>

<%
}
%>

</td>

<td>

<%
if(exchange.getStatus().equals("Pending")){
%>

<a href="AcceptRequestServlet?requestId=<%=exchange.getRequestId()%>" class="btn btn-success btn-sm">

Accept

</a>

<a href="RejectRequestServlet?requestId=<%=exchange.getRequestId()%>" class="btn btn-danger btn-sm">

Reject

</a>

<%
}else{
%>

Completed

<%
}
%>

</td>

</tr>

<%
}
%>

</table>

</div>

<%@ include file="footer.jsp" %>

</body>

</html>