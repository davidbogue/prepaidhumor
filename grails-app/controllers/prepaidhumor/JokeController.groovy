package prepaidhumor

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class JokeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 100, 1000)
        respond Joke.list(params), model: [jokeCount: Joke.count()]
    }

    @Transactional
    def thumbsUp(Joke joke){
        if(joke){
            joke.likes++
        }
        joke.save flush:true

        redirect uri: '/#joke'+joke.id
    }

    def show(Joke joke) {
        respond joke
    }

    def create() {
        respond new Joke(params)
    }

    @Transactional
    def save(Joke joke) {
        if (joke == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (joke.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond joke.errors, view:'create'
            return
        }

        joke.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'joke.label', default: 'Joke'), joke.id])
                redirect joke
            }
            '*' { respond joke, [status: CREATED] }
        }
    }

    def edit(Joke joke) {
        respond joke
    }

    @Transactional
    def update(Joke joke) {
        if (joke == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (joke.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond joke.errors, view:'edit'
            return
        }

        joke.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'joke.label', default: 'Joke'), joke.id])
                redirect joke
            }
            '*'{ respond joke, [status: OK] }
        }
    }

    @Transactional
    def delete(Joke joke) {

        if (joke == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        joke.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'joke.label', default: 'Joke'), joke.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'joke.label', default: 'Joke'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
