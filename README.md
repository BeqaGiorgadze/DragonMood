# Dragon Mood 🐉🔥

A one-page SwiftUI app: pick how angry you are, and a cute dragon mascot reacts.
Calm → happy closed eyes and a smile. Grumpy → flat mouth. Annoyed → turns orange
and puffs smoke. Angry → turns red, raises its wings, shakes, and breathes fire.

## See it running

You need a Mac with **Xcode** (free from the Mac App Store, version 26 or newer).

1. Open Xcode. On the welcome window choose **Clone Git Repository…**
   (or menu **Integrate → Clone…**).
2. Paste `https://github.com/BeqaGiorgadze/DragonMood.git` and click **Clone**, then pick a folder.
3. Xcode opens `DragonMood.xcodeproj`. At the top of the window, pick an iPhone simulator
   (for example "iPhone 17").
4. Press the **▶ Run** button (or ⌘R). The simulator opens with the app.

Quicker peek without running: open `DragonMood/Dragon/DragonView.swift` and turn on the
canvas (**Editor → Canvas**, or ⌥⌘↩) to see the "Calm" and "Angry" previews.

Targets iOS 26+ / Swift 6. No third-party packages or image assets — the dragon is drawn with SwiftUI shapes.

## Structure

```
DragonMood.xcodeproj    Open this in Xcode
DragonMood/
  App/      DragonMoodApp
  Mood/     AngerLevel (all mood data), MoodScreen, MoodPicker, MoodOptionButton, SpeechBubble
  Dragon/   DragonView, DragonHead, DragonEye, SmokePuffs, FireBreathView, FireRenderer
  Shapes/   Triangle, WingShape, CurveShape
DragonMoodTests/  AngerLevelTests, FireRendererTests (run with ⌘U)
```

## Accessibility

- VoiceOver describes the dragon for each mood; mood cards announce their selected state.
- Selection shows a checkmark, not just a color change.
- Reduce Motion: no shake, and a still flame replaces the animated particle fire.
- Dynamic Type fonts throughout; the mood grid reflows at large text sizes.
- Haptics: a tick on every change, a heavy thump when the dragon breathes fire.
