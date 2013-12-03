package tp.contrapunto
import tp.contrapunto.Contrapunto
import tp.contrapunto.Item

import org.springframework.dao.DataIntegrityViolationException

class ContrapuntoController {
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def bandera = 0
	
	def listaConPuntos(){
		if(bandera == 0 ){
			def canItems = params.cantItems
			
		}
	}
	
	def ganador(){
		
		def mapa = [MiItem: params.ItemID]
			
		//def contr = [MiContr:Contrapunto.get(params.IdContr)]		
		//render "El ganador del contrapunto es: "+mapa.MiItem
		//mapa.each() { key, value -> render "${value}" };
	}
	

	
	def contrap(){
		
		render(view:"contrap")
	}

	
		
	def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [contrapuntoInstanceList: Contrapunto.list(params), contrapuntoInstanceTotal: Contrapunto.count()]
    }

    def create() {
        [contrapuntoInstance: new Contrapunto(params)]
    }

    def save() {
        def contrapuntoInstance = new Contrapunto(params)
        if (!contrapuntoInstance.save(flush: true)) {
            render(view: "create", model: [contrapuntoInstance: contrapuntoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'contrapunto.label', default: 'Contrapunto'), contrapuntoInstance.id])
        redirect(action: "show", id: contrapuntoInstance.id)
    }

    def show(Long id) {
        def contrapuntoInstance = Contrapunto.get(id)
        if (!contrapuntoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contrapunto.label', default: 'Contrapunto'), id])
            redirect(action: "list")
            return
        }

        [contrapuntoInstance: contrapuntoInstance]
    }

    def edit(Long id) {
        def contrapuntoInstance = Contrapunto.get(id)
        if (!contrapuntoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contrapunto.label', default: 'Contrapunto'), id])
            redirect(action: "list")
            return
        }

        [contrapuntoInstance: contrapuntoInstance]
    }

    def update(Long id, Long version) {
        def contrapuntoInstance = Contrapunto.get(id)
        if (!contrapuntoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contrapunto.label', default: 'Contrapunto'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (contrapuntoInstance.version > version) {
                contrapuntoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'contrapunto.label', default: 'Contrapunto')] as Object[],
                          "Another user has updated this Contrapunto while you were editing")
                render(view: "edit", model: [contrapuntoInstance: contrapuntoInstance])
                return
            }
        }

        contrapuntoInstance.properties = params

        if (!contrapuntoInstance.save(flush: true)) {
            render(view: "edit", model: [contrapuntoInstance: contrapuntoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'contrapunto.label', default: 'Contrapunto'), contrapuntoInstance.id])
        redirect(action: "show", id: contrapuntoInstance.id)
    }

    def delete(Long id) {
        def contrapuntoInstance = Contrapunto.get(id)
        if (!contrapuntoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contrapunto.label', default: 'Contrapunto'), id])
            redirect(action: "list")
            return
        }

        try {
            contrapuntoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'contrapunto.label', default: 'Contrapunto'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contrapunto.label', default: 'Contrapunto'), id])
            redirect(action: "show", id: id)
        }
    }
}
