<%@page import="projet.dao.imp.ProjetDaoImp"%>
<%@page import="projet.beans.Projet"%>
<%@page import="projet.beans.Utilisateur"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html>
<html>
<%
	ProjetDaoImp prjD = new ProjetDaoImp();
	Utilisateur user = (Utilisateur) session.getAttribute("Utilisateur");
    List<Projet> prjs=prjD.getProjets();
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
				href="Administrateur.jsp">Chef de Projet: <%=user.getNom()%> et <%=user.getPrenom()%></a>
			</li> 
			<li class="nav-item"><a class="nav-link"
				href="Authentification.jsp">Mon profile</a></li>
			<li class="nav-item"><a class="nav-link"
				href="LogOutServlet">Déconnecter</a></li>
		</ul>
	</div>
</nav>
<body>
 <h3 align="center" class="display-4">Liste de mes Projets</h3>
<table class="table table-borderless table-dark">
  <thead>
    <tr>
      <th scope="col">Code</th>
      <th scope="col">Initule</th>
      <th scope="col">Description</th>
      <th scope="col">Statut</th>
      <th scope="col">Charge Horaire</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <%
      for(Projet prj:prjs){
  %>
  <tbody>
    <tr>
      <td><%=prj.getCodeP()%></td>
      <td><%=prj.getIntitule()%></td>
      <td><%=prj.getDescription()%></td>
      <td><%=prj.getStatut()%></td>
      <td><%=prj.getChargeHoraire()%></td>
      <td><form action="Authentification.jsp">
      		<input type="hidden"  name="codeP" value="<%=prj.getCodeP()%>">
      		<input class="btn btn-primary" type="submit" value="Editer" >
      	</form>
      </td>
      <td>
        <form action="Authentification.jsp">
      		<input type="hidden"  name="codeP" value="<%=prj.getCodeP()%>">
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