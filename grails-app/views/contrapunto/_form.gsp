<%@ page import="tp.contrapunto.Contrapunto" %>



<div class="fieldcontain ${hasErrors(bean: contrapuntoInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="contrapunto.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" required="" value="${contrapuntoInstance?.titulo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contrapuntoInstance, field: 'cantidadItems', 'error')} required">
	<label for="cantidadItems">
		<g:message code="contrapunto.cantidadItems.label" default="Cantidad Items" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidadItems" type="number" value="${contrapuntoInstance.cantidadItems}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: contrapuntoInstance, field: 'categoria', 'error')} ">
	<label for="categoria">
		<g:message code="contrapunto.categoria.label" default="Categoria" />
		
	</label>
	<g:textField name="categoria" value="${contrapuntoInstance?.categoria}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contrapuntoInstance, field: 'items', 'error')} ">
	<label for="items">
		<g:message code="contrapunto.items.label" default="Items" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${contrapuntoInstance?.items?}" var="i">
    <li><g:link controller="item" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="item" action="create" params="['contrapunto.id': contrapuntoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'item.label', default: 'Item')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: contrapuntoInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="contrapunto.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${tp.contrapunto.Usuario.list()}" optionKey="id" required="" value="${contrapuntoInstance?.usuario?.id}" class="many-to-one"/>
</div>

