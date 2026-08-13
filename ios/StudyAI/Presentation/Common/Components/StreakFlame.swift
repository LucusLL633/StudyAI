import SwiftUI

struct StreakFlame: View {
    let streakCount: Int
    @State private var isPulsing = false

    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: "flame.fill")
                .foregroundStyle(Color.streakGradient)
                .scaleEffect(isPulsing ? 1.2 : 1.0)
                .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isPulsing)
                .onAppear {
                    isPulsing = true
                }

            Text("\(streakCount) Jours")
                .bold()
                .foregroundColor(.white)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .glassCard(cornerRadius: 14)
    }
}
