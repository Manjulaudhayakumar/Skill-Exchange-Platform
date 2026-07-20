<%@ page import="dao.SkillDAO"%>
<%@ page import="model.Skill"%>

<%
int skillId = Integer.parseInt(request.getParameter("skillId"));

SkillDAO dao = new SkillDAO();

Skill skill = dao.getSkillById(skillId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Skill</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

<%@ include file="navbar.jsp"%>

<div class="container mt-5">

<h2 class="text-center mb-4">Edit Skill</h2>

<form action="EditSkillServlet" method="post">

<input type="hidden" name="skillId"
value="<%=skill.getSkillId()%>">

<div class="mb-3">

<label>Skill Name</label>

<input type="text"
name="skillName"
class="form-control"
value="<%=skill.getSkillName()%>">

</div>

<div class="mb-3">

<label>Category</label>

<input type="text"
name="category"
class="form-control"
value="<%=skill.getCategory()%>">

</div>

<div class="mb-3">

<label>Experience Level</label>

<input type="text"
name="experienceLevel"
class="form-control"
value="<%=skill.getExperienceLevel()%>">

</div>

<div class="mb-3">

<label>Description</label>

<textarea
name="description"
class="form-control"><%=skill.getDescription()%></textarea>

</div>

<button class="btn btn-success">

Update Skill

</button>

</form>

</div>

<%@ include file="footer.jsp"%>

</body>
</html>