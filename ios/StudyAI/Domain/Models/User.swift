import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    var username: String
    var profileImageData: Data?

    // Gamification
    var level: Int
    var currentXP: Int
    var xpToNextLevel: Int
    var currentStreak: Int
    var longestStreak: Int
    var lastStudyDate: Date?
    var totalStudyMinutes: Int

    // Settings
    var dailyGoalMinutes: Int
    var notificationsEnabled: Bool
    var reminderTime: Date?

    static var initial: User {
        User(
            id: UUID(),
            username: "Étudiant",
            profileImageData: nil,
            level: 1,
            currentXP: 0,
            xpToNextLevel: 100,
            currentStreak: 1,
            longestStreak: 1,
            lastStudyDate: Date(),
            totalStudyMinutes: 0,
            dailyGoalMinutes: 30,
            notificationsEnabled: true,
            reminderTime: Calendar.current.date(bySettingHour: 18, minute: 0, second: 0, of: Date())
        )
    }
}
