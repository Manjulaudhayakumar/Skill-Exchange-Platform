<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Register</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

<div class="row justify-content-center">

<div class="col-md-6">

<div class="card shadow">

<div class="card-header bg-primary text-white text-center">

<h3>SkillBridge Registration</h3>

</div>

<div class="card-body">

<form action="RegisterServlet" method="post">

<div class="mb-3">

<label>Full Name</label>

<input type="text"
class="form-control"
name="fullName"
required>

</div>

<div class="mb-3">

<label>Email</label>

<input type="email"
class="form-control"
name="email"
required>

</div>

<div class="mb-3">

<label>Password</label>

<input type="password"
class="form-control"
name="password"
required>

</div>

<div class="mb-3">

<label>Phone</label>

<input type="text"
class="form-control"
name="phone"
required>

</div>

<div class="mb-3">

<label>City</label>

<input type="text"
class="form-control"
name="city"
required>

</div>

<div class="mb-3">

<label>Role</label>

<select class="form-select"
name="role">

<option>Learner</option>

<option>Trainer</option>

<option>Both</option>

</select>

</div>

<div class="text-center">

<button class="btn btn-primary">

Register

</button>

</div>

</form>

</div>

</div>

</div>

</div>

</div>

</body>

</html>