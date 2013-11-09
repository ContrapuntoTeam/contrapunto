import tp.contrapunto.Rol
import tp.contrapunto.Usuario
import tp.contrapunto.UsuarioRol

class BootStrap {

    def init = { servletContext ->
		
		/*Spring security Core
		
		def adminRole = new Rol(authority: 'ROLE_ADMIN').save(flush: true)
		def userRole = new Rol(authority: 'ROLE_USER').save(flush: true)
  
		def testUser = new Usuario(username: 'me', enabled: true, password: 'password')
		testUser.save(flush: true)
  
		UsuarioRol.create testUser, adminRole, true
  
		assert Usuario.count() == 1
		assert Rol.count() == 2
		assert UsuarioRol.count() == 1
		
		
		
	-----------------------------------------------------------------------------------------------------------------------*/	
		
		def adminRole = new Rol(authority: 'ROLE_ADMIN').save(flush: true)
		def userRole = new Rol(authority: 'ROLE_USER').save(flush: true)
		
		
			def Carlos = new tp.contrapunto.Usuario(nombre: "Carlos",
									username: "Charlie",
									enabled: "true",
									nick: "Charlie",
									password: "12345",
									email: "example@hotmail.com",
									fechaNacimiento: (new Date() -100),
									sexo: "Masculino",
									edad: "21",
									puntaje: "0"
									)
			Carlos.save()
			if(Carlos.hasErrors()){println Carlos.errors}
			
			
			UsuarioRol.create Carlos, adminRole, true
			
			
			def Eze = new tp.contrapunto.Usuario(nombre: "Ezequiel",
				username: "eze",
				enabled: "true",
				nick: "eze",
				password: "12345",
				email: "example@hotmail.com",
				fechaNacimiento: (new Date() -100),
				sexo: "Masculino",
				edad: "24",
				puntaje: "0"
				)
			Eze.save()
			if(Eze.hasErrors()){println Eze.errors}
			
				  assert Usuario.count() == 2
				  assert Rol.count() == 2
				  assert UsuarioRol.count() == 1
				  
				  
			
			def Contrapunto1 = new tp.contrapunto.Contrapunto(titulo: "Gaseosas",
															categoria: "Productos",
															cantidadItems: 2,
															usuario: Carlos
															)
			Contrapunto1.save()
			if(Contrapunto1.hasErrors()){println Contrapunto1.errors}
			
			def Item1 = new tp.contrapunto.Item(identificador: 1,
												nombre: "Coca-Cola",
												contrapunto: Contrapunto1					
												)
			Item1.save()
			if(Item1.hasErrors()){println Item1.errors}
			
			def Item2 = new tp.contrapunto.Item(identificador: 2,
												nombre: "Pepsi",
												contrapunto: Contrapunto1
												)
			Item2.save()
			if(Item2.hasErrors()){println Item2.errors}

		}
    def destroy = {
    }
}
