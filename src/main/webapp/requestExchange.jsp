<%
int skillId = Integer.parseInt(request.getParameter("skillId"));
int receiverId = Integer.parseInt(request.getParameter("receiverId"));
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Request Exchange</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

<%@ include file="navbar.jsp"%>

<div class="container mt-5">

<h2 class="text-center">Skill Exchange Request</h2>

<form action="RequestExchangeServlet" method="post">

<input type="hidden" name="skillId" value="<%=skillId%>">

<input type="hidden" name="receiverId" value="<%=receiverId%>">

<div class="mb-3">

<label>Message</label>

<textarea
name="message"
class="form-control"
rows="5"
required></textarea>

</div>

<button class="btn btn-success">

Send Request

</button>

</form>

</div>

<%@ include file="footer.jsp"%>

</body>

</html>