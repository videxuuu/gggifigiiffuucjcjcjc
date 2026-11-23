# Videx APK

App Android (WebView) que abre la web de Videx. La lógica sigue en tu servidor (index.php).

- Dominios: `MainActivity.java` → `DOMAINS`. La app prueba el último usado y, si cae, el resto a la vez.
- Compilar APK: `./gradlew assembleRelease` (JDK 17) → `app/build/outputs/apk/release/app-release.apk`
- Bitrise: workflow `build_apk` (bitrise.yml). GitHub: Actions → "Build APK" → Run workflow.
- El APK sale firmado con la clave de debug: sirve para instalar directo, no para Play Store.
