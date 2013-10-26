
<%@ page import="tp.contrapunto.Contrapunto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contrapunto.label', default: 'Contrapunto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-contrapunto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-contrapunto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list contrapunto">
			
				<g:if test="${contrapuntoInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="contrapunto.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${contrapuntoInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contrapuntoInstance?.cantidadItems}">
				<li class="fieldcontain">
					<span id="cantidadItems-label" class="property-label"><g:message code="contrapunto.cantidadItems.label" default="Cantidad Items" /></span>
					
						<span class="property-value" aria-labelledby="cantidadItems-label"><g:fieldValue bean="${contrapuntoInstance}" field="cantidadItems"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contrapuntoInstance?.categoria}">
				<li class="fieldcontain">
					<span id="categoria-label" class="property-label"><g:message code="contrapunto.categoria.label" default="Categoria" /></span>
					
						<span class="property-value" aria-labelledby="categoria-label"><g:fieldValue bean="${contrapuntoInstance}" field="categoria"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contrapuntoInstance?.items}">
				<li class="fieldcontain">
					<span id="items-label" class="property-label"><g:message code="contrapunto.items.label" default="Items" /></span>
					
						<g:each in="${contrapuntoInstance.items}" var="i">
						<span class="property-value" aria-labelledby="items-label"><g:link controller="item" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${contrapuntoInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="contrapunto.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${contrapuntoInstance?.usuario?.id}">${contrapuntoInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${contrapuntoInstance?.id}" />
					<g:link class="edit" action="edit" id="${contrapuntoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
