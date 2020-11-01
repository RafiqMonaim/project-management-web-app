<%@page import="projet.beans.Utilisateur"%>
<%@page import="projet.dao.imp.UtilisateurDaoImp"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%!
	UtilisateurDaoImp userD = new UtilisateurDaoImp();
%>
<% 	
	Utilisateur user = (Utilisateur)session.getAttribute("Utilisateur");
	user = userD.findById(Integer.parseInt(request.getParameter("idUt")));
 %>
<head>
<meta charset="ISO-8859-1">
<title>Profil Administrateur</title>
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
		<div class="container">
			<div class="row">
				<div class="col-6">
				<%
					if (request.getAttribute("erreurUpdateEmploye") != null) {
				%>
				<div class="alert alert-danger" role="alert"><%=request.getAttribute("erreurUpdateEmploye")%></div>
				<%
					}
				%>
					<form method="post" action="ModifierUserServlet">
						<fieldeset>
						<h1>Bienvenue à e-Projet</h1>
						<div class="form-group">
							<label for="Id">ID</label> <input type="text"
								class="form-control" id="iD" name="id"
								value=<%=user.getIdUt()%> readonly>
						</div>
						<div class="form-group">
							<label for="nom">Nom</label> <input type="text"
								class="form-control" id="nom" name="nom"
								value=<%=user.getNom()%> >
						</div>
						<div class="form-group">
							<label for="prenom">Prénom</label> <input type="text"
								class="form-control" id="prenom" name="prenom"
								value=<%=user.getPrenom()%> >
						</div>
						<div class="form-group">
							<label for="role">Role</label> <input type="text"
								class="form-control" id="role" name="role"
								value=<%=user.getRole()%> >
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="text"
								class="form-control" id="password" name="password"
								value=<%=user.getMotdepasse()%> >
						</div>
						<div class="form-group">
							<label for="email">Email</label> <input type="email"
								class="form-control" id="email" name="email"
								aria-describedby="emailHelp" value=<%=user.getEmail()%> >
						</div>
						<button type="submit" class="btn btn-primary btn-lg disabled" tabindex="-1" >Editer</button>			
						</fieldeset>
					</form>
				</div>
			</div>
		</div>
</body>
</html>