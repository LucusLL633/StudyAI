import SwiftUI

struct DailyGoalCard: View {
    let progress: Double
    let minutesStudied: Int
    let targetMinutes: Int

    var body: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "target")
                        .foregroundColor(.accentCyan)
                    Text("Objectif Quotidien")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Text("\(minutesStudied) / \(targetMinutes) min")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.accentCyan)
                }

                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white.opacity(0.15))
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.accentCyan)
                            .frame(width: geometry.size.width * CGFloat(min(progress, 1.0)))
                    }
                }
                .frame(height: 10)
            }
        }
    }
}
