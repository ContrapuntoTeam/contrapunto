<%@ page import="tp.contrapunto.Item" %>



<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="item.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${itemInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'contrapunto', 'error')} required">
	<label for="contrapunto">
		<g:message code="item.contrapunto.label" default="Contrapunto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="contrapunto" name="contrapunto.id" from="${tp.contrapunto.Contrapunto.list()}" optionKey="id" required="" value="${itemInstance?.contrapunto?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'imagenUrl', 'error')} ">
	<label for="imagenUrl">
		<g:message code="item.imagenUrl.label" default="Imagen Url" />
		
	</label>
	
      <input type="file" id="payload" name="payload"/>
	
</div>

