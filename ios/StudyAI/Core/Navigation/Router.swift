import SwiftUI
import Combine

enum AppScreen: Hashable {
    case onboarding
    case home
    case camera
    case photoPreview(imageData: Data)
    case processing(imageData: Data)
    case explanation(exerciseId: UUID)
    case revisionSheets
    case revisionDetail(sheetId: UUID)
    case quizList
    case quizPlay(quizId: UUID)
    case quizResult(score: Int, total: Int, xpEarned: Int)
    case flashcards
    case flashcardStudy(deckId: UUID)
    case planner
    case progress
    case profile
    case settings
}

@MainActor
final class Router: ObservableObject {
    @Published var path = NavigationPath()
    @Published var selectedTab: Int = 0

    func navigate(to screen: AppScreen) {
        path.append(screen)
    }

    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }

    func popToRoot() {
        path = NavigationPath()
    }
}
