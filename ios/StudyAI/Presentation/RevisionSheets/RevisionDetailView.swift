import SwiftUI

struct RevisionDetailView: View {
    let sheet: RevisionSheet
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Color.backgroundGradient.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Header
                    HStack {
                        Button { dismiss() } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title2)
                                .foregroundColor(.white.opacity(0.7))
                        }
                        Spacer()
                    }

                    // Title card
                    GlassCard {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color(hex: sheet.colorHex))
                                    .frame(width: 6, height: 30)
                                Text(sheet.title)
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.white)
                            }

                            Text(sheet.subject)
                                .font(.subheadline)
                                .foregroundColor(Color(hex: sheet.colorHex))

                            Text(sheet.summary)
                                .font(.body)
                                .foregroundColor(.white.opacity(0.85))
                        }
                    }

                    // Sections
                    ForEach(sheet.sections) { section in
                        GlassCard {
                            VStack(alignment: .leading, spacing: 10) {
                                Text(section.title)
                                    .font(.headline)
                                    .foregroundColor(.accentCyan)

                                ForEach(section.bulletPoints, id: \.self) { point in
                                    HStack(alignment: .top, spacing: 8) {
                                        Circle()
                                            .fill(Color(hex: sheet.colorHex))
                                            .frame(width: 6, height: 6)
                                            .padding(.top, 7)
                                        Text(point)
                                            .font(.body)
                                            .foregroundColor(.white.opacity(0.9))
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}
