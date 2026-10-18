import Testing
@testable import DragonMood

struct AngerLevelTests {
    @Test func onlyAngryBreathesFire() {
        let fireBreathers = AngerLevel.allCases.filter(\.breathesFire)
        #expect(fireBreathers == [.angry])
    }

    @Test func browsGetSteeperAsAngerRises() {
        let angles = AngerLevel.allCases.map(\.browAngle)
        #expect(angles == angles.sorted())
    }

    @Test func mouthGoesFromSmileToFrown() {
        let curves = AngerLevel.allCases.map(\.mouthCurvature)
        #expect(curves == curves.sorted(by: >))
        #expect(AngerLevel.calm.mouthCurvature > 0)
        #expect(AngerLevel.angry.mouthCurvature < 0)
    }

    @Test func onlyCalmHasRelaxedEyes() {
        #expect(AngerLevel.allCases.filter(\.hasRelaxedEyes) == [.calm])
    }
}
