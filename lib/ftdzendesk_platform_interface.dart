import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ftdzendesk_method_channel.dart';

abstract class FtdzendeskPlatform extends PlatformInterface {
  /// Constructs a FtdzendeskPlatform.
  FtdzendeskPlatform() : super(token: _token);

  static final Object _token = Object();

  static FtdzendeskPlatform _instance = MethodChannelFtdzendesk();

  /// The default instance of [FtdzendeskPlatform] to use.
  ///
  /// Defaults to [MethodChannelFtdzendesk].
  static FtdzendeskPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FtdzendeskPlatform] when
  /// they register themselves.
  static set instance(FtdzendeskPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
