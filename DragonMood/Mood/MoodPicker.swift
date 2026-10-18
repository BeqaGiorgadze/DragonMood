import SwiftUI

/// A grid of mood cards; two per row on phones, more on wider windows.
struct MoodPicker: View {
    @Binding var selection: AngerLevel

    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 12)], spacing: 12) {
            ForEach(AngerLevel.allCases) { level in
                MoodOptionButton(level: level, isSelected: level == selection) {
                    selection = level
                }
            }
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel("Anger level")
    }
}

#Preview {
    @Previewable @State var level = AngerLevel.annoyed
    MoodPicker(selection: $level)
        .padding()
}
