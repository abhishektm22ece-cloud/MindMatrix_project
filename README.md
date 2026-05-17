# Sahyadri-Samrakshane

Sahyadri-Samrakshane is a standalone Android "Forest Sentinel" app for reporting ecological alerts in the Western Ghats. It is separate from any older beekeeper project.

## Login credentials

- Email: `abhishektm.22ece@cambridge.edu.in`
- Password: `abhi@2003`

If wrong credentials are entered, the app opens an owner alert email addressed to `abhishektm.22ece@cambridge.edu.in`. Android apps cannot silently send email/SMS from a personal device without a backend service or user-approved mail/SMS app, so this prototype uses the safest direct Android intent flow.

## What is built

- Login screen with the requested credentials.
- Ecological alert types:
  - Forest Fire
  - Landslide
  - Illegal Tree Cutting
  - Wildlife Sighting
- CameraX high-quality photo capture.
- FusedLocationProviderClient high-accuracy GPS lock.
- GPS coordinates displayed on screen while reporting.
- Offline-first queue using local storage.
- Automatic sync attempt when network returns.
- Mock Firebase-style dashboard with statuses:
  - Reported
  - Verified
  - Team Dispatched
- Education screen with eco-sensitive zone behavior tips.
- Nature-friendly green and earth-tone Material 3 UI.

## Open and run in Android Studio

1. Open Android Studio.
2. Choose `File > Open`.
3. Select:

   `C:\Users\naray\OneDrive\Documents\New project\Sahyadri-Samrakshane`

4. Wait for Gradle sync to finish.
5. Connect an Android phone or start an emulator.
6. Click `Run app`.
7. Allow Camera and Location permissions when the app asks.
8. Login with:

   `abhishektm.22ece@cambridge.edu.in`

   `abhi@2003`

## Demo flow

For a presentation-ready script, use:

`LIVE_DEMO.md`

1. Login.
2. Open the `Report` tab.
3. Select an alert type.
4. Tap `GPS Lock` and confirm coordinates are shown.
5. Tap `Capture` to attach a photo.
6. Add a note.
7. Tap `Submit Alert`.
8. Open `Dashboard`.
9. Confirm the alert appears with photo, coordinates, sync state, and status.
10. Tap `Advance Status` to move from `Reported` to `Verified` to `Team Dispatched`.
11. Turn off internet, submit another alert, then turn internet back on. The queued alert is marked synced when connectivity returns.

## Firebase upgrade steps

The project includes Firebase Firestore dependencies, but the current app uses a mocked sync repository so it works immediately without a Firebase account.

To connect real Firebase:

1. Create a Firebase project at <https://console.firebase.google.com/>.
2. Add an Android app with package name:

   `com.sahyadri.samrakshane`

3. Download `google-services.json`.
4. Place it in:

   `Sahyadri-Samrakshane\app\google-services.json`

5. In `app/build.gradle.kts`, add this plugin:

   ```kotlin
   id("com.google.gms.google-services")
   ```

6. Replace `AlertRepository.syncIfOnline()` with Firestore writes to a collection such as:

   ```text
   ecologicalAlerts/{alertId}
     type: string
     status: string
     lat: number
     lng: number
     accuracyMeters: number
     photoUri: string
     note: string
     createdAt: timestamp
     synced: boolean
   ```

For photo uploads in a final production version, add Firebase Storage and upload the image file, then store the download URL in Firestore.

## Build from terminal

From PowerShell:

```powershell
cd "C:\Users\naray\OneDrive\Documents\New project\Sahyadri-Samrakshane"
.\gradlew.bat :app:assembleDebug
```

The debug APK will be generated at:

`Sahyadri-Samrakshane\app\build\outputs\apk\debug\app-debug.apk`

## Java troubleshooting

If Gradle says `JAVA_HOME is set to an invalid directory`, install Android Studio or JDK 17, then set `JAVA_HOME` to the installed JDK path.

Example paths that often work:

```powershell
$env:JAVA_HOME="C:\Program Files\Android\Android Studio\jbr"
.\gradlew.bat :app:assembleDebug
```

or:

```powershell
$env:JAVA_HOME="C:\Program Files\Eclipse Adoptium\jdk-17"
.\gradlew.bat :app:assembleDebug
```
