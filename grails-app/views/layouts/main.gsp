<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<!-- <div id="grailsLogo" role="banner"><a href="http://grails.org"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails"/></a></div> -->
		
		<!-- Linea modificada -->
	<div id="todo">

		<div id="encabezado">
			<div id="divImgEncabezado" class="contenidoEncabezado">
				<img src="${resource(dir: 'images', file: 'logo.jpg')}" width="210" height="66px">
			</div>
			<div id="menu">
			<table>
				<tr>
					<td>
						<a href="/Tp-Contrapunto/"><img src="${resource(dir: 'images', file: 'boton_inicio.png')}" width="74px" height="58px"/></a>
					</td>
					<td>
						<g:link href="#" controller="contrapunto" action="index"><img src="${resource(dir: 'images', file: 'boton_miscontrapuntos.png')}" width="122px" height="58px"/></g:link>
					</td>
					<td>
						<g:link href="#" controller="usuario" action="index"><img src="${resource(dir: 'images', file: 'boton_micuenta.png')}" width="74px" height="58px"/></g:link>
					</td>
					<td>
						<g:link href="#" controller="login" action="auth"><img src="${resource(dir: 'images', file: 'boton_acceder.jpg')}" width="123px" height="44px"/></g:link>
					</td>
				</tr>
			</table>
			</div>
		</div>
		<div id="adentro">
			
		<g:layoutBody/>
		<g:javascript library="application"/>
		<r:layoutResources />
		</div>
		<div id="pie">
			<p>Powered by Charly and the grails factory ;)</p><br/>
		</div>
</div>
	</body>
</html>
