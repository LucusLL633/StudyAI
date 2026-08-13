import SwiftUI

@MainActor
final class OnboardingViewModel: ObservableObject {
    @Published var currentPage: Int = 0

    func completeOnboarding() {
        UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
    }
}
