import SwiftUI

/// One eye with its eyebrow. Relaxed eyes are drawn as happy closed arcs.
struct DragonEye: View {
    let isRelaxed: Bool
    let browRotation: Angle

    var body: some View {
        if isRelaxed {
            CurveShape(curvature: -1)
                .stroke(.black.opacity(0.8), style: StrokeStyle(lineWidth: 3.5, lineCap: .round))
                .frame(width: 22, height: 9)
                .offset(y: 8)
        } else {
            VStack(spacing: 4) {
                Capsule()
                    .fill(.black.opacity(0.75))
                    .frame(width: 24, height: 6)
                    .rotationEffect(browRotation)

                ZStack {
                    Circle()
                        .fill(.white)

                    Circle()
                        .fill(.black)
                        .frame(width: 13, height: 13)
                        .offset(x: 3, y: 2)

                    Circle()
                        .fill(.white)
                        .frame(width: 4, height: 4)
                        .offset(x: 5, y: -1)
                }
                .frame(width: 26, height: 26)
            }
        }
    }
}

#Preview {
    HStack(spacing: 30) {
        DragonEye(isRelaxed: true, browRotation: .zero)
        DragonEye(isRelaxed: false, browRotation: .degrees(25))
    }
}
