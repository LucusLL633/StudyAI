import SwiftUI

extension Color {
    // Hex initializer helper
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }

    // Modern Palette
    static let primaryBlue = Color(hex: "4A90E2")
    static let primaryPurple = Color(hex: "9B59B6")
    static let primaryGreen = Color(hex: "2ECC71")
    static let primaryOrange = Color(hex: "E67E22")
    static let accentCoral = Color(hex: "FF6B6B")
    static let accentCyan = Color(hex: "4ECDC4")

    // Glassmorphism System
    static let glassBackground = Color.white.opacity(0.15)
    static let glassBorder = Color.white.opacity(0.3)
    static let glassHighlight = Color.white.opacity(0.12)
    static let darkGlassBackground = Color.black.opacity(0.3)

    // Semantics
    static let successGreen = Color(hex: "27AE60")
    static let errorRed = Color(hex: "E74C3C")
    static let warningYellow = Color(hex: "F39C12")

    // Gradients
    static let brandGradient = LinearGradient(
        colors: [Color(hex: "4A90E2"), Color(hex: "9B59B6")],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let streakGradient = LinearGradient(
        colors: [Color(hex: "FF8C00"), Color(hex: "FF0055")],
        startPoint: .top,
        endPoint: .bottom
    )

    static let xpGradient = LinearGradient(
        colors: [Color(hex: "00F2FE"), Color(hex: "4FACFE")],
        startPoint: .leading,
        endPoint: .trailing
    )

    static let backgroundGradient = LinearGradient(
        colors: [Color(hex: "0F2027"), Color(hex: "203A43"), Color(hex: "2C5364")],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
