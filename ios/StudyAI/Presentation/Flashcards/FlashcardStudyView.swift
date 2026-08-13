import SwiftUI

struct FlashcardStudyView: View {
    let deck: FlashcardDeck
    @StateObject private var viewModel = FlashcardViewModel()
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Color.backgroundGradient.ignoresSafeArea()

            VStack(spacing: 24) {
                // Header
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    Spacer()
                    Text(deck.title)
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Text("\(viewModel.currentCardIndex + 1) / \(deck.cards.count)")
                        .bold()
                        .foregroundColor(.accentCyan)
                }

                if !deck.cards.isEmpty && viewModel.currentCardIndex < deck.cards.count {
                    let card = deck.cards[viewModel.currentCardIndex]

                    FlipCardView(question: card.question, answer: card.answer, isFlipped: $viewModel.isFlipped)

                    HStack(spacing: 20) {
                        Button {
                            viewModel.markCardReviewed(correct: false)
                        } label: {
                            HStack {
                                Image(systemName: "xmark")
                                Text("À revoir")
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 16).fill(Color.errorRed.opacity(0.8)))
                            .foregroundColor(.white)
                            .bold()
                        }

                        Button {
                            viewModel.markCardReviewed(correct: true)
                        } label: {
                            HStack {
                                Image(systemName: "checkmark")
                                Text("Compris")
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 16).fill(Color.successGreen.opacity(0.8)))
                            .foregroundColor(.white)
                            .bold()
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.currentDeck = deck
        }
    }
}
