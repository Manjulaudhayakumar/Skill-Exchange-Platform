<%@page import="java.util.ArrayList"%>
<%@page import="dao.ExchangeRequestDAO"%>
<%@page import="model.ExchangeRequest"%>
<%@page import="model.User"%>
<%@ page import="dao.UserDAO" %>
<%@ page import="dao.SkillDAO" %>
<%
User user = (User) session.getAttribute("user");

ExchangeRequestDAO dao = new ExchangeRequestDAO();

ArrayList<ExchangeRequest> list = dao.getMyRequests(user.getId());
UserDAO userDao = new UserDAO();
SkillDAO skillDao = new SkillDAO();
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>My Requests</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

<%@ include file="navbar.jsp" %>

<div class="container mt-5">

<h2 class="text-center">My Exchange Requests</h2>

<table class="table table-bordered">

<tr>

<th>Request ID</th>

<th>Skill</th>

<th>Message</th>

<th>Status</th>

</tr>

<%
for(ExchangeRequest exchangeRequest : list){
%>

<td><%=exchangeRequest.getRequestId()%></td>
<td><%=skillDao.getSkillNameById(exchangeRequest.getSkillId())%></td>
<td><%=exchangeRequest.getMessage()%></td>
<td>

<%
if(exchangeRequest.getStatus().equals("Pending")){
%>

<span class="badge bg-warning text-dark">Pending</span>

<%
}else if(exchangeRequest.getStatus().equals("Accepted")){
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

<%
}
%>

</table>

</div>

<%@ include file="footer.jsp" %>

</body>

</html>