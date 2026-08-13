import SwiftUI

struct CalendarGridView: View {
    @Binding var selectedDate: Date
    private let calendar = Calendar.current
    private let daysOfWeek = ["L", "M", "M", "J", "V", "S", "D"]

    private var month: Date {
        calendar.date(from: calendar.dateComponents([.year, .month], from: selectedDate))!
    }

    private var daysInMonth: [Date] {
        guard let range = calendar.range(of: .day, in: .month, for: month) else { return [] }
        return range.compactMap { day -> Date? in
            calendar.date(bySetting: .day, value: day, of: month)
        }
    }

    private var firstWeekdayOffset: Int {
        let weekday = calendar.component(.weekday, from: month)
        return (weekday + 5) % 7 // Convert to Mon=0 start
    }

    var body: some View {
        VStack(spacing: 12) {
            // Month header
            HStack {
                Button {
                    selectedDate = calendar.date(byAdding: .month, value: -1, to: selectedDate) ?? selectedDate
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                }
                Spacer()
                Text(month, format: .dateTime.month(.wide).year())
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Button {
                    selectedDate = calendar.date(byAdding: .month, value: 1, to: selectedDate) ?? selectedDate
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                }
            }

            // Day-of-week headers
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 8) {
                ForEach(daysOfWeek, id: \.self) { day in
                    Text(day)
                        .font(.caption)
                        .bold()
                        .foregroundColor(.white.opacity(0.5))
                }

                // Empty cells for offset
                ForEach(0..<firstWeekdayOffset, id: \.self) { _ in
                    Text("")
                }

                // Day cells
                ForEach(daysInMonth, id: \.self) { date in
                    let isSelected = calendar.isDate(date, inSameDayAs: selectedDate)
                    let isToday = calendar.isDateInToday(date)

                    Button {
                        selectedDate = date
                    } label: {
                        Text("\(calendar.component(.day, from: date))")
                            .font(.body)
                            .fontWeight(isToday ? .bold : .regular)
                            .foregroundColor(isSelected ? .white : (isToday ? .accentCyan : .white.opacity(0.8)))
                            .frame(width: 36, height: 36)
                            .background(
                                Circle()
                                    .fill(isSelected ? Color.primaryPurple : Color.clear)
                            )
                    }
                }
            }
        }
        .padding()
        .glassCard()
    }
}
