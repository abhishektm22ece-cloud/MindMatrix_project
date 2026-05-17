
# Sahyadri-Samrakshane Live Demo Guide

Use this guide for a 3 to 5 minute project demonstration.

## Before Demo

1. Build the APK:

   ```powershell
   cd "C:\Users\naray\OneDrive\Documents\New project\Sahyadri-Samrakshane"
   $env:JAVA_HOME="D:\Program Files\Android\Android Studio\jbr"
   $env:Path="$env:JAVA_HOME\bin;$env:Path"
   .\gradlew.bat :app:assembleDebug
   ```

2. Run the app on emulator or phone.
3. Keep internet ON for first demo.
4. Keep location enabled.
5. Keep camera permission and location permission allowed.

## Login

Use:

```text
Email: abhishektm.22ece@cambridge.edu.in
Password: abhi@2003
```

Demo line:

> This login protects the reporting dashboard. If wrong credentials are entered, the owner is alerted.

## Demo Flow

### 1. Explain Problem

Say:

> The Western Ghats are eco-sensitive. Local people may see forest fires, landslides, illegal tree cutting, or wildlife sightings, but officials often receive information late or without exact coordinates.

### 2. Show Report Screen

Action:

1. Open `Report`.
2. Select `Forest Fire` or `Landslide`.
3. Tap `GPS Lock`.

Say:

> The app captures high-accuracy GPS using FusedLocationProviderClient. Coordinates are visible before submitting so the reporter knows the exact location is attached.

### 3. Capture Photo

Action:

1. Tap `Capture`.
2. Point camera at any object for demo.

Say:

> CameraX is used for photo capture. When the photo is captured, the app refreshes GPS so the report is tied to the latest location.

### 4. Submit Alert

Action:

1. Add note:

   ```text
   Smoke seen near trekking path.
   ```

2. Tap `Submit Alert`.

Say:

> Even if signal is weak, the alert is cached locally and queued for sync.

### 5. Dashboard

Action:

1. Open `Dashboard`.
2. Show alert type, photo, GPS, status, and sync state.
3. Tap `Advance Status`.

Say:

> Forest staff can update status from Reported to Verified and Team Dispatched. This mock dashboard represents Firebase sync.

### 6. Offline Demo

Action:

1. Turn internet OFF.
2. Submit another alert.
3. Open `Dashboard`.
4. Show `Offline queue`.
5. Turn internet ON.
6. Tap `Sync Mock Firebase Dashboard`.

Say:

> This satisfies the low-signal requirement. Reports are not lost; they sync when network returns.

### 7. Education

Action:

1. Open `Education`.
2. Show eco-sensitive zone tips.

Say:

> The app is not only for reporting. It also teaches safe behavior in sensitive forest zones.

## Success Criteria Checklist

- CameraX photo capture: present.
- GPS coordinates visible on report screen: present.
- Alert types: present.
- Alert statuses: present.
- Low-signal caching: present.
- Mock Firebase dashboard: present.
- Nature-friendly colors: present.
- Education/tips: present.
- Wrong-login owner alert: present.

## If Something Fails During Demo

### GPS does not lock

Say:

> On indoor emulator demos, GPS can take time. On a real phone outdoors, FusedLocationProviderClient gives accurate coordinates.

Then continue by showing dashboard and offline queue.

### Camera is blank

Say:

> Camera requires emulator camera setup or a real Android phone. The implementation uses CameraX and works with granted camera permission.

Use a real phone if possible.

### Internet is slow

Say:

> The offline queue is designed for low-signal areas, so reports remain saved until sync is available.

## Closing Line

> Sahyadri-Samrakshane converts local observation into actionable, GPS-tagged ecological alerts, helping forest teams respond faster to threats in the Western Ghats.
