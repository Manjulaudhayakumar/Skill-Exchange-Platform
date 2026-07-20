<%@ page import="java.util.ArrayList"%>
<%@ page import="dao.SkillDAO"%>
<%@ page import="model.Skill"%>

<%
SkillDAO dao = new SkillDAO();

ArrayList<Skill> list = dao.getAllSkillsForExchange();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Browse Skills</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

<%@ include file="navbar.jsp"%>

<div class="container mt-5">

<h2 class="text-center">Browse Skills</h2>

<table class="table table-bordered mt-4">

<tr>

<th>Skill</th>
<th>Category</th>
<th>Experience</th>
<th>Description</th>
<th>Action</th>

</tr>

<%
for(Skill skill : list){
%>

<tr>

<td><%=skill.getSkillName()%></td>

<td><%=skill.getCategory()%></td>

<td><%=skill.getExperienceLevel()%></td>

<td><%=skill.getDescription()%></td>

<td>

<a href="requestExchange.jsp?skillId=<%=skill.getSkillId()%>&receiverId=<%=skill.getUserId()%>"
class="btn btn-primary">

Request

</a>

</td>

</tr>

<%
}
%>

</table>

</div>

<%@ include file="footer.jsp"%>

</body>

</html>