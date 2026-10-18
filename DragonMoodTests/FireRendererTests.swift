import Testing
@testable import DragonMood

struct FireRendererTests {
    @Test(arguments: 0..<200)
    func noiseStaysInUnitRange(seed: Int) {
        let value = FireRenderer.noise(Double(seed), salt: 3)
        #expect(value >= 0 && value < 1)
    }

    @Test func noiseIsDeterministic() {
        #expect(FireRenderer.noise(42, salt: 1) == FireRenderer.noise(42, salt: 1))
    }
}
