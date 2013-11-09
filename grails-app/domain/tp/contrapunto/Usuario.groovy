package tp.contrapunto

class Usuario {

	transient springSecurityService
	static hasMany = [contrapunto:tp.contrapunto.Contrapunto]
	
	String nombre
	String nick
	String email
	Date fechaNacimiento
	String sexo
	Integer edad
	Integer puntaje
	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
		username blank: false, unique: true
		password blank: false
		nombre(blank:false, maxSize:10)
		nick(blank:false, maxSize:10)
		password(password:true)
		email(email:true)
	   //fechaNacimiento (validator:(return(it < new Date())))
		//sexo(inList["M","F"])
		edad(range: 18..65)
		puntaje(nullable:false)
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Rol> getAuthorities() {
		UsuarioRol.findAllByUsuario(this).collect { it.rol } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
