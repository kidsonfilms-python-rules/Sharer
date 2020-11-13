
import 'dart:async';

import 'package:flutter/services.dart';

class Sharer {
  // Future<String> getBattery() async {
  //    const platform = MethodChannel('sharer.example.com/battery');
  //    try {
  //    final batteryLevel = await platform.invokeMethod('getBatteryLevel');
  //    return batteryLevel;
  //    } on PlatformException catch(e) {
  //     return 'FAILURE error = ' + e.toString();
  //    }
  // }

static const MethodChannel _channel = const MethodChannel('SharerPlugin');

  static register() async {
    final String callback = await _channel.invokeMethod('register');
    print(callback);
  }

  static Future<String> getShared(MethodChannel channel) async {
    final String callback = await channel.invokeMethod('getSharedText');
    print(callback);
    return callback;
  }
}
