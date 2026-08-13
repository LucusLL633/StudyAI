import SwiftUI

struct LoadingSpinner: View {
    let title: String
    @State private var isAnimating = false

    var body: some View {
        VStack(spacing: 16) {
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(Color.brandGradient, lineWidth: 4)
                .frame(width: 48, height: 48)
                .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                .onAppear {
                    withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                        isAnimating = true
                    }
                }

            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .padding(32)
        .glassCard()
    }
}
