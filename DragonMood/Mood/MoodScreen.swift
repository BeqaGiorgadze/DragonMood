import SwiftUI

/// The app's single page: a dragon mascot that reacts to how angry you are.
struct MoodScreen: View {
    @State private var level = AngerLevel.calm
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                VStack(spacing: 6) {
                    Text("How angry are you?")
                        .font(.largeTitle.bold())

                    Text("Pick a mood and see how the dragon feels.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .multilineTextAlignment(.center)

                DragonView(level: level)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)

                SpeechBubble(message: level.dragonMessage)
                    .id(level)
                    .transition(.blurReplace)

                MoodPicker(selection: $level)
            }
            .padding()
        }
        .scrollBounceBehavior(.basedOnSize)
        .background {
            LinearGradient(
                colors: [level.tint.opacity(0.35), level.tint.opacity(0.05)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        }
        .animation(reduceMotion ? .easeInOut : .spring(duration: 0.5, bounce: 0.35), value: level)
        .sensoryFeedback(.selection, trigger: level)
        .sensoryFeedback(.impact(weight: .heavy, intensity: 1), trigger: level) { _, newLevel in
            newLevel.breathesFire
        }
    }
}

#Preview {
    MoodScreen()
}
