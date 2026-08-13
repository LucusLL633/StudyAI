import Foundation
import SwiftData

@Model
final class RevisionSheetModel {
    @Attribute(.unique) var id: UUID
    var title: String
    var subject: String
    var createdDate: Date
    var summary: String
    var colorHex: String
    var sectionsJSON: String

    init(
        id: UUID = UUID(),
        title: String,
        subject: String,
        createdDate: Date = Date(),
        summary: String,
        colorHex: String = "9B59B6",
        sectionsJSON: String = "[]"
    ) {
        self.id = id
        self.title = title
        self.subject = subject
        self.createdDate = createdDate
        self.summary = summary
        self.colorHex = colorHex
        self.sectionsJSON = sectionsJSON
    }
}
