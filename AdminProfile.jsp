<%@page import="projet.beans.Utilisateur"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%
	Utilisateur user = (Utilisateur) session.getAttribute("Utilisateur");
%>
<head>
<meta charset="ISO-8859-1">
<title>Profil d'Administrateur</title>
<link rel="stylesheet" type="text/css" href="cssBot/bootstrap.min.css"/>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark" >
  <a class="navbar-brand" href="#"><h1 class="display-5">Bienvenue à e-Projet</h1></a>
  
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="nav navbar-nav ml-auto w-100 justify-content-end">
			 <li class="nav-item"><a class="nav-link" 
				href="Administrateur.jsp">Administrateur: <%=user.getNom()%> et <%=user.getPrenom()%></a>
			</li> 
			<li class="nav-item"><a class="nav-link"
				href="AdminProfile.jsp">Mon profile</a></li>
			<li class="nav-item"><a class="nav-link"
				href="LogOutServlet">Déconnecter</a></li>
		</ul>
	</div>
</nav>
</head>
<body>
	<form>
	<div class="container center_div" class="p-3 mb-2 bg-warning text-dark">
			<div class="row">
				<div class="col-4">
					<h1>Votre profile</h1>
					<div class="form-group">
						<label for="id">ID</label> <input type="text" class="form-control"
							id="id" name="id" value=<%=user.getIdUt()%> disabled>
					</div>
					<div class="form-group">
						<label for="nom">Nom</label> <input type="text"
							class="form-control" id="nom" name="nom"
							value=<%=user.getNom()%> disabled>
					</div>
					<div class="form-group">
						<label for="prenom">Prénom</label> <input type="text"
							class="form-control" id="prenom" name="prenom"
							value=<%=user.getPrenom()%> disabled>
					</div>
					<div class="form-group">
						<label for="role">Role</label> <input type="text"
							class="form-control" id="role" name="role"
							value=<%=user.getRole()%> disabled>
					</div>
					<div class="form-group">
						<label for="password">Password</label> <input type="text"
							class="form-control" id="password" name="password"
							value=<%=user.getMotdepasse()%> disabled>
					</div>
					<div class="form-group" >
						<label for="email">Email</label> <input type="email"
							class="form-control" id="email" name="email"
							aria-describedby="emailHelp" value=<%=user.getEmail()%> disabled>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>