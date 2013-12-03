<%@ page import="tp.contrapunto.Contrapunto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
		<!-- 
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		 -->		
		
	</head>
	<body>

			<div id="principalesContenedor">
				<div id="TituloPrincipales">
					TOP 10
				</div>
				<g:each var="c" in="${Contrapunto.list()}" status="indice">
					<div class="principales">
						<div class="principalesLadoIzq"> </div>
						<div class="principalesCentro">
							<div class="tituloTop"><g:link controller="Contrapunto" action="contrap" params="[identif: indice + 1]">${c.titulo}</g:link></div>
							<div class="progresoTop"></div>
							<div class="verResultadosLink"><g:link controller="puntosItem" action="list">Ver Resultados</g:link></div>
						</div>
						<div class="principalesLadoDer"> </div>
					</div>
					
				</g:each>
				
			</div>
			<!-- 
			<div id="categoriasContenedor">
				<div id="Categorias">
					<div class="categoriasBordeSup"></div>
					<div class="categoriasCentro">
					
					<ul>
					<li>TOP Contrapuntos</li>
				<g:each var="c" in="${Contrapunto.list()}" status="indice">
					<li><g:link controller="Contrapunto" action="contrap" params="[identif: indice + 1]">${c.titulo}</g:link></li>
				</g:each>
			
					</ul>
					</div>
					<div class="categoriasBordeInf"></div>
				</div>
			</div>
			 -->
	

		
			
	</body>
</html>
