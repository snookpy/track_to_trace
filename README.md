# track_to_trace

A new Flutter project.


## Before Development

Get Token from https://track.thailandpost.co.th/dashboard then store in lib/config.dart
```dart
class Config {
  static String thaiPostApiKey = "BeV4EvNiUISfC-BTNjBLH^UdZmR0BUPlE8F@P\$UHZXJ1BmG0O=XqO|O1N\$X*CiReLnY3UiVLP6RkV9S*GtRxFsBq";
}
```

## TODOs

 - Convert date formating on Transportation widgets
 - Show some text or error message when tracking is empty or wrong barcode number on Transportation widgets
 - Add date field for Package and  should order by date when fetching this data
 - Stored token on sqlite because token has a mounth expire and change the logic of get token (now, check only token is not empty)
 - Localizations

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
