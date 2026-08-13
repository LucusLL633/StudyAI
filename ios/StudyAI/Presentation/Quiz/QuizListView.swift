import SwiftUI

struct QuizListView: View {
    @ObservedObject var router: Router
    @StateObject private var viewModel = QuizViewModel()
    @State private var selectedQuiz: Quiz?

    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundGradient.ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Text("Mes Quiz")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                            Spacer()
                            Button {
                                // Add new quiz
                            } label: {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.accentCyan)
                            }
                        }

                        if viewModel.quizzes.isEmpty {
                            VStack(spacing: 16) {
                                Image(systemName: "questionmark.circle")
                                    .font(.system(size: 48))
                                    .foregroundColor(.white.opacity(0.4))
                                Text("Aucun quiz pour le moment")
                                    .font(.headline)
                                    .foregroundColor(.white.opacity(0.6))
                                Text("Photographiez un exercice et générez un quiz automatiquement !")
                                    .font(.subheadline)
                                    .foregroundColor(.white.opacity(0.4))
                                    .multilineTextAlignment(.center)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.top, 60)
                        } else {
                            ForEach(viewModel.quizzes) { quiz in
                                GlassCard {
                                    VStack(alignment: .leading, spacing: 10) {
                                        HStack {
                                            VStack(alignment: .leading, spacing: 4) {
                                                Text(quiz.title)
                                                    .font(.headline)
                                                    .foregroundColor(.white)
                                                Text("\(quiz.questions.count) questions • \(quiz.subject)")
                                                    .font(.subheadline)
                                                    .foregroundColor(.white.opacity(0.7))
                                            }
                                            Spacer()
                                        }

                                        if !quiz.attempts.isEmpty, let last = quiz.attempts.last {
                                            HStack {
                                                Image(systemName: "clock.arrow.circlepath")
                                                    .foregroundColor(.accentCyan)
                                                Text("Dernier score : \(last.score)/\(last.totalQuestions)")
                                                    .font(.caption)
                                                    .foregroundColor(.white.opacity(0.7))
                                            }
                                        }

                                        Button {
                                            selectedQuiz = quiz
                                        } label: {
                                            HStack {
                                                Image(systemName: "play.fill")
                                                Text("Lancer le quiz")
                                            }
                                            .frame(maxWidth: .infinity)
                                            .glassButton()
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .fullScreenCover(item: $selectedQuiz) { quiz in
                QuizPlayView(quiz: quiz)
            }
        }
    }
}
