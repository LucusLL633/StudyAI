import SwiftUI

struct GlassmorphicCardModifier: ViewModifier {
    var cornerRadius: CGFloat = 20
    var opacity: Double = 0.15
    var borderOpacity: Double = 0.3

    func body(content: Content) -> some View {
        content
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(.ultraThinMaterial)
                    
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(opacity),
                                    Color.white.opacity(opacity * 0.3)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .strokeBorder(Color.white.opacity(borderOpacity), lineWidth: 1)
                }
            )
            .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
    }
}

struct GlassmorphicButtonModifier: ViewModifier {
    var cornerRadius: CGFloat = 16
    var isPrimary: Bool = true

    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .padding(.horizontal, 20)
            .padding(.vertical, 14)
            .background(
                ZStack {
                    if isPrimary {
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(Color.brandGradient)
                    } else {
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(.ultraThinMaterial)
                    }

                    RoundedRectangle(cornerRadius: cornerRadius)
                        .strokeBorder(Color.white.opacity(0.4), lineWidth: 1)
                }
            )
            .shadow(color: isPrimary ? Color.primaryPurple.opacity(0.4) : Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}

extension View {
    func glassCard(cornerRadius: CGFloat = 20, opacity: Double = 0.15, borderOpacity: Double = 0.3) -> some View {
        self.modifier(GlassmorphicCardModifier(cornerRadius: cornerRadius, opacity: opacity, borderOpacity: borderOpacity))
    }

    func glassButton(cornerRadius: CGFloat = 16, isPrimary: Bool = true) -> some View {
        self.modifier(GlassmorphicButtonModifier(cornerRadius: cornerRadius, isPrimary: isPrimary))
    }
}
