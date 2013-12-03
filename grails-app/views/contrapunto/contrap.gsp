<%@ page import="tp.contrapunto.Item" %><!--Si no ponemos esta linea no reconoce la clase Item-->
<%@ page import="tp.contrapunto.Contrapunto" %>
<%@ page import="tp.contrapunto.ContrapuntoController"%>
<!DOCTYPE html>
<html>
	<head>
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
	<script src="../js/jquery-2.0.3.min.js" type="text/javascript"></script>
		<script language="javascript">
			$(document).ready(function(){$("div[id ^= tupla]").hide();$("#tupla1").show(); });
			function DarPuntos(IdItem,cont,IdContrap,lista){
			
			$.ajax({
			  url: "../puntosItem/save",
			  type: "GET",
			  async: false,
			  data: { idItem : IdItem, idContrapunto : IdContrap },
			  dataType: "text",
			  success: function(datos){
			     alert("ok! "+datos);
			     mostrar(cont,lista);
			  },
			  error: function(){
			     alert("Error");
			
			  }
			});
			
			}
			
			function mostrar(cont,lista){
			  //oculto a todos los demas
			  $("div[id ^= tupla]").hide();
			  cont++;
			  $("#tupla"+cont).show();
			  if(cont > lista)
				  {
					location="../../Tp-Contrapunto/";
				  }
			}

</script>
	</head>
<body>
	<div id="todo">

		<div id="encabezado">
			<div id="divImgEncabezado" class="contenidoEncabezado">
				<img src="${resource(dir: 'images', file: 'logo.jpg')}" width="210" height="66px">
			</div>
			<div id="menu">
			<table>
				<tr>
					<td>
						<input type="image" href="#" src="${resource(dir: 'images', file: 'boton_inicio.png')}" width="74px" height="58px">
					</td>
					<td>
						<input type="image" href="#" src="${resource(dir: 'images', file: 'boton_miscontrapuntos.png')}" width="122px" height="58px">
					</td>
					<td>
						<input type="image" href="#" src="${resource(dir: 'images', file: 'boton_micuenta.png')}" width="74px" height="58px">
					</td>
				</tr>
			</table>
			</div>
		</div>
		<div id="adentro">
			<div id="votacionContrapuntosContenedor">
				<div id="divContrapunto">
					
				<% 
				def contr = [MiContr:Contrapunto.get(params.identif)]
				def lista = []
				%>
				
				<!-- guardo cada item en una lista -->
				<g:each var="item" in="${contr.MiContr.items}" status="indice">
					<%lista.add(item)%>
				</g:each>
				
				<% 
				  
				  int cont = 0
				   for (int i=0; i<lista.size(); i++){
                       for (int j=0; j<lista.size()-i-1; j++){ 
						   cont++ %>
                               <div id='tupla${cont}'>
							   <a href="javascript:DarPuntos(${lista[i].id},${cont},${contr.MiContr.id},${lista.size()});"><img src='../images/items/${lista[i].imagenUrl}'></a>
							   <a href="javascript:DarPuntos(${lista[j+i+1].id},${cont},${contr.MiContr.id},${lista.size()});"><img src='../images/items/${lista[j+i+1].imagenUrl}'></a>
							   </div>
	   					<% } 
                                                
                   }      
				  
                 %>
                 
                 </div>
                 <div id="divSaltarContrapunto">
                 	<input type="image" href="#" src="${resource(dir: 'images', file: 'boton_saltar.png')}" width="130px" height="47px">
                 </div>
                 <%-- 
                 <g:link controller="Contrapunto" action="ganador" params="[ItemID: lista[i].id, cantItems: lista.size()]"><g:img dir="images/items" file="${lista[i].imagenUrl}" width="250" height="250"/></g:link>
			   <g:link controller="Contrapunto" action="ganador" params="[ItemID: lista[j+i+1].id, cantItems: lista.size()]"><g:img dir="images/items" file="${lista[j+i+1].imagenUrl}" width="250" height="250"/></g:link>
                 --%>
                 
                 <%-- Lo que estaba dentro del for anidado
                 println "<div id='${lista[i].nombre}${lista[j+i+1].nombre}'><img src='../images/items/${lista[i].imagenUrl}'><img src='../images/items/${lista[j+i+1].imagenUrl}'>"
                 println "</div>";
                 --%>
                                
              <%--  <g:each var="item" in="${contr.MiContr.items}" status="i">
                	<g:if test="${i < lista.size()}">
                		<g:each var="item2" in="${contr.MiContr.items}" status="j">
                			<g:if test="${j < lista.size()-i-1 && i!=j}">
                				
                				${item.nombre}-${item2.nombre}
                			</g:if>
                		</g:each>
                	</g:if>
                </g:each>--%>
				
				
				<%-- 
				<g:each var="item" in="${contr.MiContr.items}" status="indice"> 
					<li><g:link controller="Contrapunto" action="ganador" params="[identificador: indice + 1]">${item.nombre}</g:link></li>
				</g:each>
				--%>
				 
			
			
			
			<%-- Ya está cargando los items dinámicamente y no hace falta hardcodearlos 
			
			<g:link controller="Contrapunto" action="ganador" params="[identificador: '1']">
				<g:img dir="images/items" file="coca.jpg"/>
			</g:link>
			
			<g:link controller="Contrapunto" action="ganador" params="[identificador: '2']">
				<g:img dir="images/items" file="pepsi.jpg"/>
			</g:link>
			
			 --%>
			 </div>
		</div>
		</div>
	</body>
</html>
