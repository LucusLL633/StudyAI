import SwiftUI
import Combine

@MainActor
final class RevisionViewModel: ObservableObject {
    @Published var sheets: [RevisionSheet] = []

    init() {
        loadSampleSheets()
    }

    func loadSampleSheets() {
        self.sheets = [
            RevisionSheet(
                id: UUID(),
                title: "Théorèmes fondamentaux",
                subject: "Mathématiques",
                createdDate: Date(),
                sections: [
                    RevisionSection(title: "Théorème de Pythagore", bulletPoints: [
                        "S'applique aux triangles rectangles",
                        "a² + b² = c² où c est l'hypoténuse",
                        "Réciproque : si a² + b² = c², le triangle est rectangle"
                    ]),
                    RevisionSection(title: "Théorème de Thalès", bulletPoints: [
                        "Droites parallèles coupées par deux sécantes",
                        "Les rapports de longueur sont conservés",
                        "Utile pour calculer des distances inaccessibles"
                    ])
                ],
                summary: "Fiche résumant les théorèmes fondamentaux de géométrie au programme.",
                colorHex: "4A90E2"
            ),
            RevisionSheet(
                id: UUID(),
                title: "La Révolution Française",
                subject: "Histoire",
                createdDate: Date().addingTimeInterval(-86400),
                sections: [
                    RevisionSection(title: "Causes", bulletPoints: [
                        "Crise financière de la monarchie",
                        "Inégalités entre les trois ordres",
                        "Influence des Lumières"
                    ]),
                    RevisionSection(title: "Dates clés", bulletPoints: [
                        "14 Juillet 1789 : Prise de la Bastille",
                        "26 Août 1789 : Déclaration des Droits de l'Homme",
                        "21 Septembre 1792 : Proclamation de la République"
                    ])
                ],
                summary: "Fiche couvrant les causes, dates clés et conséquences de la Révolution Française.",
                colorHex: "9B59B6"
            )
        ]
    }
}
