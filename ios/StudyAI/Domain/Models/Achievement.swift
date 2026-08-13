import Foundation

struct Achievement: Identifiable, Codable {
    let id: String
    let title: String
    let description: String
    let iconName: String
    var isUnlocked: Bool
    var unlockedDate: Date?

    static let defaultList: [Achievement] = [
        Achievement(id: "first_step", title: "Premier Pas", description: "Photographier votre premier exercice", iconName: "camera.fill", isUnlocked: false),
        Achievement(id: "studious", title: "Studieux", description: "Enregistrer 10 exercices", iconName: "book.fill", isUnlocked: false),
        Achievement(id: "marathon", title: "Marathonien", description: "Maintenir une série de 7 jours", iconName: "flame.fill", isUnlocked: false),
        Achievement(id: "perfectionist", title: "Perfectionniste", description: "Obtenir 100% à un quiz", iconName: "star.fill", isUnlocked: false),
        Achievement(id: "card_master", title: "Bibliothécaire", description: "Créer 20 flashcards", iconName: "rectangle.on.rectangle.angled", isUnlocked: false),
        Achievement(id: "model_student", title: "Élève Modèle", description: "Atteindre le Niveau 5", iconName: "trophy.fill", isUnlocked: false)
    ]
}
