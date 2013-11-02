<%@ page import="tp.contrapunto.Item" %><!--Si no ponemos esta linea no reconoce la clase Item-->
<%@ page import="tp.contrapunto.Contrapunto" %>
<!DOCTYPE html>
<html>
	<head>
		
	</head>
	<body>
		<div>
			<ul>
				<% 
				def contr = [MiContr:Contrapunto.get(params.identif)]
				def lista = []
				%>
				
				<!-- guardo cada item en una lista -->
				<g:each var="item" in="${contr.MiContr.items}" status="indice">
					<%lista.add(item)%>
				</g:each>
				
				
				<% for (int i=0; i<lista.size()-1; i++){
						println "bucle nro" + i 
						for (int j=1; j<lista.size(); j++){
							println "${lista[i].nombre} - ";
							println "${lista[j].nombre}\\ ";
							
						}
						lista.remove(lista[i])
					}	
				%>
				
				
				<!-- 
				<g:each var="item" in="${contr.MiContr.items}" status="indice"> 
					<li><g:link controller="Contrapunto" action="ganador" params="[identificador: indice + 1]">${item.nombre}</g:link></li>
				</g:each>
				-->
				 
			</ul>
			
			
			<!-- Ya está cargando los items dinámicamente y no hace falta hardcodearlos 
			
			<g:link controller="Contrapunto" action="ganador" params="[identificador: '1']">
				<g:img dir="images/items" file="coca.jpg"/>
			</g:link>
			
			<g:link controller="Contrapunto" action="ganador" params="[identificador: '2']">
				<g:img dir="images/items" file="pepsi.jpg"/>
			</g:link>
			
			 -->
		</div>
	</body>
</html>
