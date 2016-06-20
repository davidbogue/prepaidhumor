package prepaidhumor

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:'joke')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
