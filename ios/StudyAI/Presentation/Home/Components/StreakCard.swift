import SwiftUI

struct StreakCard: View {
    let streakDays: Int

    var body: some View {
        GlassCard {
            HStack(spacing: 16) {
                Image(systemName: "flame.fill")
                    .font(.system(size: 36))
                    .foregroundStyle(Color.streakGradient)

                VStack(alignment: .leading, spacing: 4) {
                    Text("Série d'Étude")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))
                    Text("\(streakDays) Jours Consécutifs")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                }
                Spacer()
            }
        }
    }
}
