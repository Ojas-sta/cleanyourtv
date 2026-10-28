# Clean Your TV — Setup Summary for TCL T6C (Google TV 12)

Your **TCL T6C** (G10 platform, Android 12) has been debloated and transformed into a clean, ad-free **Apple TV 4K (tvOS 26)** experience.

---

## 📸 Live TV Verification Showcase

Screenshots pulled directly from your TV are saved under [`docs/apple-tv/`](docs/apple-tv/):
- `docs/apple-tv/20-apple-home.png`: Apple TV Home screen with Inter typography, 6-app liquid glass dock, and status pill controls
- `docs/apple-tv/21-apple-focus.png`: Focus on Bell button with 3D elevation and specular shine
- `docs/apple-tv/22-apple-clock-panel.png`: Interactive Clock capsule popup showing live seconds and full date in liquid glass
- `docs/apple-tv/23-apple-settings.png`: Apple TV tvOS settings dropdown menu
- `docs/apple-tv/24-apple-sounds.png`: Apple TV sound customization menu (nav ticks, app open pops)
- `docs/apple-tv/28-apple-aerials-store.png`: Apple Aerial Screensaver store with direct Apple CDN download support
- `docs/apple-tv/25-apple-dock-scroll.png`: Dock parking at top of screen with smooth vertical scroll into the app grid
- `docs/apple-tv/00-initial.png`: Baseline stock Google TV before debloat

---

## 🍎 Apple TV (tvOS 26) Features Installed

1. **Inter Typography Suite**:
   - Replaces system fonts with Rasmus Andersson's Inter (`inter_regular`, `inter_medium`, `inter_bold`, `inter_display_light`, `inter_display_extralight`).
   - "Good evening, [Date]" header and clock pill with proportional tabular numbers.

2. **Liquid Glass Capsules & Panels**:
   - Smoked liquid glass dock band holding 6 primary apps (**Apple TV**, **Prime Video**, **YouTube**, **JioHotstar**, **Games**, **BrowseHere**).
   - Top action buttons: **Bell** (mute/unmute sounds with hold for menu), **Reorder** (instant tile reorganization), **Inputs** (HDMI/AV sources), **Settings** (tvOS glass dropdown), and **Clock** (capsule pill).

3. **3D Focus Motion & Specular Shine**:
   - Dynamic 3D tilt responding to remote D-pad direction.
   - Elevation lift and drop shadow on focused items.
   - Specular highlight shine sweep across focused buttons and tiles.

4. **Interactive Clock & Seconds Panel**:
   - Clicking the Clock capsule opens a liquid glass card displaying live seconds (`HH:mm:ss`) and full date.

5. **Soft Audio Feedback**:
   - tvOS `nav_tick` on D-pad navigation and `open_pop` on launching apps.
   - Toggle audio on/off anytime using the Bell top button.

6. **Apple Aerial Screensavers**:
   - In-app store under **Settings → Background → Download aerials...** lets you stream/save 4K Apple aerial backdrops authenticated via Apple Root CA.

7. **Dock Parking**:
   - Scrolling down smoothly slides the dock band to the top of the screen where it locks into place while exploring the app grid.

---

## ⚡ What Was Done Under the Hood

1. **Safety Backup**:
   - Saved full package lists, system properties, and Android settings under [`backup/`](backup/).
   - Generated rollback record under `~/.cleanyourtv/` and backed it up to `backup/`.

2. **Debloat (23 bloatware / telemetry packages disabled)**:
   - **ACR Viewing Tracking**: `tv.samba.ssm.ui` (Samba TV Automatic Content Recognition)
   - **TCL Analytics & Telemetry**: `com.tcl.logkit`, `com.tcl.interactive`, `com.tcl.useragreement`, `com.tcl.usercenter`
   - **Content Rows & FAST Channels**: `com.tcl.channelplus`, `com.tcl.waterfall.overseas`, `com.tcl.tv.tclhome_passive`, `com.tcl.partnercustomizer`
   - **Retail Demo & Store Mode**: `com.tcl.exhibit`, `com.tcl.esticker`, `com.tcl.hotelmenu`, `com.tcl.initsetup`
   - **Unused Preloads**: `com.tcl.ocean.instructions`, `com.tcl.repairguide`, `com.tcl.guard`, `com.tcl.magiconnectfree`, `com.tcl.UpdatePeripheral`
   - **Partner Bloat**: `android.autoinstalls.config.google.gtvpai`, `com.google.android.feedback`, `com.google.android.marvin.talkback`

3. **Kept Untouched as Requested**:
   - All streaming & media apps (Netflix, Prime Video, YouTube, Apple TV, Hotstar, Spotify, F1 TV, Steam Link, Sony LIV, JioCinema)
   - Chromecast built-in (`com.google.android.apps.mediashell`)
   - Voice search & remote microphone (`com.google.android.tv.remote.service`)
   - Miracast / Screen mirroring (`com.tcl.airplay2`, `com.tcl.miracast`)
   - System firmware updates (`com.tcl.ttvs`)
   - TV tuner & HDMI player (`com.tcl.tv`, `com.tcl.tvinput`)
   - All TCL hardware bugfixes, CEC resolution, and vendor remote key mappings (Netflix, YouTube, Prime Video, Apple TV, Settings gear).

---

## 🛠️ Helpful Commands

### 1. Download Apple Aerials from Your Mac
```bash
cd /Users/roopalisingh/.gemini/antigravity/scratch/cleanyourtv
TV_HOST=169.254.183.189 .venv/bin/python tools/aerials.py --list
TV_HOST=169.254.183.189 .venv/bin/python tools/aerials.py --download "north_america_aurora.mov"
```

### 2. Switch Themes or Wallpapers
The launcher supports instant themes from [`themes/`](themes/) without rebuilding:
```bash
# Dark navy with soft teal/violet ambient glow:
tools/theme.sh themes/aurora

# Frosted glass dock with cinematic light:
tools/theme.sh themes/glass

# 14 rotating dark illustrated landscapes:
tools/theme.sh themes/scenes

# Reset back to the clean pitch-black Apple TV look:
tools/theme.sh --reset
```

### 3. Re-enable Any App
Everything was disabled via `pm disable-user --user 0`, so nothing was uninstalled. To re-enable any package:
```bash
tools/tv.py 'pm enable --user 0 <package_name>'
```

### 4. Rebuild & Reinstall Launcher
If you edit [`config.xml`](launcher/app/src/main/res/values/config.xml):
```bash
./build_and_install_my_tv.sh
```

### 5. One-Click Restore to Stock Google TV
If you ever want to completely undo all changes and return to the original Google TV home screen:
```bash
./restore_my_tv.sh
```
