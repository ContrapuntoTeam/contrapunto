<%@ page import="tp.contrapunto.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="usuario.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="10" required="" value="${usuarioInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nick', 'error')} required">
	<label for="nick">
		<g:message code="usuario.nick.label" default="Nick" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nick" maxlength="10" required="" value="${usuarioInstance?.nick}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="usuario.password.label" default="Password" />
		
	</label>
	<g:field type="password" name="password" value="${usuarioInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="usuario.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${usuarioInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'edad', 'error')} required">
	<label for="edad">
		<g:message code="usuario.edad.label" default="Edad" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="edad" from="${18..65}" class="range" required="" value="${fieldValue(bean: usuarioInstance, field: 'edad')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'puntaje', 'error')} required">
	<label for="puntaje">
		<g:message code="usuario.puntaje.label" default="Puntaje" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="puntaje" type="number" value="${usuarioInstance.puntaje}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'contrapunto', 'error')} ">
	<label for="contrapunto">
		<g:message code="usuario.contrapunto.label" default="Contrapunto" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${usuarioInstance?.contrapunto?}" var="c">
    <li><g:link controller="contrapunto" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="contrapunto" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'contrapunto.label', default: 'Contrapunto')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'fechaNacimiento', 'error')} required">
	<label for="fechaNacimiento">
		<g:message code="usuario.fechaNacimiento.label" default="Fecha Nacimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaNacimiento" precision="day"  value="${usuarioInstance?.fechaNacimiento}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'sexo', 'error')} ">
	<label for="sexo">
		<g:message code="usuario.sexo.label" default="Sexo" />
		
	</label>
	<g:textField name="sexo" value="${usuarioInstance?.sexo}"/>
</div>

