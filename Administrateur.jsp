<%@page import="projet.dao.imp.UtilisateurDaoImp"%>
<%@page import="projet.beans.Utilisateur"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html>
<html>
<%
	UtilisateurDaoImp userD = new UtilisateurDaoImp();
	Utilisateur user = (Utilisateur)session.getAttribute("Utilisateur");
    List<Utilisateur> users=userD.getAllUsers();
%>
<head>
<meta charset="ISO-8859-1">
<title>Accueil</title>
<link rel="stylesheet" type="text/css" href="cssBot/bootstrap.min.css"/>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark" >
  <a class="navbar-brand" href="#"><h1 class="display-4">Bienvenue à e-Projet</h1></a>
  
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
<body>
				<%
				if (request.getAttribute("erreurDeleteUser") != null) {
				%>
				<div class="alert alert-danger" role="alert"><%=request.getAttribute("erreurLogin")%></div>
				<%
					}
				%>
 <h3 align="center" class="display-4">Liste des Utilisateurs</h3>
<table class="table table-borderless table-dark">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Nom</th>
      <th scope="col">Prenom</th>
      <th scope="col">Email</th>
      <th scope="col">Role</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <%
      for(Utilisateur us:users){
  %>
  <tbody>
    <tr>
      <td><%=us.getIdUt()%></td>
      <td><%=us.getNom()%></td>
      <td><%=us.getPrenom()%></td>
      <td><%=us.getEmail()%></td>
      <td><%=us.getRole()%></td>
      <td>
      	<form action="EditerUser.jsp">
      		<input type="hidden"  name="idUt" value="<%=us.getIdUt()%>">
      		<input class="btn btn-primary" type="submit" value="Editer" >
      	</form>
      </td>
      <td>
        <form method="post" action="DeleteUserServlet">
      		<input type="hidden"  name="idUt" value="<%=us.getIdUt()%>">
      		<input class="btn btn-danger" type="submit" value="Delete" >
      	</form>
      </td>
    </tr>
    <%
    }
    %>
  </tbody>
</table>
</body>
</html>