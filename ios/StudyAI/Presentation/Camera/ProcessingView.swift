import SwiftUI

struct ProcessingView: View {
    var body: some View {
        ZStack {
            Color.backgroundGradient.ignoresSafeArea()

            VStack(spacing: 24) {
                LoadingSpinner(title: "L'IA analyse votre exercice...")

                Text("Extraction OCR + Génération d'explications en cours")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
            }
            .padding()
        }
    }
}
