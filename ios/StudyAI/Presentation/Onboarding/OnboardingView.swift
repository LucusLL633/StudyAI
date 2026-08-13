import SwiftUI

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    let onFinish: () -> Void

    var body: some View {
        ZStack {
            Color.backgroundGradient.ignoresSafeArea()

            VStack(spacing: 30) {
                TabView(selection: $viewModel.currentPage) {
                    OnboardingPage(
                        icon: "brain.head.profile",
                        title: "Bienvenue sur StudyAI",
                        description: "Votre assistant d'étude gratuit propulsé par l'IA."
                    )
                    .tag(0)

                    OnboardingPage(
                        icon: "camera.viewfinder",
                        title: "Photographiez vos Devoirs",
                        description: "Scannez vos exercices pour obtenir des explications étape par étape."
                    )
                    .tag(1)

                    OnboardingPage(
                        icon: "flame.fill",
                        title: "Progression & Gamification",
                        description: "Gagnez de l'XP, débloquez des badges et maintenez votre streak d'étude !"
                    )
                    .tag(2)
                }
                .tabViewStyle(.page(indexDisplayMode: .always))

                GlassButton(title: viewModel.currentPage == 2 ? "Commencer" : "Suivant", icon: "arrow.right") {
                    if viewModel.currentPage < 2 {
                        withAnimation {
                            viewModel.currentPage += 1
                        }
                    } else {
                        viewModel.completeOnboarding()
                        onFinish()
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
        }
    }
}

private struct OnboardingPage: View {
    let icon: String
    let title: String
    let description: String

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image(systemName: icon)
                .font(.system(size: 80))
                .foregroundStyle(Color.brandGradient)

            Text(title)
                .font(.title)
                .bold()
                .foregroundColor(.white)
                .multilineTextAlignment(.center)

            Text(description)
                .font(.body)
                .foregroundColor(.white.opacity(0.8))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
            Spacer()
        }
    }
}
