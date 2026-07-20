<%@ page import="java.util.ArrayList"%>
<%@ page import="dao.SkillDAO"%>
<%@ page import="model.Skill"%>

<%
SkillDAO dao = new SkillDAO();
ArrayList<Skill> list = dao.getAllSkills();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Skills</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

<%@ include file="navbar.jsp"%>

<div class="container mt-5">

<h2 class="text-center mb-4">View Skills</h2>

<table class="table table-bordered table-striped">

<thead>

<tr>

<th>ID</th>
<th>Skill Name</th>
<th>Category</th>
<th>Experience</th>
<th>Description</th>
<th>Edit</th>
<th>Delete</th>

</tr>

</thead>

<tbody>

<%
for(Skill skill : list){
%>

<tr>

<td><%=skill.getSkillId()%></td>

<td><%=skill.getSkillName()%></td>

<td><%=skill.getCategory()%></td>

<td><%=skill.getExperienceLevel()%></td>

<td><%=skill.getDescription()%></td>

<td>

<a href="editSkill.jsp?skillId=<%=skill.getSkillId()%>" class="btn btn-warning btn-sm">

Edit

</a>

</td>

<td>

<a href="DeleteSkillServlet?id=<%=skill.getSkillId()%>"
   class="btn btn-danger btn-sm"
   onclick="return confirm('Are you sure you want to delete this skill?');">
    Delete
</a>
</td>

</tr>

<%
}
%>

</tbody>

</table>

</div>

<%@ include file="footer.jsp"%>

</body>
</html>