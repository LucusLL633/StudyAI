import Foundation

struct StudySession: Identifiable, Codable {
    let id: UUID
    var title: String
    var subject: String
    var scheduledDate: Date
    var durationMinutes: Int
    var isCompleted: Bool
}
