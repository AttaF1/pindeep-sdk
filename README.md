Certainly! Here's a properly structured and professional version of your Pindeep SDK documentation, preserving all the details and improving clarity, formatting, and consistency:

---

# 📦 Pindeep SDKs

Official SDKs for integrating with [**pindeep.link**](https://pindeep.link) — a smart, cross-platform deep linking system.

---

## 📁 SDKs Included

* **`pindeep_flutter/`** – Flutter (Dart) SDK
* **`pindeep_android/`** – Android SDK (Java)
* **`PindeepSDK/`** – iOS SDK (Swift)

---

## 🔐 Getting Started

1. **Sign up** at [pindeep.link](https://pindeep.link).
2. **Get your API Key** from your dashboard after signing in.

---

## 🐦 Flutter SDK

### ✅ Installation

Add the SDK to your `pubspec.yaml`:

```yaml
dependencies:
  pindeep_flutter:
    path: ./pindeep_flutter
```

### 🚀 Usage

```dart
import 'package:pindeep_flutter/pindeep_flutter.dart';

final manager = PindeepManager(apiKey: "your_api_key");

final link = await manager.createLink(DeepLinkData(
  androidUrl: "https://playstore.com/app",
  iosUrl: "https://appstore.com/app",
  webUrl: "https://example.com",
  title: "My Promo",
  oneTimeUse: false,
));

print(link); // Outputs the short deep link
```

---

## 🤖 Android SDK (Java)

### ✅ Setup

1. Add the `pindeep_android/` module to your Android project.
2. Add the following dependency to your `build.gradle`:

```gradle
implementation 'com.squareup.okhttp3:okhttp:4.10.0'
```

### 🚀 Usage

```java
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
```

---

## 🍎 iOS SDK (Swift)

### 🚀 Usage

```swift
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
```

---

## 📊 API Endpoints

| Endpoint                  | Description                  |
| ------------------------- | ---------------------------- |
| `/api/create.php`         | Create a short link          |
| `/api/stats.php?code=XYZ` | View stats for a link        |
| `/api/update.php`         | Update a link                |
| `/api/delete.php`         | Delete a link                |
| `/api/verify-key.php`     | Verify your API key          |
| `/api/deferred.php`       | Handle deferred deep linking |

---

## 🔗 Example Link

A generated short link will look like:

```
https://pindeep.link/abc123
```

This link intelligently redirects users based on their device and whether your app is installed.

---

## 📬 Support

Have questions or issues?
👉 [Open an issue](https://pindeep.link) or reach out via our website.
---