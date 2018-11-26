import Vapor
import FluentSQLite

final class Acronym: Codable {
    var id: Int?
    var short: String
    var long: String
    
    init(short: String, long: String) {
        self.short = short
        self.long = long
    }
}

//extension Acronym: Model {
//    typealias Database = SQLiteDatabase
//    typealias ID = Int
//    public static var idKey: IDKey = \Acronym.id
//}

// even faster SQLite db model setup
extension Acronym: SQLiteModel {}

// db schema functions
extension Acronym: Migration {}

// db CRUD functions
extension Acronym: Content {}
