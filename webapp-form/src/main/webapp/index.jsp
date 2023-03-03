<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%
    Map<String,String> errores = (Map<String,String>)request.getAttribute("errores");

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Formulario de usuarios</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<h3>Formulario de usuarios</h3>
<div class="px-5">

<% if(errores != null && errores.size()>0){%>
    <ul class="alert alert-danger px-5" >
       <% for(String error: errores.values()){%>
        <li><%=error%></li>
       <%}%>
    </ul>
  <%}%>
</div>
<div class="px-5">

<form action="/webapp-form/registro" method="post">
    <!-- Utilizamos post porque no quermeos mostrar los datos en el url-->

    <div class="row mb-3">
        <label for="username" class="col-form-label col-sm-2">Nombre de usuario</label>
        <div class="col-sm-4">
        <input type="text" name="username" id="username" class="form-control" value="${param.username}"></div>
        <%if(errores!=null && errores.containsKey("username")){
            out.println("<small class='alert alert-danger'>"  +errores.get("username") + "</small>");
        }%>
    </div>
    <div class="row mb-3">
        <label for="password" class="col-form-label col-sm-2">Contreseña</label>
        <div class="col-sm-4"><input type="password" name="password" id="password" class="form-control"></div>
        <%if(errores!=null && errores.containsKey("password")){
                    out.println("<small class='alert alert-danger'>"  +errores.get("password") + "</small>");
        }%>
    </div>
    <div class="row mb-3">
        <label for="email" class="col-form-label col-sm-2">Correo electrónico</label>
        <div class="col-sm-4">
        <input type="email" name="email" id="email" class="form-control" value="${param.email}"></div>
        <%if(errores!=null && errores.containsKey("email")){
                     out.println("<small class='alert alert-danger'>"  +errores.get("email") + "</small>");
         }%>
    </div>
    <div class="row mb-3">
        <label for="pais" class="col-form-label col-sm-2">País</label>
        <div class="col-sm-4">
            <select name="pais" id="pais" class="form-select">
                <option value="">Seleccionar</option>
                <option value="ES" ${param.pais.equals("ES")? "selected": ""}>España</option>
                <option value="MX" ${param.pais.equals("MX")? "selected": ""}>México</option>
                <option value="CL" ${param.pais.equals("CL")? "selected": ""}>Chile</option>
                <option value="AR" ${param.pais.equals("AR")? "selected": ""}>Argentina</option>
                <option value="PE" ${param.pais.equals("PE")? "selected": ""}>Perú</option>
                <option value="CO" ${param.pais.equals("CO")? "selected": ""}>Colombia</option>
                <option value="VE" ${param.pais.equals("VE")? "selected": ""}>Venezuela</option>
            </select>
        </div>
        <%if(errores!=null && errores.containsKey("pais")){
             out.println("<small class='alert alert-danger'>"  +errores.get("pais") + "</small>");
        }%>
    </div>

    <div class="row mb-3">
        <label for="lenguajes" class="col-form-label col-sm-2">Lenguajes de programación</label>
        <div class="col-sm-4">
            <select name="lenguajes" id="lenguajes" multiple class="form-select">
                <option value="java" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("java")).get()?"selected":""}>Java</option>
                <option value="jakartaee" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("jakartaee")).get()?"selected":""}>Jakarta EE9</option>
                <option value="spring" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("spring")).get()?"selected":""}>Spring Boot</option>
                <option value="js" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("js")).get()?"selected":""}>JavaScript</option>
                <option value="react" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("react")).get()?"selected":""}>React</option>
            </select>
        </div>
        <%if(errores!=null && errores.containsKey("lenguajes")){
             out.println("<small class='alert alert-danger'>"  +errores.get("lenguajes") + "</small>");
        }%>
    </div>
    <div class="row mb-3">
        <label  class="col-form-label col-sm-2">Roles</label>
        <div class="form-check col-sm-2">
            <input type="checkbox" name="roles"  value="ROLE_ADMIN" class="form-check-input"
            ${paramValues.roles.stream().anyMatch(v->v.equals("ROLE_ADMIN")).get()?"checked":""}>
            <label class="form-check-label">Administrador</label>
        </div>
        <div class="form-check col-sm-2">
            <input type="checkbox" name="roles"  value="ROLE_USER" class="form-check-input"
            ${paramValues.roles.stream().anyMatch(v->v.equals("ROLE_USER")).get()?"checked":""}>
            <label class="form-check-label">Usuario</label>
        </div>
        <div class="form-check col-sm-2">
            <input type="checkbox" name="roles"  value="ROLE_MODERATOR" class="form-check-input"
            ${paramValues.roles.stream().anyMatch(v->v.equals("ROLE_MODERATOR")).get()?"checked":""}>
            <label class="form-check-label">Moderador</label>
        </div>
         <%if(errores!=null && errores.containsKey("roles")){
                     out.println("<small class='alert alert-danger'>"  +errores.get("roles") + "</small>");
         }%>

    </div>
    <div class="row mb-3">
        <label class="col-form-label col-sm-2">Idioma preferido</label>
        <div class="form-check col-sm-2">
            <input type="radio" name="idioma" value="es" class="form-check-input" ${param.idioma.equals("es")? "checked": ""}>
            <label class="form-check-label">Español</label>
        </div>
        <div class="form-check col-sm-2">
            <input type="radio" name="idioma" value="en" class="form-check-input" ${param.idioma.equals("en")? "checked": ""}>
            <label class="form-check-label">Inglés</label>
        </div>
        <div class="form-check col-sm-2">
            <input type="radio" name="idioma" value="fr" class="form-check-input" ${param.idioma.equals("fr")? "checked": ""}>
            <label class="form-check-label">Frances</label>
        </div>
         <%if(errores!=null && errores.containsKey("idioma")){
                     out.println("<small class='alert alert-danger'>"  +errores.get("idioma") + "</small>");
                }%>

    </div>
             <div class="row mb-3">
                <label for="habilitar" class="col-form-label col-sm-2">Habilitar</label>
                <div class="form-check">
                    <input type="checkbox" name="habilitar" id="habilitar" checked class="form-check-input">
                </div>
            </div>
    <div class="row mb-3">
      <div>
        <input type="submit" value="Enviar" class="btn btn-primary">
      </div>
    </div>
    <input type="hidden" value="12345" name="secreto">
</form>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

</body>
</html>