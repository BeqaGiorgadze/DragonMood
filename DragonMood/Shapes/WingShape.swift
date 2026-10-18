import SwiftUI

/// A bat-style dragon wing that attaches at the bottom-trailing corner,
/// with a scalloped lower edge.
nonisolated struct WingShape: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height

        return Path { path in
            path.move(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addQuadCurve(
                to: CGPoint(x: rect.minX, y: rect.minY + height * 0.55),
                control: CGPoint(x: rect.minX + width * 0.3, y: rect.minY)
            )
            path.addQuadCurve(
                to: CGPoint(x: rect.minX + width * 0.33, y: rect.minY + height * 0.75),
                control: CGPoint(x: rect.minX + width * 0.25, y: rect.minY + height * 0.55)
            )
            path.addQuadCurve(
                to: CGPoint(x: rect.minX + width * 0.66, y: rect.minY + height * 0.9),
                control: CGPoint(x: rect.minX + width * 0.55, y: rect.minY + height * 0.7)
            )
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.maxY),
                control: CGPoint(x: rect.minX + width * 0.85, y: rect.minY + height * 0.85)
            )
            path.closeSubpath()
        }
    }
}
