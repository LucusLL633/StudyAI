import SwiftUI

struct RevisionListView: View {
    @StateObject private var viewModel = RevisionViewModel()
    @State private var selectedSheet: RevisionSheet?

    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundGradient.ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Text("Fiches de Révision")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                            Spacer()
                            Button {
                                // Add new sheet
                            } label: {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.accentCyan)
                            }
                        }

                        ForEach(viewModel.sheets) { sheet in
                            Button {
                                selectedSheet = sheet
                            } label: {
                                GlassCard {
                                    HStack {
                                        RoundedRectangle(cornerRadius: 4)
                                            .fill(Color(hex: sheet.colorHex))
                                            .frame(width: 6)

                                        VStack(alignment: .leading, spacing: 6) {
                                            Text(sheet.title)
                                                .font(.headline)
                                                .foregroundColor(.white)
                                            Text(sheet.subject)
                                                .font(.subheadline)
                                                .foregroundColor(.white.opacity(0.7))
                                            Text("\(sheet.sections.count) sections • \(sheet.createdDate.formattedShort)")
                                                .font(.caption)
                                                .foregroundColor(.white.opacity(0.5))
                                        }
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white.opacity(0.5))
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .sheet(item: $selectedSheet) { sheet in
                RevisionDetailView(sheet: sheet)
            }
        }
    }
}
