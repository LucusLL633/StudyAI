import SwiftUI

struct AppTheme {
    static let cornerRadius: CGFloat = 20
    static let buttonCornerRadius: CGFloat = 16
    static let smallCornerRadius: CGFloat = 12

    struct Spacing {
        static let xs: CGFloat = 4
        static let sm: CGFloat = 8
        static let md: CGFloat = 16
        static let lg: CGFloat = 24
        static let xl: CGFloat = 32
    }

    struct Fonts {
        static func titleLarge() -> Font {
            .system(size: 28, weight: .bold, design: .rounded)
        }
        static func titleMedium() -> Font {
            .system(size: 22, weight: .bold, design: .rounded)
        }
        static func titleSmall() -> Font {
            .system(size: 18, weight: .semibold, design: .rounded)
        }
        static func bodyText() -> Font {
            .system(size: 16, weight: .regular, design: .default)
        }
        static func captionText() -> Font {
            .system(size: 13, weight: .medium, design: .default)
        }
    }
}
