import SwiftUI

struct QuizPlayView: View {
    let quiz: Quiz
    @StateObject private var viewModel = QuizViewModel()
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Color.backgroundGradient.ignoresSafeArea()

            if viewModel.isCompleted {
                QuizResultView(
                    score: viewModel.score,
                    total: quiz.questions.count,
                    xpEarned: (viewModel.score * 100) / max(quiz.questions.count, 1),
                    onDismiss: { dismiss() }
                )
            } else if !quiz.questions.isEmpty && viewModel.currentQuestionIndex < quiz.questions.count {
                let question = quiz.questions[viewModel.currentQuestionIndex]

                VStack(spacing: 20) {
                    // Header
                    HStack {
                        Button { dismiss() } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title2)
                                .foregroundColor(.white.opacity(0.7))
                        }
                        Spacer()
                        Text(quiz.title)
                            .font(.headline)
                            .foregroundColor(.white)
                            .lineLimit(1)
                        Spacer()
                    }

                    // Progress
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 6)
                                .fill(Color.white.opacity(0.15))
                            RoundedRectangle(cornerRadius: 6)
                                .fill(Color.xpGradient)
                                .frame(width: geometry.size.width * CGFloat(viewModel.currentQuestionIndex + 1) / CGFloat(quiz.questions.count))
                                .animation(.spring(), value: viewModel.currentQuestionIndex)
                        }
                    }
                    .frame(height: 8)

                    // Question
                    QuestionCard(
                        question: question,
                        questionNumber: viewModel.currentQuestionIndex + 1,
                        totalQuestions: quiz.questions.count
                    )

                    // Answer options
                    VStack(spacing: 10) {
                        ForEach(Array(question.options.enumerated()), id: \.offset) { index, option in
                            AnswerOptionView(
                                text: option,
                                index: index,
                                isSelected: viewModel.selectedAnswerIndex == index,
                                isCorrect: index == question.correctAnswerIndex,
                                showResult: viewModel.selectedAnswerIndex != nil,
                                action: { viewModel.selectAnswer(index: index) }
                            )
                        }
                    }

                    Spacer()

                    // Next button
                    if viewModel.selectedAnswerIndex != nil {
                        // Show explanation if available
                        if let explanation = question.explanation {
                            GlassCard {
                                HStack(alignment: .top, spacing: 8) {
                                    Image(systemName: "lightbulb.fill")
                                        .foregroundColor(.warningYellow)
                                    Text(explanation)
                                        .font(.subheadline)
                                        .foregroundColor(.white.opacity(0.9))
                                }
                            }
                        }

                        GlassButton(title: viewModel.currentQuestionIndex + 1 < quiz.questions.count ? "Question suivante" : "Voir les résultats", icon: "arrow.right") {
                            viewModel.nextQuestion()
                        }
                    }
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.currentQuiz = quiz
        }
    }
}
