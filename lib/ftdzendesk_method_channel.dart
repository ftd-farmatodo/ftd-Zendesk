import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ftdzendesk_platform_interface.dart';

/// An implementation of [FtdzendeskPlatform] that uses method channels.
class MethodChannelFtdzendesk extends FtdzendeskPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ftdzendesk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
