import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ftdzendesk/ftdzendesk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _zendeskpluginPlugin = Ftdzendesk();
  final zendeskKey = 'XL0We4lIn0rDrrqKXyIdlR1BIq7cXeR3';
  final zendeskAppId = '345305153887080449';
  final user = {
    'name': 'Yaniel',
    'email': 'yaniel.gomez@farmatodo.com',
    'phone': '+570000000000',
  };
  final department = 'Soporte 24 horas';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    await _zendeskpluginPlugin.initialize(
      zendeskKey,
      zendeskAppId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: Column(
          children: [
            TextButton(
              onPressed: openChat,
              child: const Text('Open Chat'),
            ),
          ],
        )),
      ),
    );
  }

  openChat() async {
    await _zendeskpluginPlugin.setVisitorInfo(
      name: user['name'],
      email: user['email'],
      phoneNumber: user['phone'],
      department: department,
    );

    try {
      await _zendeskpluginPlugin.startChat(
        primaryColor: Colors.blue,
        isAgentAvailabilityEnabled: false,
        isPreChatFormEnabled: false,
      );
    } catch (_) {
      const SnackBar(
        content: Text('Error al abrir el chat'),
      );
    }
  }
}
