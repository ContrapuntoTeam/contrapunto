class BootStrap {

    def init = { servletContext ->
		
			def Carlos = new tp.contrapunto.Usuario(nombre: "Carlos",
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
