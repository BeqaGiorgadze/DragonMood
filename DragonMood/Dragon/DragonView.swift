import SwiftUI

/// The full mascot: tail, wing, body, feet and head, plus fire when angry.
///
/// Drawn entirely from SwiftUI shapes so colors and expressions animate
/// smoothly between moods without any image assets.
struct DragonView: View {
    let level: AngerLevel
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    private let bellyColor = Color(red: 1, green: 0.9, blue: 0.62)

    var body: some View {
        // Captured as a plain value so the keyframe closure doesn't capture the view.
        let shouldShake = level.breathesFire && !reduceMotion
        let shadeColor = level.dragonColor.mix(with: .black, by: 0.18)

        ZStack {
            Capsule()
                .fill(level.dragonColor)
                .frame(width: 92, height: 26)
                .rotationEffect(.degrees(-25))
                .offset(x: -82, y: 78)

            // Wings shoot up when the dragon is angry.
            WingShape()
                .fill(shadeColor)
                .frame(width: 92, height: 86)
                .rotationEffect(.degrees(level.breathesFire ? -20 : 0), anchor: .bottomTrailing)
                .offset(x: -62, y: 2)

            Ellipse()
                .fill(level.dragonColor)
                .frame(width: 124, height: 124)
                .offset(y: 50)

            Ellipse()
                .fill(bellyColor)
                .frame(width: 72, height: 84)
                .offset(x: 10, y: 58)

            ForEach([-26.0, 38.0], id: \.self) { footOffset in
                Capsule()
                    .fill(shadeColor)
                    .frame(width: 38, height: 22)
                    .offset(x: footOffset, y: 110)
            }

            DragonHead(level: level)
                .offset(x: 5, y: -40)
        }
        .frame(width: 240, height: 250)
        // Fire starts at the mouth and streams off to the right.
        .overlay {
            if level.breathesFire {
                FireBreathView()
                    .frame(width: 150, height: 120)
                    .offset(x: 153, y: -8)
                    .transition(
                        reduceMotion
                            ? .opacity
                            : .scale(scale: 0.05, anchor: .leading).combined(with: .opacity)
                    )
            }
        }
        // Make room for the flames when they appear.
        .offset(x: level.breathesFire ? -50 : 0)
        .keyframeAnimator(initialValue: 0.0, trigger: level.breathesFire) { content, angle in
            content.rotationEffect(.degrees(shouldShake ? angle : 0))
        } keyframes: { _ in
            KeyframeTrack {
                LinearKeyframe(-6, duration: 0.06)
                LinearKeyframe(6, duration: 0.08)
                LinearKeyframe(-4, duration: 0.08)
                LinearKeyframe(3, duration: 0.08)
                SpringKeyframe(0, duration: 0.25)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text(level.dragonDescription))
        .accessibilityAddTraits(.isImage)
    }
}

#Preview("Calm") {
    DragonView(level: .calm)
}

#Preview("Angry") {
    DragonView(level: .angry)
}
