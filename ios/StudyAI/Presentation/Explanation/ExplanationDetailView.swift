import SwiftUI

struct ExplanationDetailView: View {
    let explanation: Explanation
    @ObservedObject var router: Router

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header summary
                GlassCard {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "sparkles")
                                .foregroundColor(.yellow)
                            Text("Explication IA (Gemini)")
                                .font(.headline)
                                .foregroundColor(.white)
                            Spacer()
                            Text("+50 XP")
                                .bold()
                                .foregroundColor(.accentCyan)
                        }

                        Text(explanation.summary)
                            .font(.body)
                            .foregroundColor(.white.opacity(0.9))
                    }
                }

                // Steps
                StepByStepView(steps: explanation.steps)

                // Key points
                if !explanation.keyPoints.isEmpty {
                    GlassCard {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Points Clés à Retenir")
                                .font(.headline)
                                .foregroundColor(.white)

                            ForEach(explanation.keyPoints, id: \.self) { point in
                                HStack(spacing: 8) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.primaryGreen)
                                    Text(point)
                                        .foregroundColor(.white.opacity(0.85))
                                }
                            }
                        }
                    }
                }

                // Action buttons
                HStack(spacing: 12) {
                    GlassButton(title: "Créer Quiz", icon: "checkmark.seal", isPrimary: false) {
                        router.selectedTab = 3
                    }

                    GlassButton(title: "Nouvelle Photo", icon: "camera", isPrimary: true) {
                        router.selectedTab = 1
                    }
                }
            }
            .padding()
        }
    }
}
