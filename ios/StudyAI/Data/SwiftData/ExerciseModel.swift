import Foundation
import SwiftData

@Model
final class ExerciseModel {
    @Attribute(.unique) var id: UUID
    var imageData: Data
    var capturedDate: Date
    var extractedText: String?
    var subject: String?
    var isFavorite: Bool
    
    // JSON-encoded string stored for explanation details
    var explanationJSON: String?

    init(
        id: UUID = UUID(),
        imageData: Data,
        capturedDate: Date = Date(),
        extractedText: String? = nil,
        subject: String? = nil,
        isFavorite: Bool = false,
        explanationJSON: String? = nil
    ) {
        self.id = id
        self.imageData = imageData
        self.capturedDate = capturedDate
        self.extractedText = extractedText
        self.subject = subject
        self.isFavorite = isFavorite
        self.explanationJSON = explanationJSON
    }
}
