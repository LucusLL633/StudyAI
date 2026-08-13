import Foundation
import SwiftData

@Model
final class FlashcardDeckModel {
    @Attribute(.unique) var id: UUID
    var title: String
    var subject: String
    var colorHex: String
    var createdDate: Date
    var cardsJSON: String

    init(
        id: UUID = UUID(),
        title: String,
        subject: String,
        colorHex: String = "4A90E2",
        createdDate: Date = Date(),
        cardsJSON: String = "[]"
    ) {
        self.id = id
        self.title = title
        self.subject = subject
        self.colorHex = colorHex
        self.createdDate = createdDate
        self.cardsJSON = cardsJSON
    }
}
