<%@page import="projet.dao.imp.TacheDaoImp"%>
<%@page import="projet.beans.Tache"%>
<%@page import="projet.beans.Utilisateur"%>
<%@page import="projet.dao.imp.UtilisateurDaoImp"%>
<%@page import="java.util.Set"%>

<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html>
<html>
<%
	TacheDaoImp tacheD = new TacheDaoImp();
	Utilisateur user = (Utilisateur) session.getAttribute("Utilisateur");
	Set<Tache> taches =tacheD.getAllTachesUser(user.getIdUt());

%>
<head>
<meta charset="ISO-8859-1">
<title>Accueil</title>
<link rel="stylesheet" type="text/css" href="cssBot/bootstrap.min.css"/>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#"><h1 class="display-4">Bienvenue à e-Projet</h1></a>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="nav navbar-nav ml-auto w-100 justify-content-end">
			 <li class="nav-item"><a class="nav-link"
				href="ChefDeProjet.jsp">Employé : <%=user.getNom()%> et <%=user.getPrenom()%></a>
			</li> 
			<li class="nav-item"><a class="nav-link"
				href="UserProfile.jsp">Mon profile</a></li>
			<li class="nav-item"><a class="nav-link"
				href="LogOutServlet">Déconnecter</a></li>
		</ul>
	</div>
</nav>
<body>
			
 <h3 align="center">Liste de mes Taches</h3>
<table class="table table-borderless table-dark">
  <thead>
    <tr>
      <th scope="col">Numero</th>
      <th scope="col">Description</th>
      <th scope="col">Duree</th>
      <th scope="col">Statut</th>
      <th scope="col">Date Debut</th>
      <th scope="col">Date Fin</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <%
      for(Tache ta:taches){
  %>
  <tbody>
    <tr>
      <td><%=ta.getIdTa()%></td>
      <td><%=ta.getDescription()%></td>
      <td><%=ta.getDuree()%></td>
      <td><%=ta.getStatut()%></td>
      <td><%=ta.getDateDebut()%></td>
      <td><%=ta.getDateFin()%></td>
      <td><form action="EditerTache.jsp">
      		<input type="hidden"  name="idTa" value="<%=ta.getIdTa()%>">
      		<input class="btn btn-primary" type="submit" value="Editer" >
      	</form>
      </td>
      <td>
        <form action="DeleteUserServlet">
      		<input type="hidden"  name="idTa" value="<%=ta.getIdTa()%>">
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