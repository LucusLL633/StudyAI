import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        ZStack {
            Color.backgroundGradient.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Paramètres")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)

                    GlassCard {
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Clé API Google Gemini (Gratuit)")
                                .font(.headline)
                                .foregroundColor(.white)

                            Text("Quota gratuit : 15 requêtes / min, 1M tokens / jour. L'app fonctionne en mode démo gratuit par défaut.")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.7))

                            SecureField("Entrez votre clé API Gemini (Optionnel)", text: $viewModel.geminiAPIKey)
                                .textFieldStyle(.plain)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))

                            GlassButton(title: "Enregistrer la clé API", icon: "key.fill") {
                                viewModel.saveGeminiAPIKey()
                            }
                        }
                    }

                    GlassCard {
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Objectif Quotidien")
                                .font(.headline)
                                .foregroundColor(.white)

                            Stepper("\(viewModel.dailyGoalMinutes) minutes / jour", value: $viewModel.dailyGoalMinutes, in: 10...120, step: 5)
                                .foregroundColor(.white)
                        }
                    }

                    GlassCard {
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Notifications")
                                .font(.headline)
                                .foregroundColor(.white)

                            Toggle("Rappels d'étude quotidiens", isOn: $viewModel.notificationsEnabled)
                                .tint(.primaryPurple)
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding()
            }
        }
    }
}
