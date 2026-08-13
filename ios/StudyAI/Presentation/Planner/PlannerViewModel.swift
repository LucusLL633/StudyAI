import SwiftUI

@MainActor
final class PlannerViewModel: ObservableObject {
    @Published var sessions: [StudySession] = []
    @Published var selectedDate: Date = Date()

    init() {
        loadSampleSessions()
    }

    func loadSampleSessions() {
        let calendar = Calendar.current
        let today = Date()
        sessions = [
            StudySession(id: UUID(), title: "Révision Maths", subject: "Mathématiques", scheduledDate: today, durationMinutes: 30, isCompleted: false),
            StudySession(id: UUID(), title: "Quiz Histoire", subject: "Histoire", scheduledDate: calendar.date(byAdding: .day, value: 1, to: today)!, durationMinutes: 20, isCompleted: false),
            StudySession(id: UUID(), title: "Flashcards SVT", subject: "SVT", scheduledDate: calendar.date(byAdding: .day, value: 2, to: today)!, durationMinutes: 15, isCompleted: false)
        ]
    }

    func sessionsForDate(_ date: Date) -> [StudySession] {
        sessions.filter { Calendar.current.isDate($0.scheduledDate, inSameDayAs: date) }
    }

    func toggleComplete(session: StudySession) {
        if let index = sessions.firstIndex(where: { $0.id == session.id }) {
            sessions[index].isCompleted.toggle()
            if sessions[index].isCompleted {
                XPManager.shared.addXP(25)
                StreakManager.shared.recordStudySession()
            }
        }
    }
}
