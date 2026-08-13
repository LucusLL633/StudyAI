import SwiftUI

struct XPProgressBar: View {
    let currentXP: Int
    let xpToNextLevel: Int

    var progress: Double {
        guard xpToNextLevel > 0 else { return 0 }
        return min(Double(currentXP) / Double(xpToNextLevel), 1.0)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("XP Duolingo Style")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.white.opacity(0.8))
                Spacer()
                Text("\(currentXP) / \(xpToNextLevel) XP")
                    .font(.caption)
                    .bold()
                    .foregroundColor(.white)
            }

            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white.opacity(0.15))

                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.xpGradient)
                        .frame(width: geometry.size.width * progress)
                        .animation(.spring(response: 0.5, dampingFraction: 0.7), value: progress)
                }
            }
            .frame(height: 12)
        }
    }
}
