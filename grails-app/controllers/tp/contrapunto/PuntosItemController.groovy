package tp.contrapunto

class PuntosItemController {
	
	def save() {
		def puntosItemInstance = new PuntosItem(params)
		puntosItemInstance.puntos += 1
		if (!puntosItemInstance.save(flush: true)) {
			//render(view: "contrap", model: [puntosItemInstance: puntosItemInstance])
			return
		}

		//flash.message = message(code: 'default.created.message', args: [message(code: 'contrapunto.label', default: 'Contrapunto'), contrapuntoInstance.id])
		//redirect(action: "show", id: contrapuntoInstance.id)
		
		render "ok"
	}

    def index() {
		render "ok"
	}
	
	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def c = PuntosItem.createCriteria()
		def lista = c.list(params){
			projections{
				groupProperty("idItem","item")
				groupProperty("idContrapunto","id")
				sum("puntos","total")
			}
			
		}
		[puntosItemInstanceList: lista, puntosItemInstanceTotal: PuntosItem.count()]
	}
}
