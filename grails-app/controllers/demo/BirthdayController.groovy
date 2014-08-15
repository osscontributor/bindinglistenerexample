package demo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BirthdayController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Birthday.list(params), model:[birthdayInstanceCount: Birthday.count()]
    }

    def show(Birthday birthdayInstance) {
        respond birthdayInstance
    }

    def create() {
        respond new Birthday(params)
    }

    @Transactional
    def save(Birthday birthdayInstance) {
        if (birthdayInstance == null) {
            notFound()
            return
        }

        if (birthdayInstance.hasErrors()) {
            respond birthdayInstance.errors, view:'create'
            return
        }

        birthdayInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'birthdayInstance.label', default: 'Birthday'), birthdayInstance.id])
                redirect birthdayInstance
            }
            '*' { respond birthdayInstance, [status: CREATED] }
        }
    }

    def edit(Birthday birthdayInstance) {
        respond birthdayInstance
    }

    @Transactional
    def update(Birthday birthdayInstance) {
        if (birthdayInstance == null) {
            notFound()
            return
        }

        if (birthdayInstance.hasErrors()) {
            respond birthdayInstance.errors, view:'edit'
            return
        }

        birthdayInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Birthday.label', default: 'Birthday'), birthdayInstance.id])
                redirect birthdayInstance
            }
            '*'{ respond birthdayInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Birthday birthdayInstance) {

        if (birthdayInstance == null) {
            notFound()
            return
        }

        birthdayInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Birthday.label', default: 'Birthday'), birthdayInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'birthdayInstance.label', default: 'Birthday'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
