import 'dart:ui';

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

  /// Initialize the Zendesk SDK with the provided [accountKey] and [appId]
  ///
  /// Offical Docs
  /// iOS: https://developer.zendesk.com/embeddables/docs/chat-sdk-v-2-for-ios/getting_started#initializing-the-sdk
  /// Android: https://developer.zendesk.com/embeddables/docs/chat-sdk-v-2-for-android/getting_started#initializing-the-sdk
  Future<void> initialize(String accountKey, String appId) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// Convenience utility to prefill visitor information and optionally set
  /// a support [department]
  Future<void> setVisitorInfo({
    String? name,
    String? email,
    String? phoneNumber,
    String? department,
  }) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// Open chat modal.
  ///
  /// Optionally set theme color on iOS using [primaryColor]
  ///
  /// If [isPreChatFormEnabled] is true, the pre-chat form will be shown to the user.
  ///
  /// If [isAgentAvailabilityEnabled] is true, offline message will be shown to the
  /// user in case no agent is available.
  ///
  /// If [isChatTranscriptPromptEnabled] is true, users are asked if they want to request a
  /// chat transcript at the end of the chat.
  ///
  /// If [isOfflineFormEnabled] is true, the offline form will be shown to the user.
  Future<void> startChat({
    Color? primaryColor,
    bool isPreChatFormEnabled = true,
    bool isAgentAvailabilityEnabled = true,
    bool isChatTranscriptPromptEnabled = true,
    bool isOfflineFormEnabled = true,
  }) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// Utility to optionaly add tags to the conversation. This can be set to
  /// a `List` of strings which will then appear to the agent in the chat.
  Future<void> addTags({List<String>? tags}) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// Utility to remove tags that were added to the conversation.
  Future<void> removeTags({List<String>? tags}) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
