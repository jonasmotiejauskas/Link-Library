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
	<link href="css/linklib.css" rel="stylesheet">
	<!-- Bootstrap -->
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- Bootstrap Social buttons -->
	<link href="bootstrap/css/bootstrap-social.css" rel="stylesheet">
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
		
		<!-- content -->
		<section class="pr-3 pl-3 pt-3 m-0 section row">
			<!-- about -->
			<article class="ml-lg-5 ml-md-2 col-lg-5 col-md-6 col-sm-6 container">
				<h2>About</h2>
				<p>The purpose of this website is to store the links you want to save in a convenient and comfortable way.</p>
				<p>This website is a project for schoolwork. The project's aim is to learn web technologies such as HTML, CSS, ECMAScript, backend with Java and for my own leisure - front end framework Bootstrap.</p>
			</article>
			<!-- login form -->
			<form class="mr-lg-3 mr-md-2 form col-lg-4 col-lg-offset-3 col-md-offset-1 col-md-5 col-sm-6" action="LinkLibrary?action=login" method="post">
				<h2 class="mb-0 pb-3">Login</h2>
				<fieldset class="form-group">
					<input type="text" class="form-control mb-3" name="loginUsernameInput" placeholder="Email address" maxlength="50" pattern=".+@.+" required>
					<input type="password" class="form-control" name="loginPasswordInput" placeholder="Password" maxlength="50" required>
				</fieldset>

				<div class="form-check mb-3">
					<input name="rememberUsername" class="form-check-input" type="checkbox" id="rememberMeCheck" <%= request.getAttribute("rememberUsername")%>>
					<label class="form-check-label" for="rememberMeCheck">Remember me</label>
				</div>
				<!-- Submit buttons -->
				<div class="form-row">
					<div class="col-6">
						<input type="submit" name="loginButton" value="Login" class="primarytextcolor btn backcolor-1 mb-2 btn-block">
					</div>
					<div class="col-6">
						<input type="submit" name="loginButton" value="Register" class="primarytextcolor btn backcolor-1 mb-2 btn-block">
					</div>
				</div>
				<!-- Log in error message -->
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
				</ul>      
				<!-- Login with OAuth -->
				<div class="d-flex flex-row-reverse align-items-center">
					<div class="p-2">
						<a class="btn btn-lg btn-social-icon btn-microsoft">
	            <span class="fa fa-windows text-white"></span>
	          </a>
					</div>
					<div class="p-2">
						<a class="btn btn-lg btn-social-icon btn-facebook">
	            <span class="fa fa-facebook text-white"></span>
	          </a>
					</div>
					<div class="p-2">
						<a class="btn btn-lg btn-social-icon btn-google">
	            <span class="fa fa-google text-white"></span>
	          </a>
					</div>
					<h3><label class="mb-0 ml-2"><span class="label label-primary">Login with</span></label></h3>
				</div>
			</form>
		</section>
	</div>
	<!-- footer -->
	<%@ include file="jspf/footer.jspf"%>
</body>

</html>
