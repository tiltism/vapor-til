import Vapor
import FluentPostgreSQL

final class Acronym: Codable {
    var id: Int?
    var short: String
    var long: String
    var userID: User.ID
    
    init(short: String, long: String, userID: User.ID) {
        self.short = short
        self.long = long
        self.userID = userID
    }
}

// db model setup
extension Acronym: PostgreSQLModel {}

// db CRUD functions
extension Acronym: Content {}

// web api parameter support
extension Acronym: Parameter {}

// computed properties: db link to parent, sibling(s)
extension Acronym {
    var user: Parent<Acronym, User> {
        return parent(\.userID)
    }
    var categories: Siblings<Acronym, Category, AcronymCategoryPivot> {
        return siblings()
    }
}

// db schema migrations and foreign key
extension Acronym: Migration {
    static func prepare(on connection: PostgreSQLConnection) -> Future<Void> {
        return Database.create(self, on: connection) { builder in
            try addProperties(to: builder)
            builder.reference(from: \.userID, to: \User.id)
        }
    }
}
