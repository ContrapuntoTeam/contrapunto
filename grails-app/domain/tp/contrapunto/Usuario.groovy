package tp.contrapunto

class Usuario {
	
	String nombre
	String nick
	String password
	String email
	Date fechaNacimiento
	String sexo
	Integer edad
	Integer puntaje
	
	static HasMany=[contrpunto:Contrapunto]

    static constraints = {
		 nombre(blank:false, maxSize:10)
		 nick(blank:false, maxSize:10)
		 password(password:true)
		 email(email:true)
		//fechaNacimiento (validator:(return(it < new Date())))
		 //sexo(inList["M","F"])
		 edad(range: 18..65)
		 puntaje(nullable:false)
    }
}
