import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:ftdzendesk/ftdzendesk.dart';
import 'package:ftdzendesk/ftdzendesk_method_channel.dart';
import 'package:ftdzendesk/ftdzendesk_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFtdzendeskPlatform
    with MockPlatformInterfaceMixin
    implements FtdzendeskPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> addTags({List<String>? tags}) {
    // TODO: implement addTags
    throw UnimplementedError();
  }

  @override
  Future<void> initialize(String accountKey, String appId) {
    // TODO: implement initialize
    throw UnimplementedError();
  }

  @override
  Future<void> removeTags({List<String>? tags}) {
    // TODO: implement removeTags
    throw UnimplementedError();
  }

  @override
  Future<void> setVisitorInfo(
      {String? name, String? email, String? phoneNumber, String? department}) {
    // TODO: implement setVisitorInfo
    throw UnimplementedError();
  }

  @override
  Future<void> startChat(
      {Color? primaryColor,
      bool isPreChatFormEnabled = true,
      bool isAgentAvailabilityEnabled = true,
      bool isChatTranscriptPromptEnabled = true,
      bool isOfflineFormEnabled = true}) {
    // TODO: implement startChat
    throw UnimplementedError();
  }
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
