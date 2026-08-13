import SwiftUI

struct AchievementGrid: View {
    let achievements: [Achievement]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Succès")
                .font(.headline)
                .foregroundColor(.white)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 14) {
                ForEach(achievements) { achievement in
                    VStack(spacing: 8) {
                        ZStack {
                            Circle()
                                .fill(achievement.isUnlocked ? Color.primaryPurple.opacity(0.6) : Color.white.opacity(0.08))
                                .frame(width: 56, height: 56)

                            Image(systemName: achievement.iconName)
                                .font(.title2)
                                .foregroundColor(achievement.isUnlocked ? .yellow : .white.opacity(0.3))
                        }

                        Text(achievement.title)
                            .font(.caption2)
                            .bold()
                            .foregroundColor(achievement.isUnlocked ? .white : .white.opacity(0.4))
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                    }
                }
            }
        }
    }
}
