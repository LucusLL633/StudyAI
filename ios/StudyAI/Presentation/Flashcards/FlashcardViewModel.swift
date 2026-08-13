import SwiftUI
import Combine

@MainActor
final class FlashcardViewModel: ObservableObject {
    @Published var decks: [FlashcardDeck] = []
    @Published var currentDeck: FlashcardDeck?
    @Published var currentCardIndex: Int = 0
    @Published var isFlipped: Bool = false

    init() {
        loadSampleDecks()
    }

    func loadSampleDecks() {
        self.decks = [
            FlashcardDeck(
                id: UUID(),
                title: "Mathématiques - Théorèmes",
                subject: "Maths",
                colorHex: "4A90E2",
                createdDate: Date(),
                cards: [
                    Flashcard(id: UUID(), question: "Théorème de Pythagore ?", answer: "Dans un triangle rectangle, a² + b² = c².", timesReviewed: 3, timesCorrect: 3, nextReviewDate: Date()),
                    Flashcard(id: UUID(), question: "Dérivée de f(x) = x² ?", answer: "f'(x) = 2x.", timesReviewed: 2, timesCorrect: 2, nextReviewDate: Date()),
                    Flashcard(id: UUID(), question: "Formule de la loi binomiale ?", answer: "P(X=k) = (n choose k) * p^k * (1-p)^(n-k)", timesReviewed: 1, timesCorrect: 1, nextReviewDate: Date())
                ]
            ),
            FlashcardDeck(
                id: UUID(),
                title: "Histoire - Révolution Française",
                subject: "Histoire",
                colorHex: "9B59B6",
                createdDate: Date(),
                cards: [
                    Flashcard(id: UUID(), question: "Date de la Prise de la Bastille ?", answer: "14 Juillet 1789.", timesReviewed: 5, timesCorrect: 4, nextReviewDate: Date()),
                    Flashcard(id: UUID(), question: "Déclaration des Droits de l'Homme ?", answer: "26 Août 1789.", timesReviewed: 2, timesCorrect: 2, nextReviewDate: Date())
                ]
            )
        ]
    }

    func markCardReviewed(correct: Bool) {
        guard let deck = currentDeck, currentCardIndex < deck.cards.count else { return }
        
        XPManager.shared.addXP(5)
        
        if currentCardIndex + 1 < deck.cards.count {
            currentCardIndex += 1
            isFlipped = false
        } else {
            // Deck completed
            XPManager.shared.addXP(20)
            AchievementManager.shared.unlockAchievement(id: "card_master")
            currentCardIndex = 0
            isFlipped = false
        }
    }
}
