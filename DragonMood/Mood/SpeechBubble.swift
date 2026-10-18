import SwiftUI

/// The dragon's speech bubble, with a little tail pointing up at the mascot.
struct SpeechBubble: View {
    let message: LocalizedStringResource

    var body: some View {
        Text(message)
            .font(.title3.weight(.semibold))
            .multilineTextAlignment(.center)
            .padding(.horizontal, 20)
            .padding(.vertical, 14)
            .frame(maxWidth: 420)
            .background(.regularMaterial, in: .rect(cornerRadius: 22))
            .overlay(alignment: .top) {
                Triangle()
                    .fill(.regularMaterial)
                    .frame(width: 22, height: 12)
                    .offset(y: -11)
                    .accessibilityHidden(true)
            }
    }
}

#Preview {
    SpeechBubble(message: AngerLevel.angry.dragonMessage)
        .padding()
}
