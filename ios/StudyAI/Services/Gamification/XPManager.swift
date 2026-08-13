import Foundation

@MainActor
final class XPManager: ObservableObject {
    static let shared = XPManager()

    @Published var currentXP: Int = 0
    @Published var level: Int = 1
    @Published var xpToNextLevel: Int = 100
    @Published var justLeveledUp: Bool = false

    private init() {}

    func addXP(_ amount: Int) {
        currentXP += amount
        checkLevelUp()
    }

    private func checkLevelUp() {
        while currentXP >= xpToNextLevel {
            currentXP -= xpToNextLevel
            level += 1
            xpToNextLevel = level * level * 100
            justLeveledUp = true
        }
    }

    func resetLevelUpFlag() {
        justLeveledUp = false
    }
}
