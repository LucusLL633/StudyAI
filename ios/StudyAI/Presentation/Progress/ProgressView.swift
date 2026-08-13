import SwiftUI

struct ProgressView: View {
    @ObservedObject var router: Router
    @StateObject private var viewModel = ProgressViewModel()
    @ObservedObject private var xpManager = XPManager.shared
    @ObservedObject private var streakManager = StreakManager.shared
    @ObservedObject private var achievementManager = AchievementManager.shared

    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundGradient.ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Text("Mon Progrès")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                            Spacer()
                            Button {
                                router.navigate(to: .profile)
                            } label: {
                                Image(systemName: "person.crop.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.white)
                            }
                        }

                        // XP Bar & Level
                        GlassCard {
                            VStack(spacing: 12) {
                                HStack {
                                    LevelBadge(level: xpManager.level)
                                    Spacer()
                                    Text("\(xpManager.currentXP) XP Total")
                                        .bold()
                                        .foregroundColor(.accentCyan)
                                }
                                XPProgressBar(currentXP: xpManager.currentXP, xpToNextLevel: xpManager.xpToNextLevel)
                            }
                        }

                        // Streak
                        StreakCalendar(currentStreak: streakManager.currentStreak, longestStreak: streakManager.longestStreak)

                        // Stats Grid
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                            StatsCard(title: "Exercices", value: "\(viewModel.totalExercises)", icon: "camera.fill", color: .primaryBlue)
                            StatsCard(title: "Quiz Réussis", value: "\(viewModel.totalQuizzes)", icon: "checkmark.seal.fill", color: .primaryGreen)
                            StatsCard(title: "Flashcards", value: "\(viewModel.totalFlashcards)", icon: "rectangle.on.rectangle.angled", color: .primaryPurple)
                            StatsCard(title: "Temps d'étude", value: "\(viewModel.totalStudyMinutes / 60)h", icon: "clock.fill", color: .primaryOrange)
                        }

                        // Achievements
                        AchievementGrid(achievements: achievementManager.achievements)
                    }
                    .padding()
                }
            }
        }
    }
}
