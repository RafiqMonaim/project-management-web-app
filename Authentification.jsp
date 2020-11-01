<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html>
<html>
<head>
<title>Authentification</title>
<link rel="stylesheet" type="text/css" href="cssBot/bootstrap.min.css"/>
</head>
<body>
<div class="container">
		<div class="row">
			<div class="col-6">
				<%
					if (request.getAttribute("erreurLogin") != null) {
				%>
				<div class="alert alert-danger" role="alert">Email ou mot de passe incorrecte</div>
				<%
					}
				%>
<form method=GET action="Authentification">
	<h1  class=center-block>Bienvenu à e-Projet</h1>
	<h3  class=center-block>Connectez-vous</h3>
	
  <div class="form-group"  class=center-block>
    <label for="exampleInputEmail1">Email</label>
    <input type="email" class="form-control" name="email" aria-describedby="emailHelp">
    <small id="emailHelp" class="form-text text-muted"></small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1" >Mot de Passe</label>
    <input type="password" class="form-control" name="password">
  </div>
  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Maintenir la connexion</label>
  </div>
  <button type="submit" class="btn btn-primary">Connexion</button>
</form>
</body>
</html>