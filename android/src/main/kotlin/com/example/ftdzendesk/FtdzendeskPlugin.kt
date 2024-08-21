package com.example.ftdzendesk




import android.app.Activity
import android.content.Context
import android.content.Intent
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry
import zendesk.chat.Chat
import zendesk.chat.ChatConfiguration
import zendesk.chat.ChatEngine
import zendesk.chat.ChatMenuAction
import zendesk.chat.VisitorInfo
import zendesk.classic.messaging.MessagingActivity

/** FtdzendeskPlugin */
class FtdzendeskPlugin: FlutterPlugin, MethodCallHandler, ActivityAware, PluginRegistry.ActivityResultListener {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: Context
  private var activity: Activity? = null
  private var binding: ActivityPluginBinding? = null

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "ftdzendesk")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "getPlatformVersion" -> {
          result.success("Android ${android.os.Build.VERSION.RELEASE}")
      }
      "initialize" -> {
        initialize(call)
        result.success(true)
      }
      "setVisitorInfo" -> {
        setVisitorInfo(call)
        result.success(true)
      }
      "startChat" -> {
        startChat(call)
        result.success(true)
      }
      "addTags" -> {
        addTags(call)
        result.success(true)
      }
      "removeTags" -> {
        removeTags(call)
        result.success(true)
      }
      else -> {
        result.notImplemented()
      }
    }
  }


  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    context = binding.activity
}
  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
  override fun onDetachedFromActivityForConfigChanges() {
    this.binding = null
  }

  override fun onDetachedFromActivity() {
    this.binding = null  
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    binding.addActivityResultListener(this)
    this.binding = binding
    this.activity = binding.getActivity()
  }
  override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
    return false
}




 
  fun initialize(call: MethodCall) {

    val accountKey = call.argument<String>("accountKey") ?: ""
    val applicationId = call.argument<String>("appId") ?: ""

    Chat.INSTANCE.init(context, accountKey, applicationId)
  }

  fun setVisitorInfo(call: MethodCall) {
    val name = call.argument<String>("name") ?: ""
    val email = call.argument<String>("email") ?: ""
    val phoneNumber = call.argument<String>("phoneNumber") ?: ""
    val department = call.argument<String>("department") ?: ""

    val profileProvider = Chat.INSTANCE.providers()?.profileProvider()
    val chatProvider = Chat.INSTANCE.providers()?.chatProvider()

    val visitorInfo = VisitorInfo.builder()
                                    .withName(name)
                                    .withEmail(email)
                                    .withPhoneNumber(phoneNumber) // numeric string
                                    .build()
    profileProvider?.setVisitorInfo(visitorInfo, null)
    chatProvider?.setDepartment(department, null)
  }

  fun addTags(call: MethodCall) {
    val tags = call.argument<List<String>>("tags") ?: listOf<String>()
    val profileProvider = Chat.INSTANCE.providers()?.profileProvider()
    profileProvider?.addVisitorTags(tags, null)
  }

  fun removeTags(call: MethodCall) {
    val tags = call.argument<List<String>>("tags") ?: listOf<String>()
    val profileProvider = Chat.INSTANCE.providers()?.profileProvider()
    profileProvider?.removeVisitorTags(tags, null)
  }

  fun startChat(call: MethodCall) {
    val isPreChatFormEnabled = call.argument<Boolean>("isPreChatFormEnabled") ?: true
    val isAgentAvailabilityEnabled = call.argument<Boolean>("isAgentAvailabilityEnabled") ?: true
    val isChatTranscriptPromptEnabled = call.argument<Boolean>("isChatTranscriptPromptEnabled") ?: true
    val isOfflineFormEnabled = call.argument<Boolean>("isOfflineFormEnabled") ?: true
    val chatConfigurationBuilder = ChatConfiguration.builder()
    chatConfigurationBuilder
        .withAgentAvailabilityEnabled(isAgentAvailabilityEnabled)
        .withTranscriptEnabled(isChatTranscriptPromptEnabled)
        .withOfflineFormEnabled(isOfflineFormEnabled)
        .withPreChatFormEnabled(isPreChatFormEnabled)
        .withChatMenuActions(ChatMenuAction.END_CHAT)

    val chatConfiguration = chatConfigurationBuilder.build()

    MessagingActivity.builder()
    .withToolbarTitle("Soporte")
    .withEngines(ChatEngine.engine())
    .show(context, chatConfiguration)
  }
}
