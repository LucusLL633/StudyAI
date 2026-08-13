import SwiftUI

struct HomeView: View {
    @ObservedObject var router: Router
    @StateObject private var viewModel = HomeViewModel()
    @ObservedObject private var xpManager = XPManager.shared
    @ObservedObject private var streakManager = StreakManager.shared

    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundGradient.ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 20) {
                        // Header
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Bonjour 👋")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.white)
                                Text("Prêt pour réviser aujourd'hui ?")
                                    .font(.subheadline)
                                    .foregroundColor(.white.opacity(0.7))
                            }
                            Spacer()
                            LevelBadge(level: xpManager.level)
                        }
                        .padding(.top, 10)

                        // XP Bar
                        XPProgressBar(currentXP: xpManager.currentXP, xpToNextLevel: xpManager.xpToNextLevel)

                        // Streak
                        StreakCard(streakDays: streakManager.currentStreak)

                        // Daily Goal
                        DailyGoalCard(progress: viewModel.dailyGoalProgress, minutesStudied: 20, targetMinutes: viewModel.user.dailyGoalMinutes)

                        // Quick Actions
                        QuickActionGrid(router: router)
                    }
                    .padding()
                }
            }
            .onAppear {
                viewModel.refresh()
            }
        }
    }
}
