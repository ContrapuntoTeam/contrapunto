package tp.contrapunto

class Contrapunto {
	
	static belongsTo = [usuario:tp.contrapunto.Usuario]
	static hasMany = [items:Item]
	
	String titulo
	String categoria
	Integer cantidadItems

    static constraints = {
		titulo (blank:false, unique:true, nullable: false)
    }
	
	String toString(){
		
		return "${titulo}"
	}
	
}

