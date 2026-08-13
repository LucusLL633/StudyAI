import SwiftUI

struct QuizResultView: View {
    let score: Int
    let total: Int
    let xpEarned: Int
    let onDismiss: () -> Void

    private var percentage: Double {
        guard total > 0 else { return 0 }
        return Double(score) / Double(total)
    }

    private var emoji: String {
        switch percentage {
        case 1.0: return "🏆"
        case 0.8..<1.0: return "🎉"
        case 0.5..<0.8: return "💪"
        default: return "📚"
        }
    }

    private var message: String {
        switch percentage {
        case 1.0: return "Score parfait !"
        case 0.8..<1.0: return "Excellent travail !"
        case 0.5..<0.8: return "Pas mal, continue !"
        default: return "Il faut encore réviser."
        }
    }

    var body: some View {
        ZStack {
            Color.backgroundGradient.ignoresSafeArea()

            VStack(spacing: 28) {
                Spacer()

                Text(emoji)
                    .font(.system(size: 80))

                Text(message)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)

                // Score circle
                ZStack {
                    Circle()
                        .stroke(Color.white.opacity(0.15), lineWidth: 12)
                    Circle()
                        .trim(from: 0, to: percentage)
                        .stroke(
                            percentage >= 0.8 ? Color.successGreen : (percentage >= 0.5 ? Color.warningYellow : Color.errorRed),
                            style: StrokeStyle(lineWidth: 12, lineCap: .round)
                        )
                        .rotationEffect(.degrees(-90))
                        .animation(.easeOut(duration: 1), value: percentage)

                    VStack(spacing: 4) {
                        Text("\(score)/\(total)")
                            .font(.system(size: 36, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        Text("correct")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.7))
                    }
                }
                .frame(width: 160, height: 160)

                // XP earned
                GlassCard {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("+\(xpEarned) XP gagnés !")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }

                Spacer()

                GlassButton(title: "Terminé", icon: "checkmark") {
                    onDismiss()
                }
            }
            .padding()
        }
    }
}
