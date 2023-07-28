# goodsmanagementsystem

## envファイルの設定
firebaseFirestoreのoptionsとslackbotのwebHookUrlはenv設定をしてあるので各自の環境で設定してください。

例
lib\utils\env.dart
```
const webHookUrl = "";

// web firebase options
const webApiKey = '';
const webAppId = '';
const webMessagingSenderId = '';
const webProjectId = '';
const webAuthDomain = '';
const webStorageBucket = '';
const webMeasurementId = '';

// android firebase options
const androidApiKey = '';
const androidAppId = '';
const androidMessagingSenderId = '';
const androidProjectId = '';
const androidStorageBucket = '';

// ios firebase options
const iosApiKey = '';
const iosAppId = '';
const iosMessagingSenderId = '';
const iosProjectId = '';
const iosStorageBucket = '';
const iosIosClientId = '';
const iosIosBundleId = '';

// macos firebase options
const macosApiKey = '';
const macosAppId = '';
const macosMessagingSenderId = '';
const macosProjectId = '';
const macosStorageBucket = '';
const macIosClientId = '';
const macIosBundleId = '';

```

