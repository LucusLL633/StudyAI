import SwiftUI

struct AnswerOptionView: View {
    let text: String
    let index: Int
    let isSelected: Bool
    let isCorrect: Bool
    let showResult: Bool
    let action: () -> Void

    private var backgroundColor: Color {
        guard showResult else {
            return isSelected ? Color.primaryPurple.opacity(0.6) : Color.white.opacity(0.1)
        }
        if isCorrect {
            return Color.successGreen.opacity(0.7)
        }
        if isSelected && !isCorrect {
            return Color.errorRed.opacity(0.7)
        }
        return Color.white.opacity(0.1)
    }

    private var borderColor: Color {
        guard showResult else {
            return isSelected ? Color.primaryPurple : Color.white.opacity(0.2)
        }
        if isCorrect {
            return Color.successGreen
        }
        if isSelected && !isCorrect {
            return Color.errorRed
        }
        return Color.white.opacity(0.2)
    }

    private let letters = ["A", "B", "C", "D"]

    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                Text(letters[index])
                    .font(.headline)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 36, height: 36)
                    .background(Circle().fill(borderColor))

                Text(text)
                    .font(.body)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)

                Spacer()

                if showResult && isCorrect {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.successGreen)
                }
                if showResult && isSelected && !isCorrect {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.errorRed)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(backgroundColor)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .strokeBorder(borderColor, lineWidth: 1.5)
                    )
            )
        }
        .disabled(showResult)
        .animation(.easeInOut(duration: 0.3), value: showResult)
    }
}
