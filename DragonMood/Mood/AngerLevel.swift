import SwiftUI

/// How angry the person feels, from completely calm to full fire-breathing rage.
///
/// Everything the dragon needs to express a mood lives here, so the views stay
/// purely about layout and the mapping can be unit tested.
nonisolated enum AngerLevel: Int, CaseIterable, Identifiable {
    case calm
    case grumpy
    case annoyed
    case angry

    var id: Self { self }

    var title: LocalizedStringResource {
        switch self {
        case .calm: "Calm"
        case .grumpy: "Grumpy"
        case .annoyed: "Annoyed"
        case .angry: "Angry"
        }
    }

    var emoji: String {
        switch self {
        case .calm: "😌"
        case .grumpy: "😒"
        case .annoyed: "😤"
        case .angry: "😡"
        }
    }

    /// What the dragon says in its speech bubble.
    var dragonMessage: LocalizedStringResource {
        switch self {
        case .calm: "Peaceful vibes only. Want some tea?"
        case .grumpy: "Hmph. Somebody skipped their snack."
        case .annoyed: "Grr… my nostrils are getting smoky!"
        case .angry: "RAAAWR! Stand back, I'm on fire!"
        }
    }

    /// A spoken description of the mascot for VoiceOver.
    var dragonDescription: LocalizedStringResource {
        switch self {
        case .calm: "A calm green dragon smiling with its eyes closed"
        case .grumpy: "A slightly grumpy dragon with a flat little mouth"
        case .annoyed: "An annoyed orange dragon frowning, with smoke puffing from its nose"
        case .angry: "A furious red dragon breathing fire"
        }
    }

    /// Only a properly angry dragon breathes fire.
    var breathesFire: Bool {
        self == .angry
    }

    /// Calm dragons close their eyes in a happy squint instead of showing brows.
    var hasRelaxedEyes: Bool {
        self == .calm
    }

    /// How steeply the eyebrows slope toward the nose, in degrees.
    var browAngle: Double {
        switch self {
        case .calm: 0
        case .grumpy: 8
        case .annoyed: 18
        case .angry: 28
        }
    }

    /// Mouth shape: 1 is a big smile, -1 is a deep frown.
    var mouthCurvature: Double {
        switch self {
        case .calm: 1
        case .grumpy: 0.15
        case .annoyed: -0.7
        case .angry: -1
        }
    }

    /// The dragon's scale color, warming up as anger rises.
    var dragonColor: Color {
        switch self {
        case .calm: Color(red: 0.42, green: 0.78, blue: 0.47)
        case .grumpy: Color(red: 0.55, green: 0.72, blue: 0.40)
        case .annoyed: Color(red: 0.95, green: 0.62, blue: 0.30)
        case .angry: Color(red: 0.90, green: 0.33, blue: 0.28)
        }
    }

    /// Accent used for the background and the selected mood card.
    var tint: Color {
        switch self {
        case .calm: .mint
        case .grumpy: .yellow
        case .annoyed: .orange
        case .angry: .red
        }
    }

    /// Blush on the dragon's cheek, getting redder with anger.
    var cheekOpacity: Double {
        0.35 + Double(rawValue) * 0.15
    }
}
