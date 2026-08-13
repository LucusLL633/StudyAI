import SwiftUI

struct StudyPlannerView: View {
    @StateObject private var viewModel = PlannerViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundGradient.ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Planifier mes Révisions")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)

                        CalendarGridView(selectedDate: $viewModel.selectedDate)

                        // Sessions for selected day
                        let daySessions = viewModel.sessionsForDate(viewModel.selectedDate)

                        HStack {
                            Text("Sessions prévues")
                                .font(.headline)
                                .foregroundColor(.white)
                            Spacer()
                            Button {
                                // Add session
                            } label: {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.accentCyan)
                            }
                        }

                        if daySessions.isEmpty {
                            GlassCard {
                                VStack(spacing: 10) {
                                    Image(systemName: "calendar.badge.clock")
                                        .font(.title)
                                        .foregroundColor(.white.opacity(0.4))
                                    Text("Aucune session prévue")
                                        .foregroundColor(.white.opacity(0.6))
                                }
                                .frame(maxWidth: .infinity)
                            }
                        } else {
                            ForEach(daySessions) { session in
                                SessionCard(session: session) {
                                    viewModel.toggleComplete(session: session)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}
