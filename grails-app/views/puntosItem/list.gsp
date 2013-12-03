
<%@ page import="tp.contrapunto.PuntosItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'puntosItem.label', default: 'PuntosItem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-puntosItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				
			</ul>
		</div>
		<div id="list-puntosItem" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="idContrapunto" title="${message(code: 'puntosItem.idContrapunto.label', default: 'Id Contrapunto')}" />
					
						<g:sortableColumn property="idItem" title="${message(code: 'puntosItem.idItem.label', default: 'Id Item')}" />
					
						<g:sortableColumn property="puntos" title="${message(code: 'puntosItem.puntos.label', default: 'Puntos')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${puntosItemInstanceList}" status="i" var="puntosItemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>${puntosItemInstance[1]}</td>

						<td>${puntosItemInstance[0]}</td>

						<td>${puntosItemInstance[2]}</td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${puntosItemInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
