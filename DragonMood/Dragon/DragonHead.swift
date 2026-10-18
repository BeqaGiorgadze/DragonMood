import SwiftUI

/// The dragon's head, facing slightly right: horns, snout, eyes, cheek and mouth.
struct DragonHead: View {
    let level: AngerLevel

    private let hornColor = Color(red: 1, green: 0.92, blue: 0.72)
    private let ink = Color(red: 0.22, green: 0.12, blue: 0.10)

    var body: some View {
        ZStack {
            Triangle()
                .fill(hornColor)
                .frame(width: 22, height: 36)
                .rotationEffect(.degrees(-18))
                .offset(x: -28, y: -58)

            Triangle()
                .fill(hornColor)
                .frame(width: 22, height: 36)
                .rotationEffect(.degrees(12))
                .offset(x: 16, y: -62)

            Circle()
                .fill(level.dragonColor)
                .frame(width: 110, height: 110)

            Ellipse()
                .fill(level.dragonColor)
                .frame(width: 66, height: 48)
                .offset(x: 48, y: 18)

            Capsule()
                .fill(ink.opacity(0.6))
                .frame(width: 5, height: 9)
                .offset(x: 64, y: 8)

            Capsule()
                .fill(ink.opacity(0.6))
                .frame(width: 5, height: 9)
                .offset(x: 76, y: 10)

            Circle()
                .fill(.pink.opacity(level.cheekOpacity))
                .frame(width: 18, height: 18)
                .offset(x: -28, y: 18)

            // Mirror the brow angle so both inner ends point toward the snout.
            DragonEye(isRelaxed: level.hasRelaxedEyes, browRotation: .degrees(level.browAngle))
                .offset(x: -12, y: -14)

            DragonEye(isRelaxed: level.hasRelaxedEyes, browRotation: .degrees(-level.browAngle))
                .offset(x: 26, y: -16)

            if level.breathesFire {
                Ellipse()
                    .fill(ink)
                    .frame(width: 24, height: 20)
                    .offset(x: 68, y: 32)
            } else {
                CurveShape(curvature: level.mouthCurvature)
                    .stroke(ink, style: StrokeStyle(lineWidth: 3.5, lineCap: .round))
                    .frame(width: 28, height: 10)
                    .offset(x: 58, y: 32)
            }

            if level == .annoyed {
                SmokePuffs()
                    .offset(x: 94, y: -8)
                    .transition(.opacity)
            }
        }
        .frame(width: 150, height: 150)
    }
}

#Preview {
    DragonHead(level: .annoyed)
}
