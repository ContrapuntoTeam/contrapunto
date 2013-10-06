package tp.contrapunto

class Contrapunto {
	
	String titulo
	String categoria
	Integer cantidadOpciones
    String opciones
	static BelongsTo=[usuario:Usuario]
	

    static constraints = {
		titulo (blank:false, unique:true, nullable: false)
    }
}
