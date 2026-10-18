import SwiftUI

/// A stream of fire flowing from the leading edge (the mouth) to the trailing edge.
///
/// With Reduce Motion on, a still flame is shown instead of animated particles.
struct FireBreathView: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        if reduceMotion {
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(
                    LinearGradient(colors: [.yellow, .orange, .red], startPoint: .bottom, endPoint: .top)
                )
                .rotationEffect(.degrees(90))
                .accessibilityHidden(true)
        } else {
            TimelineView(.animation) { timeline in
                Canvas { context, size in
                    FireRenderer.draw(
                        in: &context,
                        size: size,
                        time: timeline.date.timeIntervalSinceReferenceDate
                    )
                }
            }
            .accessibilityHidden(true)
        }
    }
}

#Preview {
    FireBreathView()
        .frame(width: 200, height: 120)
}
