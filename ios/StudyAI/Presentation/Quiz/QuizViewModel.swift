import SwiftUI

@MainActor
final class QuizViewModel: ObservableObject {
    @Published var quizzes: [Quiz] = []
    @Published var currentQuiz: Quiz?
    @Published var currentQuestionIndex: Int = 0
    @Published var selectedAnswerIndex: Int?
    @Published var score: Int = 0
    @Published var isCompleted: Bool = false

    init() {
        loadSampleQuizzes()
    }

    func loadSampleQuizzes() {
        self.quizzes = [
            Quiz(
                id: UUID(),
                title: "Quiz Général - Sciences & Histoire",
                subject: "Sciences",
                createdDate: Date(),
                questions: [
                    Question(id: UUID(), questionText: "Quelle est la vitesse de la lumière ?", options: ["300 000 km/s", "150 000 km/s", "1 000 000 km/s", "30 000 km/s"], correctAnswerIndex: 0, explanation: "La vitesse de la lumière dans le vide est d'environ 300 000 km/s."),
                    Question(id: UUID(), questionText: "En quelle année a été signée l'Armistice de la 1ère GM ?", options: ["1945", "1918", "1914", "1939"], correctAnswerIndex: 1, explanation: "Signé le 11 Novembre 1918.")
                ],
                attempts: []
            )
        ]
    }

    func selectAnswer(index: Int) {
        guard selectedAnswerIndex == nil, let quiz = currentQuiz else { return }
        selectedAnswerIndex = index
        if index == quiz.questions[currentQuestionIndex].correctAnswerIndex {
            score += 1
        }
    }

    func nextQuestion() {
        guard let quiz = currentQuiz else { return }
        if currentQuestionIndex + 1 < quiz.questions.count {
            currentQuestionIndex += 1
            selectedAnswerIndex = nil
        } else {
            isCompleted = true
            let xpEarned = (score * 100) / max(quiz.questions.count, 1)
            XPManager.shared.addXP(xpEarned)
            if score == quiz.questions.count {
                AchievementManager.shared.unlockAchievement(id: "perfectionist")
            }
        }
    }
}
