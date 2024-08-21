import 'dart:ui';

import 'ftdzendesk_platform_interface.dart';

class Ftdzendesk {
  Future<String?> getPlatformVersion() {
    return FtdzendeskPlatform.instance.getPlatformVersion();
  }

  Future<void> initialize(String accountKey, String appId) async {
    return await FtdzendeskPlatform.instance.initialize(accountKey, appId);
  }

  Future<void> setVisitorInfo({
    String? name,
    String? email,
    String? phoneNumber,
    String? department,
  }) async {
    return await FtdzendeskPlatform.instance.setVisitorInfo(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      department: department,
    );
  }

  Future<void> startChat({
    Color? primaryColor,
    bool isPreChatFormEnabled = true,
    bool isAgentAvailabilityEnabled = true,
    bool isChatTranscriptPromptEnabled = true,
    bool isOfflineFormEnabled = true,
  }) async {
    return await FtdzendeskPlatform.instance.startChat(
      primaryColor: primaryColor,
      isPreChatFormEnabled: isPreChatFormEnabled,
      isAgentAvailabilityEnabled: isAgentAvailabilityEnabled,
      isChatTranscriptPromptEnabled: isChatTranscriptPromptEnabled,
      isOfflineFormEnabled: isOfflineFormEnabled,
    );
  }

  Future<void> addTags({List<String>? tags}) async {
    return await FtdzendeskPlatform.instance.addTags(tags: tags);
  }

  Future<void> removeTags({List<String>? tags}) async {
    return await FtdzendeskPlatform.instance.removeTags(tags: tags);
  }
}
