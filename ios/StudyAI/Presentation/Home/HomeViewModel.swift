import SwiftUI
import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var user: User = User.initial
    @Published var recentExercisesCount: Int = 3
    @Published var dailyGoalProgress: Double = 0.65

    func refresh() {
        self.user.currentXP = XPManager.shared.currentXP
        self.user.level = XPManager.shared.level
        self.user.currentStreak = StreakManager.shared.currentStreak
    }
}
