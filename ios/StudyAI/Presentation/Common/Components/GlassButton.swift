import SwiftUI

struct GlassButton: View {
    let title: String
    let icon: String?
    let isPrimary: Bool
    let action: () -> Void

    init(title: String, icon: String? = nil, isPrimary: Bool = true, action: @escaping () -> Void) {
        self.title = title
        self.icon = icon
        self.isPrimary = isPrimary
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if let icon = icon {
                    Image(systemName: icon)
                }
                Text(title)
            }
            .glassButton(isPrimary: isPrimary)
        }
    }
}
