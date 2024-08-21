
import 'ftdzendesk_platform_interface.dart';

class Ftdzendesk {
  Future<String?> getPlatformVersion() {
    return FtdzendeskPlatform.instance.getPlatformVersion();
  }
}
