import SwiftUI

struct DeckListView: View {
    @ObservedObject var router: Router
    @StateObject private var viewModel = FlashcardViewModel()
    @State private var selectedDeckForStudy: FlashcardDeck?

    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundGradient.ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Text("Flashcards & Decks")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                            Spacer()
                            Button {
                                // Add custom deck
                            } label: {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.accentCyan)
                            }
                        }

                        ForEach(viewModel.decks) { deck in
                            GlassCard {
                                HStack {
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text(deck.title)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        Text("\(deck.cards.count) cartes • \(deck.subject)")
                                            .font(.subheadline)
                                            .foregroundColor(.white.opacity(0.7))
                                    }
                                    Spacer()
                                    Button {
                                        selectedDeckForStudy = deck
                                    } label: {
                                        Text("Étudier")
                                            .bold()
                                            .glassButton(cornerRadius: 12, isPrimary: true)
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .fullScreenCover(item: $selectedDeckForStudy) { deck in
                FlashcardStudyView(deck: deck)
            }
        }
    }
}
