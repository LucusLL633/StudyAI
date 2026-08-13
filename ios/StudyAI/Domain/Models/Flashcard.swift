import Foundation

struct Flashcard: Identifiable, Codable {
    let id: UUID
    var question: String
    var answer: String
    var timesReviewed: Int
    var timesCorrect: Int
    var nextReviewDate: Date?
}

struct FlashcardDeck: Identifiable, Codable {
    let id: UUID
    var title: String
    var subject: String
    var colorHex: String
    var createdDate: Date
    var cards: [Flashcard]
}
