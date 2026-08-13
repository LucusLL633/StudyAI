import Foundation
import SwiftData

@Model
final class UserModel {
    @Attribute(.unique) var id: UUID
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

    init(
        id: UUID = UUID(),
        username: String = "Étudiant",
        profileImageData: Data? = nil,
        level: Int = 1,
        currentXP: Int = 0,
        xpToNextLevel: Int = 100,
        currentStreak: Int = 1,
        longestStreak: Int = 1,
        lastStudyDate: Date? = Date(),
        totalStudyMinutes: Int = 0,
        dailyGoalMinutes: Int = 30,
        notificationsEnabled: Bool = true,
        reminderTime: Date? = nil
    ) {
        self.id = id
        self.username = username
        self.profileImageData = profileImageData
        self.level = level
        self.currentXP = currentXP
        self.xpToNextLevel = xpToNextLevel
        self.currentStreak = currentStreak
        self.longestStreak = longestStreak
        self.lastStudyDate = lastStudyDate
        self.totalStudyMinutes = totalStudyMinutes
        self.dailyGoalMinutes = dailyGoalMinutes
        self.notificationsEnabled = notificationsEnabled
        self.reminderTime = reminderTime
    }
}
