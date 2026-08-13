import Foundation
import SwiftData

@Model
final class QuizModel {
    @Attribute(.unique) var id: UUID
    var title: String
    var subject: String
    var createdDate: Date
    var questionsJSON: String
    var attemptsJSON: String

    init(
        id: UUID = UUID(),
        title: String,
        subject: String,
        createdDate: Date = Date(),
        questionsJSON: String = "[]",
        attemptsJSON: String = "[]"
    ) {
        self.id = id
        self.title = title
        self.subject = subject
        self.createdDate = createdDate
        self.questionsJSON = questionsJSON
        self.attemptsJSON = attemptsJSON
    }
}
