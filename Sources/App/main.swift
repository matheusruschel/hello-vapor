
import Vapor

let drop = Droplet()

drop.get("hello") { request in
    //return "Hello vapor"
    return try JSON(node: [
        "message" : "Hello again!"
        ])
}

drop.get("hello", "there") { request in
    //return "Hello vapor"
    return try JSON(node: [
        "message" : "I'm tired of saying hello!"
        ])
}

drop.get("beers", Int.self) { request, beers in
    //return "Hello vapor"
    return try JSON(node: [
        "message" : "Have this \(beers - 1) beers!"
        ])
}

drop.post("post") { request in

    guard let name = request.data["name"]?.string else {
        throw Abort.badRequest
    }
    return try JSON(node: [
        "message" : "Hello, \(name)"
        ])
}

drop.run()
