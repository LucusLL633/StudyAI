import SwiftUI

struct StepByStepView: View {
    let steps: [ExplanationStep]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Étapes de Résolution")
                .font(.headline)
                .foregroundColor(.white)

            ForEach(steps) { step in
                GlassCard {
                    HStack(alignment: .top, spacing: 14) {
                        Text("\(step.stepNumber)")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.white)
                            .frame(width: 32, height: 32)
                            .background(Circle().fill(Color.primaryPurple))

                        VStack(alignment: .leading, spacing: 6) {
                            Text(step.title)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(step.detail)
                                .font(.body)
                                .foregroundColor(.white.opacity(0.85))
                        }
                    }
                }
            }
        }
    }
}
