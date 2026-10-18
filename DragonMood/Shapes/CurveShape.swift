import SwiftUI

/// A single curved line: 1 bends down into a smile, -1 arches up like a frown
/// (or a happy closed eye), and 0 is flat. Animates smoothly between values.
@Animatable
nonisolated struct CurveShape: Shape {
    var curvature: Double

    func path(in rect: CGRect) -> Path {
        // The ends rise as the middle dips, so the curve stays inside the rect.
        let endY = rect.midY - curvature * rect.height / 2
        let controlY = rect.midY + curvature * rect.height * 1.5

        return Path { path in
            path.move(to: CGPoint(x: rect.minX, y: endY))
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: endY),
                control: CGPoint(x: rect.midX, y: controlY)
            )
        }
    }
}
