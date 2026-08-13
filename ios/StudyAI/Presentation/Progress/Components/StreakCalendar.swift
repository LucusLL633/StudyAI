import SwiftUI

struct StreakCalendar: View {
    let currentStreak: Int
    let longestStreak: Int

    private var last7Days: [Date] {
        (0..<7).reversed().compactMap { offset in
            Calendar.current.date(byAdding: .day, value: -offset, to: Date())
        }
    }

    var body: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "flame.fill")
                        .foregroundStyle(Color.streakGradient)
                    Text("Série d'Étude")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Text("Record : \(longestStreak) jours")
                        .font(.caption)
                        .foregroundColor(.accentCyan)
                }

                HStack(spacing: 8) {
                    ForEach(last7Days, id: \.self) { date in
                        let dayIndex = Calendar.current.component(.weekday, from: date)
                        let dayLetters = ["D", "L", "M", "M", "J", "V", "S"]
                        let isActive = Calendar.current.dateComponents([.day], from: date, to: Date()).day ?? 0 < currentStreak

                        VStack(spacing: 6) {
                            Text(dayLetters[dayIndex - 1])
                                .font(.caption2)
                                .foregroundColor(.white.opacity(0.6))

                            Circle()
                                .fill(isActive ? Color.primaryOrange : Color.white.opacity(0.15))
                                .frame(width: 32, height: 32)
                                .overlay(
                                    Image(systemName: isActive ? "checkmark" : "")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                )
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}
