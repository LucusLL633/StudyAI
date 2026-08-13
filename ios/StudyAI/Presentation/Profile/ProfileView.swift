import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Color.backgroundGradient.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Button { dismiss() } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title2)
                                .foregroundColor(.white.opacity(0.7))
                        }
                        Spacer()
                        Text("Mon Profil")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                    }

                    // Avatar & Name
                    GlassCard {
                        HStack(spacing: 16) {
                            Circle()
                                .fill(Color.primaryPurple)
                                .frame(width: 60, height: 60)
                                .overlay(
                                    Image(systemName: "person.fill")
                                        .font(.title)
                                        .foregroundColor(.white)
                                )

                            VStack(alignment: .leading, spacing: 4) {
                                Text(viewModel.username)
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.white)
                                Text("Étudiant StudyAI")
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.7))
                            }
                        }
                    }

                    // Settings Navigation Link
                    NavigationLink {
                        SettingsView(viewModel: viewModel)
                    } label: {
                        GlassCard {
                            HStack {
                                Image(systemName: "gearshape.fill")
                                    .foregroundColor(.accentCyan)
                                Text("Paramètres & Clé API Gemini")
                                    .foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white.opacity(0.5))
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}
