import Foundation

final class ExplanationGenerator {
    static let shared = ExplanationGenerator()
    private init() {}

    func generateExplanation(for exerciseText: String) async throws -> Explanation {
        let systemPrompt = """
        Tu es un professeur pédagogue. Explique cet exercice en français, étape par étape.
        Réponds au format JSON strict suivant :
        {
          "summary": "Résumé du problème",
          "steps": [
            {
              "stepNumber": 1,
              "title": "Titre de l'étape",
              "detail": "Explication détaillée"
            }
          ],
          "keyPoints": ["Point clé 1", "Point clé 2"],
          "relatedConcepts": ["Concept 1", "Concept 2"]
        }

        Exercice à traiter :
        \(exerciseText)
        """

        let responseText = try await GeminiService.shared.generateContent(prompt: systemPrompt)

        // Parse JSON response
        if let data = responseText.data(using: .utf8) {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(ExplanationDTO.self, from: data) {
                return decoded.toDomain()
            }
        }

        // Fallback default explanation if parsing fails
        return Explanation(
            id: UUID(),
            summary: "Explication générée pour l'exercice.",
            steps: [
                ExplanationStep(stepNumber: 1, title: "Analyse", detail: exerciseText.isEmpty ? "Exercice photographié" : exerciseText),
                ExplanationStep(stepNumber: 2, title: "Méthode", detail: "Appliquer la formule du cours et calculer pas à pas.")
            ],
            keyPoints: ["Vérifier les résultats", "Relire l'énoncé"],
            relatedConcepts: ["Révision générale"],
            generatedDate: Date()
        )
    }
}

private struct ExplanationDTO: Codable {
    let summary: String
    let steps: [StepDTO]
    let keyPoints: [String]
    let relatedConcepts: [String]

    struct StepDTO: Codable {
        let stepNumber: Int
        let title: String
        let detail: String
    }

    func toDomain() -> Explanation {
        Explanation(
            id: UUID(),
            summary: summary,
            steps: steps.map { ExplanationStep(stepNumber: $0.stepNumber, title: $0.title, detail: $0.detail) },
            keyPoints: keyPoints,
            relatedConcepts: relatedConcepts,
            generatedDate: Date()
        )
    }
}
