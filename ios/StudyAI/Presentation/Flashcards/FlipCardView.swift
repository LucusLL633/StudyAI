import SwiftUI

struct FlipCardView: View {
    let question: String
    let answer: String
    @Binding var isFlipped: Bool

    var body: some View {
        ZStack {
            GlassCard {
                VStack(spacing: 20) {
                    Text(isFlipped ? "RÉPONSE" : "QUESTION")
                        .font(.caption)
                        .bold()
                        .foregroundColor(isFlipped ? .accentCyan : .primaryPurple)

                    Text(isFlipped ? answer : question)
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)

                    Spacer()

                    Text("Toucher pour retourner 🔄")
                        .font(.caption2)
                        .foregroundColor(.white.opacity(0.6))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(20)
            }
        }
        .frame(height: 320)
        .rotation3DEffect(
            .degrees(isFlipped ? 180 : 0),
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
        .animation(.spring(response: 0.6, dampingFraction: 0.8), value: isFlipped)
        .onTapGesture {
            isFlipped.toggle()
        }
    }
}
