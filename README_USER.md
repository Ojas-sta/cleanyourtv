# Clean Your TV — Setup Summary for TCL T6C (Google TV 12)

Your **TCL T6C** (G10 platform, Android 12) has been debloated and transformed into a clean, ad-free **Apple TV 4K** experience.

---

## 📸 Before & After

| Before (Stock Google TV) | After (Apple TV Style) |
|---|---|
| Sponsored banners, recommendation rows, manufacturer promos, and clutter | Pitch-black home, 4-app rounded dock, dynamic top shelf with ambient glow, and quick frosted pills |

Screenshots pulled directly from your TV are saved under [`shots/`](shots/):
- `shots/00-initial.png`: Baseline stock Google TV
- `shots/02-new-home.png`: New Apple TV style Home screen
- `shots/03-focus-prime.png`: Prime Video focused with ambient glow
- `shots/04-grid-apps.png`: App grid sliding up on D-pad Down
- `shots/07-inputs-dropdown.png`: Compact glass Inputs switcher (HDMI 1, 2, 3, AV, Live TV)

---

## ⚡ What Was Done

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

4. **Apple TV Launcher Installed**:
   - Built native Android TV launcher (523 KB)
   - Configured 4 dock apps: **Apple TV**, **Prime Video**, **YouTube**, **JioHotstar**
   - Configured TCL BT_RC833 remote shortcuts:
     - Netflix button -> Netflix
     - YouTube button -> YouTube
     - Prime Video button -> Prime Video
     - Web button -> Apple TV
     - Settings gear button -> TV Settings

---

## 🛠️ Helpful Commands

### 1. Re-enable Any App
Everything was disabled via `pm disable-user --user 0`, so nothing was uninstalled. To re-enable any package:
```bash
tools/tv.py 'pm enable --user 0 <package_name>'
```
For example, to re-enable TalkBack:
```bash
tools/tv.py 'pm enable --user 0 com.google.android.marvin.talkback'
```

### 2. Change Dock Order or Apps
To change the apps in the dock or reorder them:
1. Open [`launcher/app/src/main/res/values/config.xml`](launcher/app/src/main/res/values/config.xml).
2. Edit the `<string-array name="dock_apps">` section.
3. Run:
```bash
./build_and_install_my_tv.sh
```

Alternatively, you can also reorder apps directly on the TV screen by holding the **OK** button on any tile and choosing **Move**.

### 3. Switch Themes or Wallpapers
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

### 4. One-Click Restore to Stock Google TV
If you ever want to completely undo all changes and return to the original Google TV home screen:
```bash
./restore_my_tv.sh
```
