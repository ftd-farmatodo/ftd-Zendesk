import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ftdzendesk_platform_interface.dart';

/// An implementation of [FtdzendeskPlatform] that uses method channels.
class MethodChannelFtdzendesk extends FtdzendeskPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ftdzendesk');

  @override
  Future<void> initialize(String accountKey, String appId) async {
    await methodChannel.invokeMethod<void>('initialize', {
      'accountKey': accountKey,
      'appId': appId,
    });
  }

  @override
  Future<void> setVisitorInfo({
    String? name,
    String? email,
    String? phoneNumber,
    String? department,
  }) async {
    await methodChannel.invokeMethod<void>('setVisitorInfo', {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'department': department,
    });
  }

  @override
  Future<void> startChat({
    Color? primaryColor,
    bool isPreChatFormEnabled = true,
    bool isAgentAvailabilityEnabled = true,
    bool isChatTranscriptPromptEnabled = true,
    bool isOfflineFormEnabled = true,
  }) async {
    await methodChannel.invokeMethod<void>('startChat', {
      'primaryColor': primaryColor?.value,
      'isPreChatFormEnabled': isPreChatFormEnabled,
      'isAgentAvailabilityEnabled': isAgentAvailabilityEnabled,
      'isChatTranscriptPromptEnabled': isChatTranscriptPromptEnabled,
      'isOfflineFormEnabled': isOfflineFormEnabled
    });
  }

  @override
  Future<void> addTags({List<String>? tags}) async {
    await methodChannel.invokeMethod<void>('addTags', {
      'tags': tags,
    });
  }

  @override
  Future<void> removeTags({List<String>? tags}) async {
    await methodChannel.invokeMethod<void>('removeTags', {
      'tags': tags,
    });
  }
}
