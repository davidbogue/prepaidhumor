package prepaidhumor

class User {

    static constraints = {
        email blank:false, size:1..256, email: true, unique: true
        password blank: false, size: 8..256
        name blank:false, size:1..256
    }

    String email
    String password
    String name

}
