import Foundation

struct ExplanationStep: Identifiable, Codable {
    var id: UUID = UUID()
    let stepNumber: Int
    let title: String
    let detail: String
}

struct Explanation: Identifiable, Codable {
    let id: UUID
    let summary: String
    let steps: [ExplanationStep]
    let keyPoints: [String]
    let relatedConcepts: [String]
    let generatedDate: Date
}
