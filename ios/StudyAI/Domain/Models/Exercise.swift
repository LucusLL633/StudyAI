import Foundation

struct Exercise: Identifiable, Codable {
    let id: UUID
    let imageData: Data
    let capturedDate: Date
    var extractedText: String?
    var subject: String?
    var explanation: Explanation?
    var isFavorite: Bool
}
