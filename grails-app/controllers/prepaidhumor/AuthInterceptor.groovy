package prepaidhumor


class AuthInterceptor {

    public AuthInterceptor() {
        match controller: 'joke', action: 'create'
    }

    boolean before() {
        // if the user has not been authenticated,
        // redirect to authenticate the user...
        if(!session.user) {
            // log a message
            log.debug 'Redirecting to login page'
            redirect controller: 'joke'
            return false
        }
        true
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
