import SwiftUI

struct SessionCard: View {
    let session: StudySession
    let onToggle: () -> Void

    var body: some View {
        GlassCard {
            HStack(spacing: 14) {
                Button(action: onToggle) {
                    Image(systemName: session.isCompleted ? "checkmark.circle.fill" : "circle")
                        .font(.title2)
                        .foregroundColor(session.isCompleted ? .successGreen : .white.opacity(0.5))
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text(session.title)
                        .font(.headline)
                        .foregroundColor(.white)
                        .strikethrough(session.isCompleted)
                    HStack {
                        Text(session.subject)
                            .font(.caption)
                            .foregroundColor(.accentCyan)
                        Text("•")
                            .foregroundColor(.white.opacity(0.3))
                        Text("\(session.durationMinutes) min")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.6))
                    }
                }
                Spacer()
            }
        }
    }
}
