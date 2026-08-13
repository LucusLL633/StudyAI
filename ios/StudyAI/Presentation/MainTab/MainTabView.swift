import SwiftUI

struct MainTabView: View {
    @StateObject private var router = Router()
    @StateObject private var xpManager = XPManager.shared
    @StateObject private var streakManager = StreakManager.shared

    var body: some View {
        TabView(selection: $router.selectedTab) {
            HomeView(router: router)
                .tabItem {
                    Label("Accueil", systemImage: "house.fill")
                }
                .tag(0)

            ExerciseCameraView(router: router)
                .tabItem {
                    Label("Scanner", systemImage: "camera.fill")
                }
                .tag(1)

            DeckListView(router: router)
                .tabItem {
                    Label("Flashcards", systemImage: "rectangle.on.rectangle.angled")
                }
                .tag(2)

            QuizListView(router: router)
                .tabItem {
                    Label("Quiz", systemImage: "checkmark.seal.fill")
                }
                .tag(3)

            ProgressView(router: router)
                .tabItem {
                    Label("Progrès", systemImage: "chart.bar.fill")
                }
                .tag(4)
        }
        .accentColor(.primaryPurple)
        .environmentObject(router)
    }
}

#Preview {
    MainTabView()
}
