import SwiftUI

/// Two little smoke clouds drifting up from the nostrils of an annoyed dragon.
struct SmokePuffs: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(.gray.opacity(0.45))
                .frame(width: 12, height: 12)

            Circle()
                .fill(.gray.opacity(0.35))
                .frame(width: 16, height: 16)
                .offset(x: 12, y: -12)

            Circle()
                .fill(.gray.opacity(0.25))
                .frame(width: 20, height: 20)
                .offset(x: 26, y: -26)
        }
    }
}

#Preview {
    SmokePuffs()
}
