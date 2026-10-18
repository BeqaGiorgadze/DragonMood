import SwiftUI

/// Draws one frame of fire particles.
///
/// Particles are computed from the current time rather than stored, so there is
/// no per-frame state to manage: each particle loops through its own lifetime,
/// starting small and yellow at the mouth and growing larger, redder and fainter
/// as it travels outward in a cone.
nonisolated enum FireRenderer {
    static let particleCount = 70

    static func draw(in context: inout GraphicsContext, size: CGSize, time: TimeInterval) {
        context.addFilter(.blur(radius: 2.5))

        for index in 0..<particleCount {
            let seed = Double(index)
            let lifetime = 0.45 + 0.3 * noise(seed, salt: 1)
            let phaseOffset = noise(seed, salt: 2) * lifetime
            let progress = (time + phaseOffset).truncatingRemainder(dividingBy: lifetime) / lifetime

            // -1...1: where in the cone this particle travels.
            let spread = noise(seed, salt: 3) * 2 - 1
            let wobble = sin(time * 14 + seed) * 4 * progress

            let x = progress * size.width
            let y = size.height / 2 + spread * progress * size.height * 0.4 + wobble
            let radius = 5 + progress * 20 * (0.6 + 0.4 * noise(seed, salt: 4))

            let rect = CGRect(x: x - radius, y: y - radius, width: radius * 2, height: radius * 2)
            context.opacity = 1 - progress
            context.fill(Path(ellipseIn: rect), with: .color(color(at: progress)))
        }

        // A bright, flickering core right at the mouth.
        let coreRadius = 9 + sin(time * 30) * 2
        let core = CGRect(x: -coreRadius / 2, y: size.height / 2 - coreRadius, width: coreRadius * 2, height: coreRadius * 2)
        context.opacity = 1
        context.fill(Path(ellipseIn: core), with: .color(.yellow.mix(with: .white, by: 0.5)))
    }

    /// Flame color for a particle's age: yellow → orange → red.
    static func color(at progress: Double) -> Color {
        if progress < 0.5 {
            Color.yellow.mix(with: .orange, by: progress * 2)
        } else {
            Color.orange.mix(with: .red, by: (progress - 0.5) * 2)
        }
    }

    /// A cheap, deterministic pseudo-random value in `0..<1` for a given seed.
    static func noise(_ seed: Double, salt: Double) -> Double {
        let value = sin(seed * 12.9898 + salt * 78.233) * 43_758.5453
        return value - value.rounded(.down)
    }
}
