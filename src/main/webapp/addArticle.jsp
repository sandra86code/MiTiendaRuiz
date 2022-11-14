<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="javax.servlet.http.HttpSession" %>
<%@ page import ="com.jacaranda.model.Category" %>
<%@ page import ="com.jacaranda.control.DaoCategory" %>
<%@ page import ="java.util.Iterator" %>
<%@ page import ="java.util.ArrayList" %>
 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Appify - Añadir producto</title>
<link rel="stylesheet" href="css/addarticle_style.css">

</head>
<body>
	<% 
	HttpSession session = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("nick");
	if(isSession != null && userSession !=null && isSession.equals("True")){
		String genre = request.getParameter("genre");
	%>

	
		<div class="wrapper">
			<div class="close_session">
				<input type="button" onclick="location.href='index.jsp';" value="Volver al login" />
			</div>
			<div class="page_name">
				<img src="img/logo.png"/>
			</div>
			<div class="user_name">
				<%
				String nick = request.getParameter("nick");
				if(nick!=null) {
					%>
					<p>Usuario: <%=nick%></p>
					<p>Rol: <i>admin</i></p>
				<%
				}
				%>
			</div>
			<div class="content">
				<div class="login">
					<div class="login_title">
						<h1>Añadir artículo</h1>
					</div>
					<div class="form">
						<form class="login_form" id="loginForm" action="addArticlePersist.jsp?nick=<%=nick%>" method="post">
							<label class="login_label" for="category">Categoría</label>
							<select name="category" required>
							<%
							ArrayList<Category> categories = DaoCategory.getCategories();
							if(categories!=null) {
								%>
								<option disabled>--Elige una categoría--</option>
								<%
								Iterator<Category> it = categories.iterator();
								while(it.hasNext()){
									Category c = it.next();
									%>
									<option value="<%=c.getCod()%>"><%=c.getName()%></option>
									<%
								}
							}
							%>
							</select>
							<label class="login_label" for="name">Nombre del artículo</label>
							<input type="text" minlength="2" maxlength="50" placeholder="Introduce el nombre del artículo" name="name" required>
							<label class="login_label" for="description">Descripción del artículo</label>
							<textarea minlength="2" maxlength="120" name="description" required></textarea>
							<label class="login_label" for="price">Precio del artículo</label>
							<input type="number" name="price" min='0.01' step="0.01" required><br>
							<label class="login_label" for="image">Imagen (bmp, jpg, png)</label>
							<input type="file" name="image" accept=".bmp, .jpg, .png" required><br>
							<button type="submit" id="loginButton" class="login_button">Enviar</button>
							<button type="reset" id="resetButton" class="login_button">Borrar</button>
						</form>
					</div>
				</div>
			</div>
	</div>
	<%}else {%>
	<jsp:forward
		page="error.jsp?msg='No te has autenticado'"></jsp:forward>
<%}%>

</body>
</html>