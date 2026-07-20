<%@ page import="model.User" %>

<%
User user = (User)session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<style>
.card{
    transition:0.3s;
}

.card:hover{
    transform:translateY(-6px);
    box-shadow:0 10px 25px rgba(0,0,0,0.2);
}
</style>
</head>

<body class="bg-light">
<%@ include file="navbar.jsp" %>
<div class="container mt-5">

<h2 class="text-center text-primary">
Welcome <%=user.getFullName()%>
</h2>

<hr>

<div class="row">

<div class="col-md-6 mb-3">

<div class="card shadow">

<div class="card-body text-center">

<h4><i class="fas fa-search text-info"></i> Browse Skills</h4>

<p>Browse skills shared by other users.</p>

<a href="browseSkills.jsp" class="btn btn-info">
Open
</a>

</div>

</div>

</div>
<!-- My Requests Card -->
    <div class="col-md-4">
        <div class="card shadow">
            <div class="card-body text-center">
                <h5><i class="fas fa-paper-plane text-primary"></i> My Requests</h5>
                <p>View all requests you have sent.</p>
                <a href="myRequests.jsp" class="btn btn-primary">Open</a>
            </div>
        </div>
    </div>
    <div class="col-md-4">
    <div class="card shadow">
        <div class="card-body text-center">
            <h5><i class="fas fa-inbox text-success"></i> Received Requests</h5>
            <p>View requests sent to you.</p>
            <a href="receivedRequests.jsp" class="btn btn-primary">Open</a>
        </div>
    </div>
</div>
<div class="col-md-6 mb-3">

<div class="card shadow">

<div class="card-body text-center">

<h4><i class="fas fa-plus-circle text-success"></i> Add Skill</h4>

<p>Add a new skill.</p>

<a href="addSkill.jsp" class="btn btn-success">
Open
</a>

</div>

</div>

</div>
<div class="col-md-4 mb-4">

    <div class="card shadow">

        <div class="card-body text-center">

            <h4><i class="fas fa-book text-primary"></i> My Skills</h4>

            <p>View, edit and delete your skills.</p>

            <a href="viewSkills.jsp" class="btn btn-primary">
                Open
            </a>

        </div>

    </div>

</div>
<div class="col-md-6 mb-3">

<div class="card shadow">

<div class="card-body text-center">

<h4><i class="fas fa-user text-warning"></i> My Profile</h4>

<p>View your profile.</p>

<a href="profile.jsp" class="btn btn-warning">
Open
</a>

</div>

</div>

</div>

<div class="col-md-6 mb-3">

<div class="card shadow">

<div class="card-body text-center">

<h4><i class="fas fa-right-from-bracket text-danger"></i> Logout</h4>

<p>Logout from SkillBridge.</p>

<a href="LogoutServlet" class="btn btn-danger">
Logout
</a>

</div>

</div>

</div>

</div>

</div>
<%@ include file="footer.jsp" %>
</body>
</html>