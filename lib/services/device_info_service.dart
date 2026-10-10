import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

class DeviceInfoService {
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  /// Retrieves the device model name and OS version.
  static Future<Map<String, String>> getDeviceInfo() async {
    String model = 'Unknown Device';
    String osVersion = 'Unknown OS';

    try {
      if (kIsWeb) {
        final WebBrowserInfo webInfo = await _deviceInfo.webBrowserInfo;
        model = webInfo.browserName.name;
        osVersion = webInfo.appVersion ?? 'Unknown';
      } else if (Platform.isAndroid) {
        final AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
        model = androidInfo.model;
        osVersion =
            'Android ${androidInfo.version.release} (API ${androidInfo.version.sdkInt})';
      } else if (Platform.isIOS) {
        final IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
        model = iosInfo.name;
        osVersion = '${iosInfo.systemName} ${iosInfo.systemVersion}';
      }
    } catch (e) {
      // Fallback values on error
    }

    return {
      'model': model,
      'osVersion': osVersion,
    };
  }
}
