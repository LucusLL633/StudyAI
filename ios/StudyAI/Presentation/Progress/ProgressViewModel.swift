import SwiftUI
import Combine

@MainActor
final class ProgressViewModel: ObservableObject {
    @Published var totalExercises: Int = 12
    @Published var totalQuizzes: Int = 5
    @Published var totalFlashcards: Int = 34
    @Published var totalStudyMinutes: Int = 420
    @Published var averageQuizScore: Double = 0.78
}
