import XCTest
@testable import StudyAI

final class StudyAITests: XCTestCase {
    func testXPManagerLevelUp() async throws {
        await MainActor.run {
            let xpManager = XPManager.shared
            let initialLevel = xpManager.level
            xpManager.addXP(100)
            XCTAssertGreaterThan(xpManager.level, initialLevel)
        }
    }
}
