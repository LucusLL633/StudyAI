import SwiftUI

struct RevisionEditorView: View {
    @State private var title: String = ""
    @State private var subject: String = ""
    @State private var summary: String = ""
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Color.backgroundGradient.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Button { dismiss() } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title2)
                                .foregroundColor(.white.opacity(0.7))
                        }
                        Spacer()
                        Text("Nouvelle Fiche")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                        Button {
                            // Save
                            dismiss()
                        } label: {
                            Text("Enregistrer")
                                .bold()
                                .foregroundColor(.accentCyan)
                        }
                    }

                    GlassCard {
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Titre")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.7))
                            TextField("Ex: Théorème de Pythagore", text: $title)
                                .textFieldStyle(.plain)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))

                            Text("Matière")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.7))
                            TextField("Ex: Mathématiques", text: $subject)
                                .textFieldStyle(.plain)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))

                            Text("Résumé")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.7))
                            TextEditor(text: $summary)
                                .foregroundColor(.white)
                                .scrollContentBackground(.hidden)
                                .frame(minHeight: 120)
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                        }
                    }
                }
                .padding()
            }
        }
    }
}
