# Dragon Mood 🐉🔥

A one-page SwiftUI app: pick how angry you are, and a cute dragon mascot reacts.
Calm → happy closed eyes and a smile. Grumpy → flat mouth. Annoyed → turns orange
and puffs smoke. Angry → turns red, raises its wings, shakes, and breathes fire.

## Run it

**Easiest (Xcode):**
1. Xcode → File → New → Project → iOS App. Name it `DragonMood`, Interface: SwiftUI, Testing: Swift Testing.
2. Delete the generated `ContentView.swift` and `DragonMoodApp.swift`.
3. Drag the `DragonMood/` folder's contents (`App`, `Mood`, `Dragon`, `Shapes`) into the app target,
   and the files in `DragonMoodTests/` into the test target.
4. Run on an iPhone simulator.

**Or with XcodeGen:** `xcodegen` in this folder, then open `DragonMood.xcodeproj`.

Targets iOS 27 / Swift 6. No third-party packages or image assets — the dragon is drawn with SwiftUI shapes.

## Structure

```
DragonMood/
  App/      DragonMoodApp
  Mood/     AngerLevel (all mood data), MoodScreen, MoodPicker, MoodOptionButton, SpeechBubble
  Dragon/   DragonView, DragonHead, DragonEye, SmokePuffs, FireBreathView, FireRenderer
  Shapes/   Triangle, WingShape, CurveShape
DragonMoodTests/  AngerLevelTests, FireRendererTests
```

## Accessibility

- VoiceOver describes the dragon for each mood; mood cards announce their selected state.
- Selection shows a checkmark, not just a color change.
- Reduce Motion: no shake, and a still flame replaces the animated particle fire.
- Dynamic Type fonts throughout; the mood grid reflows at large text sizes.
- Haptics: a tick on every change, a heavy thump when the dragon breathes fire.
