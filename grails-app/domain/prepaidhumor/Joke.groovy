package prepaidhumor

class Joke {

    static constraints = {
    }

    static mapping = {
        sort likes:"desc"
    }

    String text;
    String author;
    Integer likes = 0;

}
