# 📦 Pindeep SDKs

Official SDKs for using [pindeep.link](https://pindeep.link) — the smart, cross-platform deep linking system.

## 📁 SDKs Included

- `pindeep_flutter/` – Dart/Flutter SDK
- `pindeep_android/` – Android (Java) SDK
- `PindeepSDK/` – iOS (Swift) SDK

---

## 🔐 Get Started

> 📌 First, sign up at [https://pindeep.link](https://pindeep.link) and get your API Key from your dashboard.

---

## 🐦 Flutter SDK

### ✅ Install
Add to `pubspec.yaml`:
```yaml
dependencies:
  pindeep_flutter:
    path: ./pindeep_flutter


✅ Usage

import 'package:pindeep_flutter/pindeep_flutter.dart';

final manager = PindeepManager(apiKey: "your_api_key");

final link = await manager.createLink(DeepLinkData(
  androidUrl: "https://playstore.com/app",
  iosUrl: "https://appstore.com/app",
  webUrl: "https://example.com",
  title: "My Promo",
  oneTimeUse: false,
));

print(link); // => short deep link

____________________________________________________________________________________

🤖 Android SDK
✅ Setup
Add pindeep_android/ as a module in your Android project.

Add implementation 'com.squareup.okhttp3:okhttp:4.10.0' to your app's build.gradle.

✅ Usage
java
Copy
Edit
PindeepClient client = new PindeepClient("your_api_key", "https://pindeep.link/api");

JSONObject linkData = new JSONObject();
linkData.put("android_url", "https://play.google.com/app");
linkData.put("ios_url", "https://apple.com/app");
linkData.put("web_url", "https://example.com");

client.createLink(linkData, new Callback() {
  @Override
  public void onResponse(Call call, Response response) throws IOException {
    String responseBody = response.body().string();
    Log.d("Pindeep", responseBody);
  }

  @Override
  public void onFailure(Call call, IOException e) {
    e.printStackTrace();
  }
});
____________________________________________________________________________________

🍎 iOS SDK (Swift)
✅ Usage

let client = PindeepClient(apiKey: "your_api_key")

let data: [String: Any] = [
    "android_url": "https://play.google.com/app",
    "ios_url": "https://apple.com/app",
    "web_url": "https://example.com"
]

client.createLink(data: data) { result in
    switch result {
    case .success(let shortLink):
        print("Short link: \(shortLink)")
    case .failure(let error):
        print("Error: \(error)")
    }
}
📊 API Endpoints Reference
Endpoint	Description
/api/create.php	Create a short link
/api/stats.php?code=XYZ	View stats for a link
/api/update.php	Update a link
/api/delete.php	Delete a link
/api/verify-key.php	Verify your API key
/api/deferred.php	Handle deferred deep linking

📎 Example Link
A generated link will look like:

https://pindeep.link/abc123
It will redirect users smartly based on their device and app install state.

📬 Questions?
Open issues or reach out at https://pindeep.link.