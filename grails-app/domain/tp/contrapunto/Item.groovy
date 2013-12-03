package tp.contrapunto

class Item {
	static belongsTo=[contrapunto:Contrapunto]
	
	String nombre
	String imagenUrl
	
    static constraints = {
		nombre (blank:false, unique:true, nullable: true)
		imagenUrl(blank:true, nullable:true)
		}
}

