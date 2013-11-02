package tp.contrapunto



import org.junit.*
import grails.test.mixin.*

@TestFor(ContrapuntoController)
@Mock(Contrapunto)
class ContrapuntoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/contrapunto/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.contrapuntoInstanceList.size() == 0
        assert model.contrapuntoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.contrapuntoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.contrapuntoInstance != null
        assert view == '/contrapunto/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/contrapunto/show/1'
        assert controller.flash.message != null
        assert Contrapunto.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/contrapunto/list'

        populateValidParams(params)
        def contrapunto = new Contrapunto(params)

        assert contrapunto.save() != null

        params.id = contrapunto.id

        def model = controller.show()

        assert model.contrapuntoInstance == contrapunto
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/contrapunto/list'

        populateValidParams(params)
        def contrapunto = new Contrapunto(params)

        assert contrapunto.save() != null

        params.id = contrapunto.id

        def model = controller.edit()

        assert model.contrapuntoInstance == contrapunto
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/contrapunto/list'

        response.reset()

        populateValidParams(params)
        def contrapunto = new Contrapunto(params)

        assert contrapunto.save() != null

        // test invalid parameters in update
        params.id = contrapunto.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/contrapunto/edit"
        assert model.contrapuntoInstance != null

        contrapunto.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/contrapunto/show/$contrapunto.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        contrapunto.clearErrors()

        populateValidParams(params)
        params.id = contrapunto.id
        params.version = -1
        controller.update()

        assert view == "/contrapunto/edit"
        assert model.contrapuntoInstance != null
        assert model.contrapuntoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/contrapunto/list'

        response.reset()

        populateValidParams(params)
        def contrapunto = new Contrapunto(params)

        assert contrapunto.save() != null
        assert Contrapunto.count() == 1

        params.id = contrapunto.id

        controller.delete()

        assert Contrapunto.count() == 0
        assert Contrapunto.get(contrapunto.id) == null
        assert response.redirectedUrl == '/contrapunto/list'
    }
}
