import SwiftUI

struct QuestionCard: View {
    let question: Question
    let questionNumber: Int
    let totalQuestions: Int

    var body: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("Question \(questionNumber)/\(totalQuestions)")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.accentCyan)
                    Spacer()
                }

                Text(question.questionText)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}
