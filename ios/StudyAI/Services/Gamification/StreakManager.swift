import Foundation

@MainActor
final class StreakManager: ObservableObject {
    static let shared = StreakManager()

    @Published var currentStreak: Int = 1
    @Published var longestStreak: Int = 1
    @Published var lastStudyDate: Date = Date()

    private init() {}

    func recordStudySession() {
        let calendar = Calendar.current
        let today = Date()

        if calendar.isDateInToday(lastStudyDate) {
            return // Already counted today
        } else if calendar.isDateInYesterday(lastStudyDate) {
            currentStreak += 1
            if currentStreak > longestStreak {
                longestStreak = currentStreak
            }
        } else {
            currentStreak = 1
        }
        lastStudyDate = today
    }
}
