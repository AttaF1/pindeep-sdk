class DeepLinkData {
  final String androidUrl;
  final String iosUrl;
  final String webUrl;
  final String? fallbackUrl;
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? utmSource;
  final String? utmMedium;
  final String? utmCampaign;
  final Map<String, dynamic>? customData;
  final String? expiresAt;
  final bool oneTimeUse;
  final String? password;

  DeepLinkData({
    required this.androidUrl,
    required this.iosUrl,
    required this.webUrl,
    this.fallbackUrl,
    this.title,
    this.description,
    this.imageUrl,
    this.utmSource,
    this.utmMedium,
    this.utmCampaign,
    this.customData,
    this.expiresAt,
    this.oneTimeUse = false,
    this.password,
  });
  Map<String, dynamic> toJson() => {
    "android_url": androidUrl,
    "ios_url": iosUrl,
    "web_url": webUrl,
    "fallback_url": fallbackUrl,
    "title": title,
    "description": description,
    "image_url": imageUrl,
    "utm_source": utmSource,
    "utm_medium": utmMedium,
    "utm_campaign": utmCampaign,
    "custom_data": customData,
    "expires_at": expiresAt,
    "one_time_use": oneTimeUse,
    "password": password,
  };
}