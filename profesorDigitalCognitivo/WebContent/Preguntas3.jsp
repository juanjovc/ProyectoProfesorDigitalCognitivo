<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import = "logicaDeNegocios.dao.DaoPregunta"%>
<%@ page import = "logicaDeNegocios.dto.DtoPregunta"%>
<html>
<head>

    <title>Preguntas</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" media="screen" href="css/style.css">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
</head>

</style>
<body>	
	<% DaoPregunta listaP=new DaoPregunta();
	 DtoPregunta pregunta=new DtoPregunta();
	 String SubtemaActual=session.getAttribute("DescripcionSubtema").toString();
	 String TemaActual=session.getAttribute("DescripcionTema").toString();%>
	<header>
		<div class="main">
			<div class="wrap">
		       		<h2 class=fuenteletra8>Preguntas del<a class="fuenteLetra3"> Subtema</a></h2>
	 		</div>
      
      
      <div class="contenido" ></hr>
      <a href="registrarPregunta.jsp"><button type="button" name="agregarPregunta" class="btn btn-primary">Agregar Pregunta</button></a>   
	<div class="row">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4>
            Preguntas 
          </h4>
        </div>
        <table class="table table-fixed" >
        	<thead>
            <tr>

              <th class="col-xs-2">Pregunta</th>
              <th class="col-xs-3">Tipo</th>
              <th class="col-xs-3">Descripción de Ayuda</th>
              <th class="col-xs-3">Opciones</th>
            </tr>
          </thead>
          <tbody>
          	<tr>
				<% for(int i=0; i<listaP.listarPreguntaSubtema(SubtemaActual,TemaActual).size();i++){
					pregunta=listaP.listarPreguntaSubtema(SubtemaActual,TemaActual).get(i);
				%>
									<td><%=pregunta.getPregunta() %> </td>
									<td><%=pregunta.getDescripcionPregunta() %> </td>
									<td><%=pregunta.getDescripcionAyuda() %> </td>
									<td>  
										<form method="POST" action="/ServletPregunta">
											<button type="submit" name="modificarPregunta"> <span class="glyphicon glyphicon-pencil"></span></button>
											<button type="submit" name="eliminarPregunta"> <span class="glyphicon glyphicon-trash"></span></button>
											<button> <span class="glyphicon glyphicon-plus"></span></button>
											<input type="hidden" value="<%=pregunta.getPregunta()  %>" name="DescripcionPreguntaActual">
										</form>
									</td>
        				</tr>
        				<%
        					}
        				 %>
        			</tbody>
		        </table>
		        </div>
		      </div>
		  </div>
      </div>
	</header>
</body>
</html>