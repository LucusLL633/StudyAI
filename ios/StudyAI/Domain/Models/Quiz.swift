import Foundation

struct Question: Identifiable, Codable {
    let id: UUID
    let questionText: String
    let options: [String]
    let correctAnswerIndex: Int
    let explanation: String?
}

struct QuizAttempt: Identifiable, Codable {
    let id: UUID
    let date: Date
    let score: Int
    let totalQuestions: Int
    let xpEarned: Int
}

struct Quiz: Identifiable, Codable {
    let id: UUID
    var title: String
    var subject: String
    var createdDate: Date
    var questions: [Question]
    var attempts: [QuizAttempt]
}
