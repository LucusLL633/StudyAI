import SwiftUI

struct ExerciseCameraView: View {
    @ObservedObject var router: Router
    @StateObject private var cameraService = CameraService()
    @StateObject private var viewModel = CameraViewModel()

    var body: some View {
        ZStack {
            Color.backgroundGradient.ignoresSafeArea()

            if viewModel.isProcessing {
                ProcessingView()
            } else if let explanation = viewModel.generatedExplanation {
                ExplanationDetailView(explanation: explanation, router: router)
            } else {
                VStack(spacing: 24) {
                    Text("Prenez en photo votre exercice")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 20)

                    ZStack {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(Color.white.opacity(0.1))
                            .overlay(
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(Color.white.opacity(0.3), lineWidth: 2)
                            )

                        VStack(spacing: 16) {
                            Image(systemName: "camera.viewfinder")
                                .font(.system(size: 64))
                                .foregroundColor(.accentCyan)
                            Text("Cadrez l'exercice clairement")
                                .font(.headline)
                                .foregroundColor(.white.opacity(0.8))
                        }
                    }
                    .frame(height: 350)
                    .padding(.horizontal)

                    GlassButton(title: "Simuler la prise de photo", icon: "camera.fill") {
                        #if canImport(UIKit)
                        let mockImage = UIImage()
                        Task {
                            await viewModel.processCapturedPhoto(mockImage)
                        }
                        #endif
                    }
                    .padding(.bottom, 20)
                }
            }
        }
        .onAppear {
            cameraService.checkPermissionAndSetup()
        }
    }
}
