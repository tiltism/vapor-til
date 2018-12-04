import Vapor
import FluentMySQL

final class Acronym: Codable {
    var id: Int?
    var short: String
    var long: String
    
    init(short: String, long: String) {
        self.short = short
        self.long = long
    }
}

// even faster SQLite db model setup
extension Acronym: MySQLModel {}

// db schema functions
extension Acronym: Migration {}

// db CRUD functions
extension Acronym: Content {}