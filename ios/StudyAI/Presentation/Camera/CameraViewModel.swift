import SwiftUI
import Combine
#if canImport(UIKit)
import UIKit
#endif

@MainActor
final class CameraViewModel: ObservableObject {
    @Published var capturedImage: UIImage?
    @Published var extractedText: String = ""
    @Published var isProcessing: Bool = false
    @Published var generatedExplanation: Explanation?
    @Published var errorMessage: String?

    func processCapturedPhoto(_ image: UIImage) async {
        self.capturedImage = image
        self.isProcessing = true
        self.errorMessage = nil

        do {
            let ocrText = try await VisionService.shared.performOCR(on: image)
            self.extractedText = ocrText
            
            let explanation = try await ExplanationGenerator.shared.generateExplanation(for: ocrText)
            self.generatedExplanation = explanation

            // Award XP & update streak
            XPManager.shared.addXP(50)
            StreakManager.shared.recordStudySession()
            AchievementManager.shared.unlockAchievement(id: "first_step")
        } catch {
            self.errorMessage = "Impossible d'analyser l'exercice : \(error.localizedDescription)"
        }

        self.isProcessing = false
    }
}
