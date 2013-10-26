
<%@ page import="tp.contrapunto.Contrapunto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contrapunto.label', default: 'Contrapunto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-contrapunto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-contrapunto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="titulo" title="${message(code: 'contrapunto.titulo.label', default: 'Titulo')}" />
					
						<g:sortableColumn property="cantidadItems" title="${message(code: 'contrapunto.cantidadItems.label', default: 'Cantidad Items')}" />
					
						<g:sortableColumn property="categoria" title="${message(code: 'contrapunto.categoria.label', default: 'Categoria')}" />
					
						<th><g:message code="contrapunto.usuario.label" default="Usuario" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contrapuntoInstanceList}" status="i" var="contrapuntoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contrapuntoInstance.id}">${fieldValue(bean: contrapuntoInstance, field: "titulo")}</g:link></td>
					
						<td>${fieldValue(bean: contrapuntoInstance, field: "cantidadItems")}</td>
					
						<td>${fieldValue(bean: contrapuntoInstance, field: "categoria")}</td>
					
						<td>${fieldValue(bean: contrapuntoInstance, field: "usuario")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contrapuntoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
