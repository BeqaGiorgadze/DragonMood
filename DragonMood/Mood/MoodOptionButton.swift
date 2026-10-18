import SwiftUI

/// One selectable mood card with an emoji and a title.
struct MoodOptionButton: View {
    let level: AngerLevel
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Text(level.emoji)
                    .font(.largeTitle)
                    .accessibilityHidden(true)

                Text(level.title)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity, minHeight: 96)
            .padding(8)
            .background(
                isSelected ? level.tint.opacity(0.25) : Color.secondary.opacity(0.1),
                in: .rect(cornerRadius: 22)
            )
            .overlay {
                RoundedRectangle(cornerRadius: 22)
                    .strokeBorder(isSelected ? level.tint : .clear, lineWidth: 3)
            }
            // A checkmark marks the selection without relying on color alone.
            .overlay(alignment: .topTrailing) {
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.title3)
                        .foregroundStyle(level.tint)
                        .padding(8)
                        .accessibilityHidden(true)
                }
            }
            .contentShape(.rect(cornerRadius: 22))
        }
        .buttonStyle(.plain)
        .accessibilityAddTraits(isSelected ? .isSelected : [])
    }
}

#Preview {
    HStack {
        MoodOptionButton(level: .calm, isSelected: false) { }
        MoodOptionButton(level: .angry, isSelected: true) { }
    }
    .padding()
}
