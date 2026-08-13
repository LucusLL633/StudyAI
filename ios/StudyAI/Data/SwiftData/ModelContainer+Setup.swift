import Foundation
import SwiftData

@MainActor
final class ModelContainerSetup {
    static let sharedContainer: ModelContainer = {
        let schema = Schema([
            UserModel.self,
            ExerciseModel.self,
            QuizModel.self,
            FlashcardDeckModel.self,
            RevisionSheetModel.self
        ])
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            return try ModelContainer(for: schema, configurations: [config])
        } catch {
            fatalError("Impossible de créer le ModelContainer SwiftData : \(error)")
        }
    }()
}
