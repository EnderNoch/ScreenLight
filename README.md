# ScreenLight

A tiny macOS app that turns your Mac's screen into a controllable fill light (a "softbox"
for video calls). Pick a brightness and a color, hit **Light / Światło**, and the whole
screen fills with that color at the brightness you chose. Tap **any key or the trackpad** to
go back to the options.

## Features

- **Brightness slider** 0–100 with tick notches at 0 / 25 / 50 / 75 / 100.
- **Light / Światło** button sets the Mac's real backlight and shows a fullscreen color.
- **Color** picker (white by default, or any custom color).
- **Dismiss** by pressing any key, a modifier, or clicking/tapping the trackpad — this
  returns to the options screen and **restores your previous brightness**.
- **Launch at login** toggle so the options screen is ready on startup.
## Download
Download the ScreenLight.zip file and open it and move to Applications folder
## Build

Requires the Swift toolchain (Command Line Tools or Xcode):

```bash
chmod +x build.sh   # first time only
./build.sh
```

This compiles the sources and assembles `ScreenLight.app` (ad-hoc signed).

## Run

```bash
open ScreenLight.app
```

### First launch (Gatekeeper)

Because the app is ad-hoc signed (not notarized), macOS may refuse the first launch.
Right-click `ScreenLight.app` → **Open** → **Open**, or move it to `/Applications` first.
You only need to do this once.

## Notes

- **Hardware brightness** uses the private `DisplayServices` framework (the only way to drive
  the backlight programmatically on Apple Silicon). It targets the built-in display
  (`CGMainDisplayID`). If a future macOS removes the symbol, the on-screen light still works;
  only the backlight change is skipped.
- **External monitors** ignore the backlight call (that would need DDC/CI, out of scope), but
  the color overlay still covers every connected screen.
