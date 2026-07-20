<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Skill</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

<%@ include file="navbar.jsp"%>

<div class="container mt-5">

<h2 class="text-center mb-4">Add Skill</h2>

<form action="AddSkillServlet" method="post">

<div class="mb-3">

<label>Skill Name</label>

<input type="text" name="skillName" class="form-control" required>

</div>

<div class="mb-3">

<label>Category</label>

<input type="text" name="category" class="form-control" required>

</div>

<div class="mb-3">

<label>Experience Level</label>

<select name="experienceLevel" class="form-control">

<option>Beginner</option>

<option>Intermediate</option>

<option>Advanced</option>

</select>

</div>

<div class="mb-3">

<label>Description</label>

<textarea name="description" class="form-control"></textarea>

</div>

<button class="btn btn-primary">

Add Skill

</button>

</form>

</div>

<%@ include file="footer.jsp"%>

</body>
</html>