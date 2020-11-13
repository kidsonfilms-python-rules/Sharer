# Shared

A plugin to get data from other applications.

## Installation
Insert this line in your `pubspec.yaml`:
```yaml
sharer: ^1.0.0
```

## Getting Started (Android Only)
### Android
Insert this intent in your `<activity>` tag in your `AndroidManifest.xml`:
```xml
<intent-filter>
            <action android:name="android.intent.action.SEND"/>
            <category android:name="android.intent.category.DEFAULT"/>
            <data android:mimeType="text/*"/>
            </intent-filter>
```

Edit `MainActivity` in your `MainActivity.java` file to have the following:
```java
public class MainActivity extends FlutterActivity {
  ...

  private String sharedText;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    // GeneratedPluginRegistrant.registerWith(this);
    Intent intent = getIntent();
    String action = intent.getAction();
    String type = intent.getType();

    if (Intent.ACTION_SEND.equals(action) && type != null) {
      if ("text/plain".equals(type)) {
        handleSendText(intent); // Handle text being sent
      }
    }

    new MethodChannel(getFlutterView(), "SharerPlugin").setMethodCallHandler(
      new MethodCallHandler() {
        @Override
        public void onMethodCall(MethodCall call, MethodChannel.Result result) {
          if (call.method.contentEquals("getSharedText")) {
            result.success(sharedText);
            sharedText = null;
          }
        }
      });
  }

  void handleSendText(Intent intent) {
    sharedText = intent.getStringExtra(Intent.EXTRA_TEXT);
  }
}
```

### iOS Coming Soon
...
### Dart
Import using:
```dart
import 'package:sharer/shared.dart';
```

## Usage
Ust the following to register the app:
```dart
Sharer.register();
```

Use the following to get data:
```dart
const channel = const MethodChannel('SharerPlugin');
var sharedData = Sharer.getShared(channel);
print(sharedData);
// Prints a String (e.g. Shared YouTube Video => https://youtu.be/dQw4w9WgXcQ)
```


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
