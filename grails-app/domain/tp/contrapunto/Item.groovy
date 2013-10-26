package tp.contrapunto

class Item {
	static belongsTo=[contrapunto:Contrapunto]
	
	String nombre
	
	
	
    static constraints = {
		nombre (blank:false, unique:true, nullable: true)
		
		}
}
