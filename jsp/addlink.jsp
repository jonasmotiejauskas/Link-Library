<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta charset="utf-8">
  <meta http-equiv='X-UA-Compatible' content='IE=edge'>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="icon" href="images/linkliblogo.ico">

  <title>Link Library</title>
  <!-- My defined styles -->
  <link href="css/linklib.css" rel="stylesheet" />
  <!-- Bootstrap -->
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
  <!-- Bootstrap Social buttons -->
  <link href="bootstrap/css/bootstrap-social.css" rel="stylesheet" />
  <!-- icons for social buttons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <!-- Plugins -->
  <script src="bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
  <div class="screen-wrapper backcolor-2">
    <!-- title -->
    <%@ include file="jspf/title.jspf"%>

    <%@ include file="jspf/navigation.jspf"%>
    
    <!-- form to add link -->
    <form id="addlinkform" class="mx-auto py-3 pl-3 pr-3" action="LinkLibrary?action=createlink" method="post" novalidate>
      <h2 class="mb-0 pb-3">Add a new Link</h2>
      <fieldset class="form-group">
        <input type="url" class="form-control mb-3" name="linkurl" placeholder="Link URL" maxlength="400" required>
        <input type="text" class="form-control mb-3" name="linkname" placeholder="Name" maxlength="100" required>
        <select class="form-control mb-3" id="linkgroup">
          <option value="" selected>No Group Selected</option>
        </select>
        <input type="number" class="form-control" name="linkpriority" placeholder="Priority" min="1" max="100">
        <!-- Add link error message -->
        <%
			List<String> errorList = (List<String>) request.getAttribute("errorList");
			String statusMessageClass = "";
			if (errorList != null) {
				statusMessageClass = "danger";
		%>
		<ul class="alert alert-<%=statusMessageClass%>">
		<%
				for (String error : errorList) {
		%>
				<li><%=error%></li>
		<%
				}
			}
		%>
        <!-- <textarea name="text" rows="4" wrap="soft" placeholder="Description" class="form-control" form="addlinkform" maxlength="300"></textarea> -->
      </fieldset>
      <input type="submit" name="addlink" value="Add Link" class="primarytextcolor btn backcolor-1 mb-2 btn-block">
    </form>

  </div>
  <!-- footer -->
	<%@ include file="jspf/footer.jspf"%>
</body>

</html>