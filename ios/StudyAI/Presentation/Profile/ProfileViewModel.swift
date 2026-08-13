import SwiftUI
import Combine

@MainActor
final class ProfileViewModel: ObservableObject {
    @Published var username: String = "Étudiant"
    @Published var dailyGoalMinutes: Int = 30
    @Published var notificationsEnabled: Bool = true
    @Published var geminiAPIKey: String = ""

    init() {
        loadSettings()
    }

    func loadSettings() {
        Task {
            let key = await GeminiService.shared.getAPIKey()
            self.geminiAPIKey = key
        }
    }

    func saveGeminiAPIKey() {
        Task {
            await GeminiService.shared.setAPIKey(geminiAPIKey)
        }
    }
}
