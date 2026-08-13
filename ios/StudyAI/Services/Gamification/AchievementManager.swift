import Foundation

@MainActor
final class AchievementManager: ObservableObject {
    static let shared = AchievementManager()

    @Published var achievements: [Achievement] = Achievement.defaultList

    private init() {}

    func unlockAchievement(id: String) {
        if let index = achievements.firstIndex(where: { $0.id == id && !$0.isUnlocked }) {
            achievements[index].isUnlocked = true
            achievements[index].unlockedDate = Date()
            XPManager.shared.addXP(100)
        }
    }
}
