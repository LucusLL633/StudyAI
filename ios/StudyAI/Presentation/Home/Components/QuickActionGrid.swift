import SwiftUI

struct QuickActionGrid: View {
    @ObservedObject var router: Router

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Actions Rapides")
                .font(.headline)
                .foregroundColor(.white)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                Button {
                    router.selectedTab = 1
                } label: {
                    ActionCard(title: "Photographier Exercice", icon: "camera.viewfinder", color: Color.primaryBlue)
                }

                Button {
                    router.selectedTab = 2
                } label: {
                    ActionCard(title: "Réviser Flashcards", icon: "square.stack.fill", color: Color.primaryPurple)
                }

                Button {
                    router.selectedTab = 3
                } label: {
                    ActionCard(title: "Lancer un Quiz", icon: "play.circle.fill", color: Color.primaryGreen)
                }

                Button {
                    router.selectedTab = 4
                } label: {
                    ActionCard(title: "Voir mes Progrès", icon: "trophy.fill", color: Color.primaryOrange)
                }
            }
        }
    }
}

private struct ActionCard: View {
    let title: String
    let icon: String
    let color: Color

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(color)
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .glassCard()
    }
}
