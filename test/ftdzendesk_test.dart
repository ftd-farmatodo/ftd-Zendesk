import 'package:flutter_test/flutter_test.dart';
import 'package:ftdzendesk/ftdzendesk.dart';
import 'package:ftdzendesk/ftdzendesk_platform_interface.dart';
import 'package:ftdzendesk/ftdzendesk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFtdzendeskPlatform
    with MockPlatformInterfaceMixin
    implements FtdzendeskPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FtdzendeskPlatform initialPlatform = FtdzendeskPlatform.instance;

  test('$MethodChannelFtdzendesk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFtdzendesk>());
  });

  test('getPlatformVersion', () async {
    Ftdzendesk ftdzendeskPlugin = Ftdzendesk();
    MockFtdzendeskPlatform fakePlatform = MockFtdzendeskPlatform();
    FtdzendeskPlatform.instance = fakePlatform;

    expect(await ftdzendeskPlugin.getPlatformVersion(), '42');
  });
}
