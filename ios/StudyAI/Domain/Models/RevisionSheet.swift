import Foundation

struct RevisionSection: Identifiable, Codable {
    var id: UUID = UUID()
    let title: String
    let bulletPoints: [String]
}

struct RevisionSheet: Identifiable, Codable {
    let id: UUID
    var title: String
    var subject: String
    var createdDate: Date
    var sections: [RevisionSection]
    var summary: String
    var colorHex: String
}
