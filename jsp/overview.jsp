<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="domain.LinkHolder" %>
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

    <div class="d-flex justify-content-center align-content-center flex-wrap">
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
      <%
       	List<LinkHolder> linkList = (List<LinkHolder>) request.getAttribute("linkList");
       	if(linkList == null){
       		linkList = new ArrayList<LinkHolder>();
       	}
      	for(LinkHolder link : linkList) { 
      %>
	  	<div class="m-2 p-0 border border-dark rounded">
	  	  <a href=<%= link.getURL() %>>
	        <img src="images/example.png" class="p-0 img-fluid img-thumbnail img-rounded" alt="Example" >
	      </a>
	      <div class="d-flex">
	        <p class="col-8 m-0 p-0 text-center align-self-center"><%= link.getlinkName() %></p>
	        <a class="col-2 m-0 p-0 text-dark text-center fa fa-edit fa-2x" href="LinkLibrary?action=editlink&linkid=<%=+link.getId() %>"></a>
	        <a href="#delete<%=link.getId() %>" class="trigger-btn text-dark col-2 m-0 p-0 text-center fa fa-trash fa-2x" data-toggle="modal"></a>
	        <!-- Modal HTML -->
			<form id="delete<%=link.getId() %>" class="modal fade" action="LinkLibrary?action=deletelink" method="post">
				<div class="modal-dialog modal-confirm">
					<div class="modal-content">
						<div class="modal-header">			
							<h4 class="modal-title">Are you sure?</h4>	
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body backcolor-2">
							<p>Do you really want to delete <%= link.getlinkName() %>? This process cannot be undone.</p>
							<input type="hidden" name="linkid" value=<%= link.getId() %>>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn backcolor-1 primarytextcolor" data-dismiss="modal">Cancel</button>
							<button type="submit" class="btn btn-danger">Delete</button>
						</div>
					</div>
				</div>
			</form>  
	      </div>
        </div>
	  <%}%>
    </div>
  </div>
  <!-- footer -->
	<%@ include file="jspf/footer.jspf"%>
</body>

</html>